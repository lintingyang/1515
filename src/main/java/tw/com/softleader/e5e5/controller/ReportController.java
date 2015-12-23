package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.service.ReportService;

@Controller
@RequestMapping(value = "/reports")
public class ReportController {
	@Autowired
	ReportService reportService;
	
	@RequestMapping(value = "/unread")
	public String unread(Model model) {
		List<Report> models = reportService.findAllUnread();
		model.addAttribute("unreads", models);
		return "/report/list";
	}
	
	
	@RequestMapping(value="/list")
	public String list(Model model){
		List<Report> models = reportService.findHistory();
		model.addAttribute("list", models);
		return "/report/list";
	}
	
	
	@RequestMapping(value="/edit")
	public String edit(Model model, @RequestParam("id") int id, @RequestParam("passed") char status){
		reportService.updateIsPassed(id, status);
		Report result = reportService.findById(id);
		model.addAttribute("edits", result);
		return "/report/edit";
	}
	
	@RequestMapping(value="/editold")
	public String editOld(){
		return "/report/edit2";
	}

}
