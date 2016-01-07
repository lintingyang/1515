package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/product")
@Service
public class ProductUDController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	public ProductService productService;
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
		return "/e715/product/productedit";
	}
	
	@ResponseBody
	@RequestMapping(value = "/query1")
	public List<Product> list(@RequestParam("query") String query) {
		log.error("orderby = "+query);
		List<Product> products = null;

		if(query.equals("已刊登")){
			products= productService.findByUsersProductsIsPosted(2,"TRUE");
			log.debug("asdgfasdgsadgsdg");
			log.debug(products);
		}else if(query.equals("未刊登")){
			products= productService.findByUsersProductsIsPosted(2, TrueFalse.FALSE);
		}
		
		return products;
	}

	//yao 修改商品
	@RequestMapping(value = "/update")
	public String add(Model model) {
		return "/e715/product/productedit";
	}
}
