package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.QuestionAndAnswer;
import tw.com.softleader.e5e5.service.QuestionAndAnswerService;

@Controller
@RequestMapping(value = "/qanda")
@Service
public class QandAController {

	@Autowired
	public QuestionAndAnswerService qaservice;
	
	@RequestMapping(value = "/getqanda")
	@ResponseBody
	public List<QuestionAndAnswer> select(@ModelAttribute @RequestParam("id") Integer id, Model model){
		List<QuestionAndAnswer> qandas = qaservice.findByProductId(id);
		return qandas;
	}
	
}
