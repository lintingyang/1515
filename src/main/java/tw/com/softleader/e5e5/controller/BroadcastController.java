package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Broadcast;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.BroadcastService;

@Controller
@RequestMapping(value = "/broadcasts")
public class BroadcastController {
	@Autowired
	private BroadcastService broadcastService;
	
	@RequestMapping(value = "/list") // ** /chats/list
	public String list(Model model) {
		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
		model.addAttribute("beans", broadcasts);
		return "/broadcast/list";
	}
	
	@RequestMapping(value = "/insert")
	public String insert(Model model,@RequestParam("id") Integer id,
									 @RequestParam("broadcastDescription") String broadcastDescription) {
		Broadcast broadcast=broadcastService.postBroadcast(id, broadcastDescription);
		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
		model.addAttribute("beans", broadcasts);
		
		return "/broadcast/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Integer id,Model model) {
		broadcastService.deleteBroadcast(id);
		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
		model.addAttribute("beans", broadcasts);
		return "/broadcast/delete";
	}

}
