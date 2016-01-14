package tw.com.softleader.e5e5.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@RequestMapping("/list")
	public String maillist(){		
		return "/e715/mail/maillist";
	}
	

	
}
