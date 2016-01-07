package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.Sex;
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
	//進入註冊帳號頁
	@RequestMapping(value = "/create" ,method = RequestMethod.GET)
	public String createAccountPage(){
		return "/e715/user/createaccount";
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

	//註冊帳號
	@RequestMapping(value = "/insert")
	public String insert(Model model, 
						@RequestParam("account") String account,
						@RequestParam("password") String password,
						@RequestParam("name") String name,
						@RequestParam("nickname") String nickname,
						@RequestParam("sex") Sex sex,
						@RequestParam("month") String month,
						@RequestParam("day") String day,
						@RequestParam("year") String year,
						@RequestParam("phone") String phone,
						@RequestParam("email") String email,
						HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("errors", errors);
		User user = new User();
		if(account ==null || account.length()==0){
			errors.put("account", "請輸入帳號");
		}
		if(password ==null || password.length()==0){
			errors.put("password", "請輸入密碼");
		}
		
		
		if(errors!=null && !errors.isEmpty()) {
			return "redirect:/head/create";
		}
		
		
		
		
		if(userService.findByAccount(account)!=null){
			errors.put("account", "帳號已存在");
			return "redirect:/head/create";
		}
		user.setAccount(account);
		user.setPassword(password);
		user.setName(name);
		user.setNickname(nickname);
		user.setSex(sex);
		if (!month.equals("") && month.length() < 2) {
			month = "0" + month;
		}
		if (!day.equals("") && day.length() < 2) {
			day = "0" + day;
		}
		String str = year + "-" + month + "-" + day+" 00:00"; //"1986-04-08";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		try {
			LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
			user.setBirthday(dateTime);
		} catch (Exception e) {
		}
		user.setPhone(phone);
		user.setEmail(email);
		User login = userService.insert(user);
		

		
		if(login!=null){
			session.setAttribute("user", login);
			return "redirect:/";
		}else{
//			return "/e715/user/createaccount";
			return "redirect:/head/create";
		}

	}
	

	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "/index";
	}

	
}
