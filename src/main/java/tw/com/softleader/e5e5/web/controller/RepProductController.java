package tw.com.softleader.e5e5.web.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.ProductService;
import tw.com.softleader.e5e5.service.ReportService;

@Controller
@RequestMapping(value="/report/products")
public class RepProductController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ReportService reportService;
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage() {
		return "/e715/back/repProductList";
	}
	
	@RequestMapping(value = "/query")
	@ResponseBody
	public List<Report> query(Model model) {
		return reportService.findAll();
	}
	
	@RequestMapping(value = "/query/name")
	@ResponseBody
	public List<Report> queryName(@RequestParam("name") String name) {
		return reportService.findAllByName(name);
	}
	
	@RequestMapping(value = "/query/no")
	@ResponseBody
	public List<Report> queryNo() {
		return reportService.findAllUnread();
	}
	
	@RequestMapping(value = "/updateY")
	public String updateYes(Model model, @RequestParam("id") int id) {
		Report report = reportService.updateIsPassedPass(id);
		if(report.getIsPassed() != null){
			model.addAttribute("result", "success");
		}else{
			model.addAttribute("result", "fail");
		}
		Product p = productService.updateBackPostStatus(report.getProduct().getId(), TrueFalse.FALSE);
		return "/e715/back/repProductList";
	}
	
	@RequestMapping(value = "/updateN")
	public String updateNo(Model model, @RequestParam("id") int id) {
		Report report = reportService.updateIsPassedNotPass(id);
		if(report.getIsPassed() != null){
			model.addAttribute("result", "success");
		}else{
			model.addAttribute("result", "fail");
		}
		return "/e715/back/repProductList";
	}
	
	@RequestMapping("/new")
	public String insert(Model model, @RequestParam("article")String article,
			@RequestParam("productId")int productId, @RequestParam("reporterId")int reporterId){
		int i = reportService.insert(article, productId, reporterId);
		if(i == 1){
			model.addAttribute("report", "success");
		}else{
			model.addAttribute("report", "fail");
		}
		return "/e715/product/product";
	}

}
