package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.ChatService;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/chatroom")
public class ChatroomController {
	@Autowired
	private ChatService chatService;
	@Autowired
	private UserService userService;
	@Autowired
	private ServletContext servletContext;
	
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value={"", "/"})
	public String home(Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/";
		}
		return "/e715/chat/list";
	}
	
	@RequestMapping(value = "/list") 
	@ResponseBody
	public List<Chat> list(Model model) {
		List<Chat> chats = chatService.getLastThreeChats();
		return chats;
	}
	
	@RequestMapping(value = "/insertM")
	@ResponseBody
	public List<Chat> insertM(@RequestParam("id") Integer id, 
			@RequestParam("messages") String messages, 
			@RequestParam("showUserInfo") Character showUserInfo) {
			chatService.postChat(id, messages,showUserInfo);
			List<Chat> chats = chatService.getLastThreeChats();
			return chats;
	}
	
	@RequestMapping(value = "/insert")
	public String insert(Model model, @RequestParam("id") Integer id, 
			@RequestParam("file") MultipartFile file) {
			String path = chatService.upLoadImage(id, servletContext, file);
			User user = userService.getOne(id);
			String message = user.getName()+"上傳了一張圖片";
			Chat chat = chatService.postChat(id,message,path,'T');
			List<Chat> chats = chatService.getLastThreeChats();
			return "redirect:/chatroom";
	}
	

}
