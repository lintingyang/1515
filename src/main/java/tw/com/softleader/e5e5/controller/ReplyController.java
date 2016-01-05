package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.e5e5.entity.Reply;
import tw.com.softleader.e5e5.service.ReplyService;

@Controller
@RequestMapping(value= "/replies")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "/list")
	public String list(Model model){
		List<Reply> list = replyService.getReplyById();
		model.addAttribute("beans",list);
		return "/reply/list";
	}
	
	@RequestMapping(value = "/list2")
	public String list2(Model model){
		List<Reply> list = replyService.getReplyByCreatedTime();
		model.addAttribute("beans",list);
		return "/reply/list";
	}
}
