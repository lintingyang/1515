package tw.com.softleader.e5e5.controller;

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
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/products")

@Service
public class ProductController {

	@Autowired
	public ProductService productService;
	
	@Autowired
	public ExchangeService exchangeService;
	@RequestMapping(value = "/product") //shuang物品畫面
	public String product(Model model,@RequestParam("id") int id){
		Product product =  productService.getOneById(id);
		List<Exchange> exchangeList = exchangeService.findByProductAId(id);
		model.addAttribute("product",product);
		model.addAttribute("exchange",exchangeList);
		return "/product/product";
	}
	
	
	@RequestMapping(value = "/list") // ** /products/list
	public String list(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "/product/list";
	}

	@RequestMapping(value = "/query")
	public String query(Model model, @RequestParam("pKeywords") String name) {
		List<Product> products = productService.getAllByKeywords(name);
		model.addAttribute("products", products);
		return "/product/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/query1",  produces = "application/json") 
	public Product query(@RequestBody Product product) {
		System.out.println("=========+++++++===========" + product);
		Product products = productService.getOneById((Integer)product.getId());
		return products;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @ModelAttribute Product product) {
		productService.deleteById(product.getId());
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "/product/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete1",  produces = "application/json") 
	public String delete(@RequestBody Product product) {
		System.out.println("=========+++++++===========" + product);
		int num =productService.deleteById(product.getId());
		if(num == 1){
			return "delete successful !!";
		}else{
			return "delete failed !!";			
		}
	}
	
	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/product/add";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert" ) 
	public String insert(@RequestBody Product product) {
		System.out.println("product========================" + product);
		int number = productService.insert(product.getName(), 2, product.getDeadline(), product.getLocation(), product.getTradeWay(), product.getWishItem());
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

	@RequestMapping(value = "/edit")
	public String edit(Model model, @ModelAttribute Product product) {
		Product products = productService.getOneById(product.getId());
		model.addAttribute("p", products);
		return "/product/edit";
	}

	@RequestMapping(value = "/update")
	public String update(Model model, @RequestParam("pId") Integer id, @RequestParam("pPS") char postStatus) {
		Product products = productService.update(id, postStatus);
		model.addAttribute("p", products);
		return "/product/edit";
	}
	
	@ResponseBody
	@RequestMapping(value = "/update1",  produces = "application/json") 
	public Product update(@RequestBody Product product) {
		System.out.println("=========+++++++===========" + product);
		return productService.update(product.getId(), product.getPostStatus());
	}
}
