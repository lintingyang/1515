package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;
import tw.com.softleader.e5e5.entity.enums.Role;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/head")
public class HeaderController {

	@Autowired
	private UserService userService;

	@Autowired
	private ServletContext servletContext;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/categoryhchange")
	@ResponseBody
	public void changecategory(@RequestParam("categoryname") String categoryname, HttpSession session) {
		session.setAttribute("categoryname", categoryname);
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "/e715/user/login";
		}
		return "redirect:/";
	}

	// 輸入完帳號密碼並按下登入鍵 進行登入檢查

	@RequestMapping(value = "/logincheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String loginCheck(Model model, @RequestParam("account") String account,
			@RequestParam("password") String password, HttpSession session) {
		User user = userService.login(account, password);
		if (user == null) {
			String loginError = "就叫你用一鍵登入來開發了還硬要打字";
			return loginError;
		} else {
			if (user.getIsolated().equals(TrueFalse.TRUE)) {
				user = null;
				String isolated = "帳號已被封鎖";
				return isolated;
			} else {
				session.setAttribute("user", user);
				return "TRUE";
			}
		}
	}

	@RequestMapping(value = "/search")
	public String searchproduct(@RequestParam("namelike") String like, Model model) {
		model.addAttribute("namelike", like);
		return "/index";
	}

	// 進入信箱確認
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String emailCheckPage() {
		return "/e715/user/emailCheck";
	}

	// // 進入註冊帳號頁
	// @RequestMapping(value = "/create", method = RequestMethod.GET)
	// public String createAccountPage() {
	// return "/e715/user/createaccount";
	// }

	// 送驗證碼
	@RequestMapping(value = "/verificationCodeSend")
	@ResponseBody
	public boolean userVerificationCodeSend(@RequestParam("userSchoolEmail") String schoolEmail,
			@RequestParam("chooseSchool") String schoolName) {
		boolean result = false;
		String userSchool = schoolEmail + schoolName;
		User userSchoolEmail = userService.loginBySchoolEmail(userSchool);
		if (userSchoolEmail != null) {
			String tempUser = userSchoolEmail.getAccount();
			if (tempUser == null) {
				int temp = userService.sendVerificationCode(userSchool);
				if (temp == 1) {
					result = true;
				} else {
					return result;
				}
			}
		} else {
			int temp = userService.sendVerificationCode(userSchool);
			if (temp == 1) {
				result = true;
			} else {
				return result;
			}
		}
		return result;
	}

	// 確認驗證碼
	@RequestMapping(value = "/verificationCodeCheck")
	public String userSchoolEmailCheck(@RequestParam("userSchoolEmail") String schoolEmailFormat,
			@RequestParam("chooseSchool") String schoolName,
			@RequestParam("userVerificationCode") String userVerificationCode, HttpSession session) {
		String schoolEmail = schoolEmailFormat + schoolName;
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("checkError", errors);
		errors.clear();
		Integer verificationCode = null;
		try {
			verificationCode = Integer.parseInt(userVerificationCode);
			boolean temp = userService.checkVerificationCode(schoolEmail, verificationCode);
			if (temp) {
				// 進入註冊帳號頁
				session.removeAttribute("userSchoolEmail");
				session.setAttribute("userSchoolEmail", schoolEmail);
				return "/e715/user/createaccount";
			} else {
				errors.put("checkFault", "驗證碼輸入錯誤，請重新輸入");
				return "/e715/user/emailCheck";
			}
		} catch (NumberFormatException e) {
			errors.put("numberFault", "驗證碼請輸入數字");
			return "/e715/user/emailCheck";
		}

	}

	// 確認帳號是否存在
	@RequestMapping(value = "/checkAccount")
	@ResponseBody
	public boolean checkAccount(@RequestParam("checkAccount") String account) {
		boolean result = false;
		User user = userService.findByAccount(account);
		if (user == null) {
			result = true;
		}
		return result;
	}

	// 註冊帳號
	@RequestMapping(value = "/insert")
	public String insert(Model model, @RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("nickname") String nickname, @RequestParam("sex") Sex sex,
			@RequestParam("month") String month, @RequestParam("day") String day, @RequestParam("year") String year,
			@RequestParam("phone") String phone, @RequestParam("email") String email, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("errors", errors);

		String schoolEmail = (String) session.getAttribute("userSchoolEmail");
		// 用學校信箱完善資料
		User user = userService.loginBySchoolEmail(schoolEmail);
		if (account == null || account.length() == 0) {
			errors.put("account", "請輸入帳號");
		}
		if (password == null || password.length() == 0) {
			errors.put("password", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "redirect:/head/create";
		}

		if (userService.findByAccount(account) != null) {
			errors.put("account", "帳號已存在");
			return "redirect:/head/create";
		}
		user.setPicture(userService.upDefaultImg(user.getId(), servletContext));
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
		String str = year + "-" + month + "-" + day + " 00:00"; // "1986-04-08";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		try {
			LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
			user.setBirthday(dateTime);
		} catch (Exception e) {
		}
		if (phone.substring(0, 2).equals("09")) {
			user.setCellphone(phone);
		} else {
			user.setPhone(phone);
		}
		user.setRole(Role.USER);
		user.setIsolated(TrueFalse.FALSE);

		user.setEmail(email);
		userService.update(user);
		User login = userService.login(account, password);
		if (login != null) {
			session.setAttribute("user", login);
			return "redirect:/head/success";
		} else {
			// return "/e715/user/createaccount";
			return "redirect:/head/create";
		}

	}

	// 完善資料
	@RequestMapping(value = "/completeMaterial")
	public String completeMaterial(@RequestParam("subject") String subject, @RequestParam("addr") String addr,
			@RequestParam("file") MultipartFile userFile, @RequestParam("aboutMe") String aboutMe,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "/e715/user/login";
		} else {
			user.setSubject(subject);
			user.setAddress(addr);
			user.setAboutMe(aboutMe);
			System.out.println("userFile--------------------" + userFile);
			try {
				String path = userService.upLoadImage(user.getId(), servletContext, userFile);
				user.setPicture(path);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			userService.update(user);
			return "/index";
		}
	}

	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String createSuccess(HttpSession session) {

		return "/e715/user/insertSuccess";

	}

	@RequestMapping(value = "/completeMaterialPage", method = RequestMethod.GET)
	public String completeMaterialPage() {
		return "/e715/user/completeMaterial";
	}

}
