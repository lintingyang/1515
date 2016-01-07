package tw.com.softleader.e5e5.web.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/E715Member")
public class memberController {

	@Autowired
	private ServletContext servletContext;

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

	@RequestMapping(value = "/updataInfo")
	public String updataInfo(Model model, 
			@RequestParam("file") MultipartFile file,
			@RequestParam("name") String name,
			@RequestParam("nickname") String nickname, @RequestParam("sex") Sex sex,
			//@RequestParam("month") String month, @RequestParam("day") String day, @RequestParam("year") String year,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("subject") String subject, @RequestParam("Addr") String addr,
			@RequestParam("aboutMe") String aboutMe, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		//必填欄位不能為空值
		if (user == null || name == null || nickname == null || phone == null) {
				return "/e715/user/editProfile";
		} else {
			
			//讀取新圖跟砍檔(別忘記jsp的enctype
			if (!file.isEmpty()) {
				String path = userService.upLoadImage(user.getId(), servletContext, file);
				user.setPicture(path);
			}

			user.setName(name);
			user.setNickname(nickname);
			//判斷是手機還是家電(基礎判斷)
			if (phone.substring(0, 1).equals("09")) {
				user.setCellphone(phone);
			} else {
				user.setPhone(phone);
			}
			user.setSex(sex);
			user.setSubject(subject);
			user.setEmail(email);
			user.setAddress(addr);
			user.setAboutMe(aboutMe);
			userService.update(user);
			return "/e715/user/editProfile";
		}
	}



}