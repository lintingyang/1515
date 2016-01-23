package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.FocusUserList;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;
import tw.com.softleader.e5e5.entity.UserLike;
import tw.com.softleader.e5e5.entity.enums.Grade;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.service.ExchangeService;
import tw.com.softleader.e5e5.service.FocusUserListService;
import tw.com.softleader.e5e5.service.ProductCategoryService;
import tw.com.softleader.e5e5.service.ProductService;
import tw.com.softleader.e5e5.service.UserBanListService;
import tw.com.softleader.e5e5.service.UserLikeService;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/E715Member")
public class MemberController {

	@Autowired
	private ServletContext servletContext;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductCategoryService productCategoryService;
	@Autowired
	private UserLikeService userLikeService;
	@Autowired
	private UserBanListService userBanListService;
	@Autowired
	private FocusUserListService focusUserListService;

	@Autowired
	private ProductService productService;
	@Autowired
	private ExchangeService exchangeService;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping("/")
	public String home(Model model) {
		return "redirect:/";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String showUserPage(@PathVariable("id") final int id, final Model model, HttpSession session) {
		User myself = (User) session.getAttribute("user");
		if (myself == null) {
			return "redirect:/";
		}

		User user = userService.getOne(id);

		boolean relation = focusUserListService.findRelation(myself.getId(), user.getId());
		int good = 0;
		int bad = 0;
		List<Product> products = productService.findAllByUserId(id);
		if (products != null) {
			for (Product product : products) {
				log.error("sdfsf " + product.getGrade());
				if (product.getGrade() != null) {
					if (Grade.GOOD.equals(product.getGrade())) {
						good++;
					} else if (Grade.BAD.equals(product.getGrade())) {
						bad++;
					}
				}
			}
		}
		// List<Exchange> exchanges = exchangeService.findAll();
		// for (Exchange exchange : exchanges) {
		// if (id == exchange.getProductAId().getUserId().getId()) {
		// if (exchange.getGrade() != null) {
		// if (Grade.GOOD.equals(exchange.getGrade())) {
		// good++;
		// } else if (Grade.BAD.equals(exchange.getGrade())) {
		// bad++;
		// }
		// }
		// }
		// }
		model.addAttribute("relation", relation);
		model.addAttribute("currUser", user);
		model.addAttribute("good", good);
		model.addAttribute("bad", bad);

		return "/e715/user/myProfile";
	}

	// 找尋密碼頁面
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPasswordPage(HttpSession session) {
		session.removeAttribute("schoolEmail");
		return "/e715/user/findPassWord1";
	}

	// 找尋密碼第一步
	@RequestMapping(value = "/findPasswordStep1")
	@ResponseBody
	public boolean findPasswordStep1(@RequestParam("userSchoolEmail") String schoolEmail, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("checkError", errors);
		session.removeAttribute("schoolEmail");
		errors.clear();
		if (schoolEmail != null) {
			boolean findUser = userService.findBySchoolEmail(schoolEmail);
			if (findUser) {
				session.setAttribute("schoolEmail", schoolEmail);
				userService.sendVerificationCode(schoolEmail);
			}
			return findUser;
		} else {
			return false;
		}

	}

	// 找尋密碼第2步
	@RequestMapping(value = "/findPasswordStep2")
	public String findPasswordStep2(@RequestParam("schoolEmail") String schoolEmail,
			@RequestParam("verificationCode") String stVerificationCode, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("checkError", errors);
		errors.clear();
		Integer verificationCode = null;
		try {
			verificationCode = Integer.parseInt(stVerificationCode);
			boolean check = userService.checkVerificationCode(schoolEmail, verificationCode);
			if (check) {
				return "/e715/user/findPassWord2";
			} else {
				errors.put("checkFault", "驗證碼輸入錯誤，請重新輸入");
				return "/e715/user/findPassWord1ver";
			}
		} catch (NumberFormatException e) {
			errors.put("numberFault", "驗證碼請輸入數字");
			return "/e715/user/findPassWord1ver";
		}
	}
	
	// 找尋密碼第2步
		@RequestMapping(value = "/findPasswordStep2ver")
		public String findPasswordStep2ver(@RequestParam("verificationCode") String stVerificationCode, HttpSession session) {
			Map<String, String> errors = new HashMap<String, String>();
			session.setAttribute("checkError", errors);
			String schoolEmail =(String)session.getAttribute("schoolEmail");
			errors.clear();
			Integer verificationCode = null;
			try {
				verificationCode = Integer.parseInt(stVerificationCode);
				boolean check = userService.checkVerificationCode(schoolEmail, verificationCode);
				if (check) {
					return "/e715/user/findPassWord2";
				} else {
					errors.put("checkFault", "驗證碼輸入錯誤，請重新輸入");
					return "/e715/user/findPassWord1ver";
				}
			} catch (NumberFormatException e) {
				errors.put("numberFault", "驗證碼請輸入數字");
				return "/e715/user/findPassWord1ver";
			}
		}
	

	// 找尋密碼第3步
	@RequestMapping(value = "/findPasswordStep3")
	public String findPasswordStep3(@RequestParam("newPassword") String newPassword,
			@RequestParam("newPasswordCheck") String newPasswordCheck, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		session.setAttribute("checkPasswordError", errors);

		if (newPassword.equals(newPasswordCheck)) {
			String schoolEmail = (String) session.getAttribute("schoolEmail");
			User user = userService.loginBySchoolEmail(schoolEmail);
			user.setPassword(newPassword);
			userService.update(user);
			errors.clear();
			session.removeAttribute("schoolEmail");
			return "/e715/user/login";
		} else {
			errors.put("checkFault", "兩者密碼不相符合，請再輸入一次");
			return "/e715/user/findPassWord2";
		}
	}

	@RequestMapping(value = "/modifyFileAsk", method = RequestMethod.GET)
	public String modifyFileAsk(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "/e715/user/modifyFileAsk";
		}
		return "/e715/user/login";
	}

	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public String changePwd(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "/e715/user/changePassWord";
		} else {

			return "/e715/user/login";
		}

	}

	// 更新密碼
	@RequestMapping(value = "/updataPwd", method = RequestMethod.GET)
	public String updataPwd(Model model, @RequestParam("oldPwd") String oldPwd, @RequestParam("newPwd") String newPwd,
			@RequestParam("newPwdCheck") String newPwdCheck, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "/e715/user/login";
		} else {
			if (!oldPwd.equals(user.getPassword())) {
				model.addAttribute("oldPasswodFalse", "舊密碼輸入錯誤");
				return "/e715/user/changePassWord";
			} else {
				if (newPwd == null || newPwd.length() == 0) {
					model.addAttribute("nullNewPwd", "密碼不可為空值");
					return "/e715/user/changePassWord";
				} else {
					if (newPwdCheck.equals(newPwd)) {
						userService.updataPwd(user.getAccount(), oldPwd, newPwd);
						return "/e715/user/modifyFileAsk";
					}
					model.addAttribute("newPwdCheck", "密碼輸入不同");
					return "/e715/user/changePassWord";
				}

			}

		}
	}

	@RequestMapping(value = "/checkOldPwd")
	@ResponseBody
	public boolean checkOldPwd(HttpSession session, @RequestParam("oldPassword") String oldPassword) {
		boolean result = false;
		User user = (User) session.getAttribute("user");
		if (user.getPassword().equals(oldPassword)) {
			result = true;
		}
		return result;
	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfile(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<ProductCategory> productCategory = productCategoryService.getAll();
			List<UserLike> userLike = userLikeService.findUserLike(user.getId());
			model.addAttribute("userLikes", userLike);
			model.addAttribute("productCategorys", productCategory);
			return "/e715/user/editProfile";
		}
		return "/e715/user/login";
	}

	@RequestMapping(value = "/updataInfo")
	public String updataInfo(Model model, @RequestParam("file") MultipartFile file, @RequestParam("name") String name,
			@RequestParam("nickname") String nickname, @RequestParam("sex") Sex sex,
			@RequestParam("month") String month, @RequestParam("day") String day, @RequestParam("year") String year,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("subject") String subject, @RequestParam("addr") String addr,
			@RequestParam("aboutMe") String aboutMe, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "/e715/user/login";
		} else {

			// 必填欄位不得為空
			if (name == null || nickname == null || phone == null || year == null || month == null || day == null) {
				return "/e715/user/editProfile";
			} else {
				user.setName(name);
				user.setNickname(nickname);
				// 讀取新圖跟砍檔(別忘記jsp的enctype
				if (!file.isEmpty()) {
					// 使用者有圖片的話就砍黨
					if (user.getPicture()!=null) {
						userService.deleteImage(user.getId(), servletContext);
					}
					String path = userService.upLoadImage(user.getId(), servletContext, file);
					user.setPicture(path);
				}
				// 判斷是手機還是家電(基礎判斷)
				if (phone!=null){
				if (phone.substring(0,2).equals("09")) {
					user.setCellphone(phone);
				} else {
					user.setPhone(phone);
				}
				}
				if (!month.equals("") && month.length() < 2) {
					month = "0" + month;
				}
				if (!day.equals("") && day.length() < 2) {
					day = "0" + day;
				}
				String str = year + "-" + month + "-" + day + " 00:00"; // "1986-04-08";
				System.out.println(aboutMe);
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
				try {
					LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
					user.setBirthday(dateTime);
				} catch (Exception e) {
				}

				user.setSex(sex);
				user.setSubject(subject);
				user.setEmail(email);
				user.setAddress(addr);
				user.setAboutMe(aboutMe);
				userService.update(user);
				return "/e715/user/modifyFileAsk";
			}
		}
	}

	@RequestMapping(value = "/userFriend")
	public String userFriend(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "/e715/user/userFriendList";
		}
		return "/e715/user/login";
	}

	@RequestMapping(value = "/userFriendList")
	@ResponseBody
	public List<FocusUserList> userFriendList(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<FocusUserList> focus = focusUserListService.findOneUser(user.getId());
		return focus;
	}

	@RequestMapping(value = "/userBanList")
	@ResponseBody
	public List<UserBanList> userBanList(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<UserBanList> bans = userBanListService.findOneUser(user.getId());
		return bans;
	}

	@RequestMapping(value = "/userFriendListCancel")
	@ResponseBody
	public String userFriendListCancel(@RequestParam("userBId") User userBId, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String divClass = ".userShelf" + userBId.getId();
		focusUserListService.deletOne(user.getId(), userBId.getId());
		return divClass;
	}

	@RequestMapping(value = "/userFriendListAdd")
	@ResponseBody
	public String Add(@RequestParam("id") int id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int i = 0;
		if (user != null) {
			log.error("fdsafdf" + user.getId() + " : " + id);
			i = focusUserListService.insert(user.getId(), id);
		}
		if (i == 1) {
			return "Sucess";
		} else {
			return "Already had";
		}
	}

	@RequestMapping(value = "/userBanListCancel")
	@ResponseBody
	public String userBanListCancel(@RequestParam("userBId") User userBId, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String divClass = ".userShelf" + userBId.getId();
		if (user != null) {
			userBanListService.deletOne(user.getId(), userBId.getId());
		}
		return divClass;
	}

}

