package tw.com.softleader.e5e5.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/E715Member")
public class memberController {

	@Autowired
	private UserService userService;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPassword() {
		return "/e715/user/findPassWord1";
	}

	@RequestMapping(value = "/modifyFileAsk", method = RequestMethod.GET)
	public String modifyFileAsk() {
		return "/e715/user/modifyFileAsk";
	}

	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public String changePwd(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "/e715/user/changePassWord";
		}

		return "/e715/user/login";

	}

	@RequestMapping(value = "/updataPwd", method = RequestMethod.GET)
	public String updataPwd(@RequestParam("oldPwd") String oldPwd, @RequestParam("newPwd") String newPwd,
			@RequestParam("newPwdCheck") String newPwdCheck, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		if (user == null || !oldPwd.equals(user.getPassword())) {
			return "/e715/user/login";
		} else {
			if (newPwdCheck.equals(newPwd)) {
				userService.updataPwd(user.getAccount(), oldPwd, newPwd);
				return "/e715/user/modifyFileAsk";
			}
			log.error("密碼輸入不同");
			return "/e715/user/changePassWord";
		}

	}
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfile() {
		return "/e715/user/editProfile";
	}

}
