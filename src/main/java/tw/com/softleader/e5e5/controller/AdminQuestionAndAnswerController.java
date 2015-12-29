package tw.com.softleader.e5e5.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.e5e5.service.AdminQuestionAndAnswerService;

@Controller
@RequestMapping(value = "/adminquestionamdanswers")
public class AdminQuestionAndAnswerController {
	@Autowired
	private AdminQuestionAndAnswerService adminQuestionAndAnswerService;

	Logger log = Logger.getLogger(getClass());
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
		model.addAttribute("adminQA",adminQuestionAndAnswerService.findAll());
		return "/adminquestionandanwser/list";
	}
	
}
