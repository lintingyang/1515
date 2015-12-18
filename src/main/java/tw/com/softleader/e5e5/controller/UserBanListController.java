package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.UserBanList;
import tw.com.softleader.e5e5.service.UserBanListService;

@Controller
@RequestMapping(value = "/userbanlists")
public class UserBanListController {
	
	@Autowired
	private UserBanListService ublService;
	
	@RequestMapping(value="/list")
	public String list(Model model){

		return "/userbanlist/list";
	}
	
	@RequestMapping(value="/query")
	public String query(Model model , @RequestParam("queryId") Integer queryId) {
		List<UserBanList> ubls = ublService.findOneUser(queryId);
		 model.addAttribute("someOne", ubls);
		return "/userbanlist/list";
	}
	
	@RequestMapping(value = "/add")
	public String add (Model model){
		return "/userbanlist/add";
	}
	
	@RequestMapping(value = "/insert")
	public String insert(Model model ,@RequestParam("aId") Integer aid ,@RequestParam("bId") Integer bid){
		ublService.insert(aid, bid);
		List<UserBanList> ubls = ublService.findOneUser(5);
		model.addAttribute("addOne", ubls);
		return "/userbanlist/add";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model){
		return "/userbanlist/list";
	}

	
}