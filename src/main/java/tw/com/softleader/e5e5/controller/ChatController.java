package tw.com.softleader.e5e5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/chats")
public class ChatController {
	
	@RequestMapping(value = "/list") // ** /chat/list
	public String list(Model model) {
		
		return "/chat/list";
	}
	@RequestMapping(value = "/query") 
	public String query(Model model) {
		return "/chat/list.jsp";
	}
	@RequestMapping(value = "/delete")
	public String delete(Model model) {
		return "/chat/list.jsp";
	}
	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/chat/add.jsp";
	}
	@RequestMapping(value = "/insert")
	public String insert(Model model) {
		return "/chat/add.jsp";
	}
	@RequestMapping(value = "/edit")
	public String edit(Model model) {
		return "/chat/edit.jsp";
	}
	@RequestMapping(value = "/update")
	public String update(Model model) {
		return "/chat/add.jsp";
	}
	

}
