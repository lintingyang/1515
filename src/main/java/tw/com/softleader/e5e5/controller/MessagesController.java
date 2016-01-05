package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Messages;
import tw.com.softleader.e5e5.service.MessagesService;

@Controller
@RequestMapping(value = "/messages")
public class MessagesController {
	
	@Autowired
	private MessagesService msgService;
	
	@RequestMapping(value="/list")
	public String list(Model model){
		
		return "/message/list";
	}


	@RequestMapping(value="/query")
	public String query(Model model , @RequestParam("senderId") Integer senderId,@RequestParam("receiverId") Integer receiverId){
		List<Messages> msgs = msgService.findByBoth(senderId, receiverId);
		model.addAttribute("getSome", msgs);
		return "/message/list";
	}
	
	
}
