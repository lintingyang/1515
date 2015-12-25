package tw.com.softleader.e5e5.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Broadcast;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.BroadcastService;

@Controller
@RequestMapping(value = "/broadcasts")
public class BroadcastController {
	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private BroadcastService broadcastService;
	
	@RequestMapping(value = "/list") // ** /chats/list
	public String list(Model model) {
		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
		model.addAttribute("beans", broadcasts);
		return "/broadcast/list";
	}
//	@RequestMapping(value = "/list") // ** /chats/list
//	public String list(Model model) {
//		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
//		model.addAttribute("beans", broadcasts);
//		return "/broadcast/list";
//	}
	
//	@RequestMapping(value = "/insert")
//	public @ResponseBody List<Broadcast> insert(@RequestBody String json) {
//		log.debug("test:"+json);
////		Broadcast broadcast=broadcastService.postBroadcast(id, broadcastDescription);
////		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
//		//model.addAttribute("beans", broadcasts);
//		
//		return null;
//	}
	@RequestMapping(value = "/insert")
	@ResponseBody
	public List<Broadcast> insert(@RequestParam("id") Integer id,
			@RequestParam("broadcastDescription") String broadcastDescription) {
		log.debug("tetestes: "+id);

//		Broadcast broadcast=broadcastService.postBroadcast(1, "test");
//		Broadcast broadcast=broadcastService.postBroadcast(id, broadcastDescription);
		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
//		Broadcast b = new Broadcast();
//		b.setId(1);
//		User user = new User();
//		user.setId(5);
//		b.setUser(user);
//		List<Broadcast> broadcasts = new ArrayList();
//		broadcasts.add(b);
		
		log.debug(broadcasts);
		System.out.println(broadcasts);
		return broadcasts;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Integer id,Model model) {
		broadcastService.deleteBroadcast(id);
		List<Broadcast> broadcasts = broadcastService.getLastTenBroadcasts();
		model.addAttribute("beans", broadcasts);
		return "/broadcast/delete";
	}

}
