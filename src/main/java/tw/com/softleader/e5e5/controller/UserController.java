package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/users")
public class UserController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/list")
	public String list(Model model){
		List<User> users = userService.findAll();
		model.addAttribute("getAllUser", users);
		return "/user/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/query", produces = "application/json")
	public User query(@RequestBody User user) {
		log.debug("{=====================================================================================}"+ user.getAccount());
		return userService.findByAccount(user.getAccount());
	}
	
	@RequestMapping(value = "/query1", method=RequestMethod.GET)
	public String query1(Model model ,@RequestParam("account") String account) {
		User temp = userService.findByAccount(account);
		model.addAttribute("findUser", temp);
		return "/user/list";
	}
	
	
	
	
	@RequestMapping(value = "/edit")
	public String edit(Model model) {
		return "/user/edit";
	}

	@RequestMapping(value = "/update1")
	public String update1(Model model ,@RequestParam("account") String account) {
		User temp = userService.findByAccount(account);
		model.addAttribute("findUser", temp);
		return "/user/edit";
	}
	
	@RequestMapping(value = "/update")
	public String update(Model model ,@RequestParam("account") String account,@RequestParam("isolate") Character isolate ,@RequestParam("score") String changeScore) {
		try{
			int score = Integer.parseInt(changeScore);
			userService.updataIsolated(account, isolate);
			userService.drewScores(account, score);
			User temp = userService.findByAccount(account);
			model.addAttribute("findUser", temp);
			}
		catch(Exception e){
			
			userService.updataIsolated(account, isolate);
			User temp = userService.findByAccount(account);
			model.addAttribute("findUser", temp);
			
		}
		

		return "/user/edit";
	}
}
