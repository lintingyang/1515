package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class IndexController {
	@Autowired
	private ProductService productService;

	@Autowired
	private ProductPictureService productPictureService;

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping("/")
	public String home(Model model) {
		List<Product> list= productService.getAll();
		List<ProductPicture> imglist =productPictureService.getAll();
		model.addAttribute("products",list);
		model.addAttribute("productPictures", imglist);
		return "/index";
	}

	@RequestMapping(value = "/query")
	@ResponseBody
	public List<Product> query(@RequestParam("orderby") String orderby,@RequestParam("namelike")String namelike,
				@RequestParam("categoryname")String category,HttpSession session) {
//		log.error("orderby =====================" + orderby);
		
		User user = (User)session.getAttribute("user");
		if(session.getAttribute("categoryname") == null ||category.equals("")){
			session.setAttribute("categoryname", "全部");
			category = "全部";
		}
//		log.error("query categoryname==========="+category);
		
		List<Product> list = productService.indexsearch(namelike, category, orderby,user);
		
		return list;

	}

//	 @RequestMapping(value = "/queryimg")
//	 @ResponseBody
//	 public List<ProductPicture> imglist(@RequestBody Product product){
//	 log.error("================================================="+product.getId());
//	 List<ProductPicture> list =
//	 productPictureService.getProductPictures(product);
//	// for(ProductPicture result : list){
//	// log.error(result);
//	// }
//	 return list;
//	 }
	
	//抓 product_picture list物品圖片
	@RequestMapping(value = "/queryimg")
	@ResponseBody
	public List<ProductPicture> imglist(@RequestParam("id") Integer id, Model model){
		Product product = productService.getOne(id);
		List<ProductPicture> list = productPictureService.getProductPictures(product);
		for(ProductPicture result : list){
		}
		return list;
	}
	
	// 抓 product 物品圖片
	@ResponseBody
	@RequestMapping(value = "/queryproductimg")
	public Product img(@RequestParam("id") Integer id, Model model) {
		return productService.getOne(id);
	}
	
	
	
}
