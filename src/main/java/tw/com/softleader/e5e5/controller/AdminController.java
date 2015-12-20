package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.service.AdminService;

@Controller
@RequestMapping(value = "/admins")
public class AdminController {
	Logger log = Logger.getLogger(getClass());
	@Autowired
	private AdminService adminService;
	

	@RequestMapping(value = "/list")
	public String list(Model model){
		
		List<Admin> list = adminService.findAllAdmins();
		model.addAttribute("entity",list);
		return "/admin/list";
	}
//	@RequestMapping(value = "/query")
//	public String query(Model model,@ModelAttribute Admin admin){
//		Admin admin1 = adminService.findByAccount(admin.getAccount());
//		model.addAttribute("aaa",admin.getAccount());
//		return "/admin/list";
//	}
	@RequestMapping(value = "/query")
	public String query(Model model,@RequestParam("account") String admin){
		Admin admin1 = adminService.findByAccount(admin);
		model.addAttribute("aaa",admin1);
		return "/admin/list";
	}

}
