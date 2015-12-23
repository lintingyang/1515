package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/users")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/list")
	public String list(Model model){
		List<User> users = userService.findAll();
		model.addAttribute("getAllUser", users);
		return "/user/list";
	}
	
	@RequestMapping(value="/query")
	public String query(Model model ,@RequestParam String account) {
		User temp = userService.findByAccount(account);
		model.addAttribute("getOne", temp);
		return "/user/list";
	}
	
	@RequestMapping(value = "/edit")
	public String edit(Model model) {
//		User temp = userService.findByAccount(account);
//		model.addAttribute("getOne", temp);
		return "/user/edit";
	}

	@RequestMapping(value = "/update1")
	public String update1(Model model ,@RequestParam("account") String account) {
		User temp = userService.findByAccount(account);
		model.addAttribute("getOne", temp);
		return "/user/edit";
	}
	
	@RequestMapping(value = "/update")
	public String update(Model model ,@RequestParam("account") String account,@RequestParam("isolate") Character isolate ,@RequestParam("score") String changeScore) {
		System.out.println("====================================");
		System.out.println("====================================");
		System.out.println("====================================");
		System.out.println("====================================");
		System.out.println("====================================");
		System.out.println("====================================");
		System.out.println("====================================");
		System.out.println(account+"========================================"+isolate+"==================="+changeScore);
		
		try{
			int score = Integer.parseInt(changeScore);
			userService.updataIsolated(account, isolate);
			userService.drewScores(account, score);
			User temp = userService.findByAccount(account);
			model.addAttribute("getOne", temp);
			}
		catch(Exception e){
			
			userService.updataIsolated(account, isolate);
			User temp = userService.findByAccount(account);
			model.addAttribute("getOne", temp);
			
		}
		

		return "/user/edit";
	}
}
