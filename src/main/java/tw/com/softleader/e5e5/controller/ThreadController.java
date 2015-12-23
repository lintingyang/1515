package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Reply;
import tw.com.softleader.e5e5.entity.Thread;
import tw.com.softleader.e5e5.service.ReplyService;
import tw.com.softleader.e5e5.service.ThreadService;

@Controller
@RequestMapping(value= "/threads")
public class ThreadController {
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ReplyService replyService;
	
	
	@RequestMapping(value = "/list")
	public String list(Model model){
		List<Thread> list = threadService.getThreadById();
		model.addAttribute("beans",list);
		return "/thread/list";
	}
	
	@RequestMapping(value = "/list2")
	public String list2(Model model){
		List<Thread> list = threadService.getThreadByCreatedTime();
		model.addAttribute("beans",list);
		return "/thread/list";
	}
	
	@RequestMapping(value = "/query")
	public String list(@RequestParam("id") Integer id ,	Model model){
		Thread td = threadService.getThreadById(id);
		if(td != null){
			List<Reply> models = replyService.getReplyByThread(td);
			model.addAttribute("beans",models);
		}
		return "/thread/list";
	}
}
