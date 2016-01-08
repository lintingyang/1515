package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.ProductPictureService;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/product")
@Service
public class ProductUDController {
	Logger log = Logger.getLogger(this.getClass());
	Integer status = 1;
	@Autowired
	public ProductService productService;
	@Autowired
	private ProductPictureService productPictureService;
	

	@RequestMapping(value = "/list")
	public String list(Model model) {
		return "/e715/product/productedit";
	}

	@ResponseBody
	@RequestMapping(value = "/query1")
	public List<Product> list(@RequestParam("query") String query , HttpSession session) {
		log.error("orderby = "+query);
		if(status == 2){
		query = (String) session.getAttribute("query");
		status =1;
		}
		List<Product> products = null;
		User user = (User) session.getAttribute("user");
		if(query.equals("已刊登")){
			products= productService.findByUsersProductsIsPosted(user.getId(),"TRUE");
		}else if(query.equals("未刊登")){
//			products=productService.getProductsOrderByPostTime();
			products= productService.findByUsersProductsIsPosted(user.getId(), "FALSE");
			session.setAttribute("query", query);
		}else if(query.equals("待交換")){
			products = productService.findUsersProductsByExchange(user.getId(), "FALSE");
		}else if(query.equals("已交換")){

			products = productService.findUsersProductsByExchange(user.getId(), "TRUE");
		}
		
		return products;
	}
	
	@ResponseBody
	@RequestMapping(value = "/queryimg")
	public List<ProductPicture> imglist(@RequestParam("id") Integer id, Model model){
		Product product = productService.getOne(id);
		List<ProductPicture> list = productPictureService.getProductPictures(product);


		for(ProductPicture result : list){
			log.error("================================================="+result);
		}
		return list;

	}
	// yao 修改商品
	@RequestMapping(value = "/update")
	public String add(Model model) {
		return "/e715/product/productedit";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {
		productService.deleteById(id);
		status = 2;
		return "/e715/product/productedit";
	}
}
