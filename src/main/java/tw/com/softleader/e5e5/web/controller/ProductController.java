package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.service.ExchangeService;

import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/product")
@Service
public class ProductController {

	@Autowired
	public ProductService productService;
	
	//銘 新增商品
	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/e715/product/proAdd";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert" ) 
	public String insert(@RequestBody Product product) {
		System.out.println("product========================" + product);
		int number = productService.insert(product.getName(), 1, product.getStatus(), product.getDescription(), product.getDeadline(), product.getTransactionTime(), product.getLocation(), product.getTradeWay(), product.getWishItem(), product.getPostStatus());
		System.out.println("number========================" + number);
		if(number == 1){
			return "insert successful !!";
		}else{
			return "insert failed !!";
		}
	}
//	@ResponseBody
//	@RequestMapping(value = "/insert")
//	public String insert(Model model, @RequestBody Product product) {
//		int number = productService.insert(product.getName(), 1, product.getDeadline(), product.getLocation(), product.getTradeWay(), product.getWishItem());
//		if(number == 1){
//			model.addAttribute("result", "新增成功");
//		}else{
//			model.addAttribute("result", "新增失敗");
//		}
//		System.out.println("############################"+product);
//		return "/product/add";
//	}
//	@RequestMapping(value = "/insert")
//	public String insert(Model model, @ModelAttribute Product product, @RequestParam("pCategory") int pCategory) {
//		int number = productService.insert(product.getName(), pCategory, product.getDeadline(), product.getLocation(), product.getTradeWay(), product.getWishItem());
//		if(number == 1){
//			model.addAttribute("result", "新增成功");
//		}else{
//			model.addAttribute("result", "新增失敗");
//		}
//		return "/product/add";
//	}

	}
