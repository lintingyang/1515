package tw.com.softleader.e5e5.web.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.e5e5.service.ChatService;

@Controller
@RequestMapping(value = "/chatroom")
public class ChatroomController {
	@Autowired
	private ChatService chatService;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping("/")
	public String home(Model model) {
		log.debug("fdasffffffffffffff");
		return "/e715/chat/list";
	}
}
