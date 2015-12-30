package tw.com.softleader.e5e5.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.ChatService;

@Controller
@RequestMapping(value = "/chats")
public class ChatController {
	
	@Autowired
	private ServletContext servletContext;
	
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private ChatService chatService;

	@RequestMapping(value = "/list") // ** /chats/list
	public String list(Model model) {
		List<Chat> chats = chatService.getLastThreeChats();
		model.addAttribute("beans", chats);
		return "/chat/list";
	}

	@RequestMapping(value = "/add")
	public String add(@ModelAttribute User user, Model model) {
		Chat chat = chatService.postChat(user.getId(), "messages_testest");
		model.addAttribute("bean", chat);
		return "/chat/add";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model, @RequestParam("id") Integer id, @RequestParam("message") String message,
			@RequestParam("file") MultipartFile file) {

		BufferedImage src = null;
		int counter=0;
		String path = "/resources/imgs/";

		path = servletContext.getRealPath(path);
		if (!file.isEmpty()) {
			File destination = null;
			try {
				src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
				if (!(new File(path)).exists()) {
					(new File(path)).mkdir();
				}
				destination = new File(path + String.valueOf(id)+"_"+file.getOriginalFilename());
				while(destination.exists()){
					counter++;
					destination = new File(path+ String.valueOf(id)+"_"+counter+"_"+file.getOriginalFilename());
				}
				ImageIO.write(src, "png", destination);
			} catch (IOException e) {
			} finally{
				Chat chat = chatService.postChat(id, message,destination.getAbsolutePath());
				List<Chat> chats = chatService.getLastThreeChats();
				model.addAttribute("beans", chats);
				return "redirect:/chats/list";
			}
		}else{
			Chat chat = chatService.postChat(id, message);
			List<Chat> chats = chatService.getLastThreeChats();
			model.addAttribute("beans", chats);
			return "redirect:/chats/list";
		}
		// Chat chat = chatService.postChat(id, message, new
		// String(file.getBytes()));
		// List<Chat> chats = chatService.getLastThreeChats();
		// model.addAttribute("beans", chats);


	}
	
	@RequestMapping(value = "/insertM")
	@ResponseBody
	public List<Chat> insertM(@RequestParam("id") Integer id, 
							@RequestParam("message") String message) {
			Chat chat = chatService.postChat(id, message);
			List<Chat> chats = chatService.getLastThreeChats();
			return chats;
	}

	// @RequestMapping(value = "/delete")
	// public String delete(Model model) {
	// return "/chat/list";
	// }
	//
	// @RequestMapping(value = "/edit")
	// public String edit(Model model) {
	// return "/chat/edit";
	// }
	//
	// @RequestMapping(value = "/update")
	// public String update(Model model) {
	// return "/chat/add";
	// }

}
