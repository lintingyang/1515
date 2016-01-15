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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/head")
public class headerController {

	@Autowired
	private UserService userService;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/categoryhchange")
	@ResponseBody
	public void changecategory(@RequestParam("categoryname") String categoryname, HttpSession session) {
		log.error("categoryname =========" + categoryname);
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
			String temp = "就叫你用一鍵登入來開發了還硬要打字";
			return temp;
		} else {
			System.out.println(user);
			session.setAttribute("user", user);

			return "TRUE";
		}

	}

	@RequestMapping(value = "/search")
	public String searchproduct(@RequestParam("namelike") String like, Model model) {
		log.error(like);
		model.addAttribute("namelike", like);
		return "/index";
	}

	// 進入信箱確認
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String emailCheckPage() {
		return "/e715/user/emailCheck";
	}

	// 進入註冊帳號頁
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createAccountPage() {
		return "/e715/user/createaccount";
	}

	// 送驗證碼
	@RequestMapping(value = "/verificationCodeSend")
	@ResponseBody
	public boolean userVerificationCodeSend(@RequestParam("userSchoolEmail") String schoolEmail) {
		boolean result = false;
		int temp = userService.sendVerificationCode(schoolEmail);
		if (temp == 1) {
			result = true;
		}
		return result;
	}

	// 確認驗證碼
	@RequestMapping(value = "/verificationCodeCheck")
	public String userSchoolEmailCheck(@RequestParam("userSchoolEmail") String schoolEmail,
			@RequestParam("userVerificationCode") String userVerificationCode, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("checkError", errors);
		errors.clear();
		Integer verificationCode = null;
		try {
			verificationCode = Integer.parseInt(userVerificationCode);
			boolean temp = userService.checkVerificationCode(schoolEmail, verificationCode);
			if (temp) {
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

	// 註冊帳號
	@RequestMapping(value = "/insert")
	public String insert(Model model, @RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("nickname") String nickname, @RequestParam("sex") Sex sex,
			@RequestParam("month") String month, @RequestParam("day") String day, @RequestParam("year") String year,
			@RequestParam("phone") String phone, @RequestParam("email") String email, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("errors", errors);
		User user = new User();
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
		user.setPhone(phone);
		user.setEmail(email);
		User login = userService.insert(user);

		if (login != null) {
			session.setAttribute("user", login);
			return "redirect:/head/success";
		} else {
			// return "/e715/user/createaccount";
			return "redirect:/head/create";
		}

	}

	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public String createSuccess(HttpSession session) {

		return "/e715/user/insertSuccess";

	}

}
