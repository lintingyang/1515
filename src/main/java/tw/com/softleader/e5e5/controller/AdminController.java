package tw.com.softleader.e5e5.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.service.AdminService;

@Controller
@RequestMapping(value = "/admins")
public class AdminController {
	Logger log = Logger.getLogger(getClass());
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/list")
	public String list(Model model) {

		List<Admin> list = adminService.findAllAdmins();
		model.addAttribute("entity", list);
		return "/admin/list";
	}

	@ResponseBody
	@RequestMapping(value = "/query" ) // 用帳號搜尋管理員資料
	public List<Admin> query(@RequestBody Admin account) {
		log.error("account ========"+account);
		Admin admin1 = adminService.findByAccount(account.getAccount());
		List<Admin> list = new ArrayList<Admin>();
		list.add(admin1);
		

		return list;
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @ModelAttribute Admin admin) {
		adminService.deleteById(admin.getId());
		List<Admin> list = adminService.findAllAdmins();
		model.addAttribute("entity", list);
		return "/admin/list";
	}

	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/admin/add";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model, @ModelAttribute Admin admin) {
		int result = adminService.addNewAdmin(admin.getAccount(), admin.getAuthority(), admin.getName(),
				admin.getPassword(), admin.getEmail());
		if (result == 1) {
			log.error("add success!");
			model.addAttribute("message", "新增成功");
		} else {
			log.error("add error account exist!");
			model.addAttribute("message", "新增出錯！");
		}
		return "/admin/add";
	}

	@RequestMapping(value = "/edit")
	public String edit(Model model, @ModelAttribute Admin admin) {
		Admin admin1 = adminService.findById(admin.getId());
		model.addAttribute("admin", admin1);
		return "/admin/edit";
	}

	@RequestMapping(value = "/update")
	public String update(Model model, @RequestParam("name") String name, @RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("authority") String authority,
			@RequestParam("email") String email) {
		int result = adminService.updateAdmin(account, authority, name, password, email);
		if (result == 1) {
			model.addAttribute("error", "修改成功！");
		} else if (result == 0) {
			model.addAttribute("error", "修改失敗！");
		}
		List<Admin> list = adminService.findAllAdmins();
		model.addAttribute("entity", list);

		return "/admin/list";
	}
	
	
	@RequestMapping(value = "/login")
	public String login(){
		return "/admin/login";
	}
	@RequestMapping( value="/check" )
	public String logincheck( HttpServletRequest request,@RequestParam("account") String account, @RequestParam("password") String password){
		Admin admin = adminService.login(account, password);
		HttpSession session = request.getSession();
		if(admin!=null){
			session.setAttribute("admin", admin);
			session.setAttribute("error", "hello");
			return "/admin/login";
		}else{
			session.setAttribute("error", "登入失敗");
			return "/admin/login";
		}
	}

}
