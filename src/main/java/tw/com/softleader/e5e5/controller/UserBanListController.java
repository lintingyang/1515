package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.UserBanList;
import tw.com.softleader.e5e5.service.UserBanListService;

@Controller
@RequestMapping(value = "/userbanlists")
public class UserBanListController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserBanListService ublService;
	
	@RequestMapping(value="/list")
	public String list(Model model){

		return "/userbanlist/list";
	}
	

	@ResponseBody
	@RequestMapping(value="/query", produces = "application/json")
	public List<UserBanList> query(@RequestBody UserBanList userBanList) {
		log.debug("{=====================================================================================}"+ userBanList.getId());
		return ublService.findOneUser((Integer)userBanList.getId());
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
