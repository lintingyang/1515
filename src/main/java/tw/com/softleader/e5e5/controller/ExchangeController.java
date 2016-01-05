package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.service.ExchangeService;

@Controller
@RequestMapping(value = "/exchanges")
public class ExchangeController {
	@Autowired
	ExchangeService exchangeService;
	
	@RequestMapping(value = "/list") // ** /exchanges/list
	public String list(Model model) {
		List<Exchange> models = exchangeService.findAll();
		model.addAttribute("entities", models);
		return "/exchange/listex";
	}
	
	@RequestMapping(value = "/query") 
	public String query(Model model, @ModelAttribute("id") Product product) {
		List<Exchange> models = exchangeService.findByProductAId(product.getId());
		model.addAttribute("results", models);
		return "/exchange/listex";
	}
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
