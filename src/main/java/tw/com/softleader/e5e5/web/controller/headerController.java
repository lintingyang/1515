package tw.com.softleader.e5e5.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/head")
public class headerController {
	
	@Autowired
	private UserService userService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/login" ,method = RequestMethod.GET)
	public String loginPage(){
		return "/e715/user/login";
	}
	
	@RequestMapping(value = "/logincheck" ,method = RequestMethod.POST)
	public String loginCheck(Model model,@RequestParam("account")String account,
			@RequestParam("password")String password,HttpSession session){
	
		User user = userService.login(account, password);
		if(user == null){
			log.error("找不到該帳號");
		}else if(user != null){
			session.setAttribute("user", user);
			log.error("登入成功");
		}
		return "/index";
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "/index";
	}
	
}
