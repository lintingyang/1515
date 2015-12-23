package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String editT(Model model, @RequestParam("id") int id, @RequestParam("passed") char status){
		reportService.updateIsPassed(id, status);
		Report result = reportService.findById(id);
		model.addAttribute("edits", result);
		return "/report/edit";
	}
	
//	@RequestMapping(value="/editF")
//	public String editF(Model model, @ModelAttribute Report report){
//		reportService.updateIsPassed(report.getId(), 'F');
//		Report result = reportService.findById(report.getId());
//		model.addAttribute("edits", result);
//		return "/report/edit";
//	}
	
//	@RequestMapping(value = "/query") 
//	public String query(Model model, @ModelAttribute("id") Product product) {
//		List<Exchange> models = exchangeService.findByProductAId(product.getId());
//		model.addAttribute("results", models);
//		return "/exchange/listex";
//	}
//	@RequestMapping(value = "/delete")
//	public String delete(Model model) {
//		return "/chat/list.jsp";
//	}
//	@RequestMapping(value = "/add")
//	public String add(Model model) {
//		return "/chat/add.jsp";
//	}
//	@RequestMapping(value = "/insert")
//	public String insert(Model model) {
//		return "/chat/add.jsp";
//	}
//	@RequestMapping(value = "/edit")
//	public String edit(Model model) {
//		return "/chat/edit.jsp";
//	}
//	@RequestMapping(value = "/update")
//	public String update(Model model) {
//		return "/chat/add.jsp";
//	}
	

}
