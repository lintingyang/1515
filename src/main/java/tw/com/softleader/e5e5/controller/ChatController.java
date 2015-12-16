package tw.com.softleader.e5e5.controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.ChatService;

@Controller
@RequestMapping(value = "/chats")
public class ChatController {
	
	@Autowired
	private ChatService chatService;

	@RequestMapping(value = "/list") // ** /chats/list
	public String list(Model model) {
		List<Chat> chats = chatService.getLastThreeChats();
		model.addAttribute("beans", chats);
		return "/chat/list";
	}

	@RequestMapping(value = "/query")
	public String query(Model model, @ModelAttribute("user") User user) {
		chatService.postChat(user.getId(), "messages_no");
		List<Chat> chats = chatService.getLastThreeChats();
		model.addAttribute("beans", chats);
		return "/chat/list";
	}
//	@RequestMapping(value = "/query")
//	public String query(Model model, @RequestParam("id") Integer id) {
//		chatService.postChat(id, "messages");
//		List<Chat> chats = chatService.getLastThreeChats();
//		model.addAttribute("beans", chats);
//		return "/chat/list";
//	}

	@RequestMapping(value = "/delete")
	public String delete(Model model) {
		return "/chat/list";
	}

	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/chat/add";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model) {
		return "/chat/add";
	}

	@RequestMapping(value = "/edit")
	public String edit(Model model) {
		return "/chat/edit";
	}

	@RequestMapping(value = "/update")
	public String update(Model model) {
		return "/chat/add";
	}

}
