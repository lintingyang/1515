package tw.com.softleader.e5e5.web.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class indexController {
	Logger log = Logger.getLogger(this.getClass());
	@RequestMapping("/")
	public String home() {
		return "/index";
	}
	
	
	@RequestMapping( value = "/query")
	@ResponseBody
	public void query(@RequestParam("orderby") String orderby){
		log.error("orderby = "+orderby);
		if(orderby.equals("熱門")){
			
		}
		
		
	}
}
