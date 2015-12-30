package tw.com.softleader.e5e5.controller;

import java.util.ArrayList;
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

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.service.ProductCategoryService;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/main")

@Service
public class ProductCategoryController {

	@Autowired
	public ProductCategoryService productCategoryService;

	
	@RequestMapping(value = "/index") // ** /products/list
	public String list(Model model) {
		List<ProductCategory> p = productCategoryService.getAllProducts();
		model.addAttribute("productCategory", p);
		return "/main/index";
	}

}
