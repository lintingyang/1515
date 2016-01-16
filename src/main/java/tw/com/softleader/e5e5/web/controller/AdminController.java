package tw.com.softleader.e5e5.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	private Logger log = LoggerFactory.getLogger(this.getClass());


	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexPage() {
		return "/e715/back/home";
	}


}
