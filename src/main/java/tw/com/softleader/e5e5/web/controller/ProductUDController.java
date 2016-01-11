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
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.ProductPictureService;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/product")
@Service
public class ProductUDController {
	Logger log = Logger.getLogger(this.getClass());
	int status = 0;
	@Autowired
	public ProductService productService;
	@Autowired
	private ProductPictureService productPictureService;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		return "/e715/product/productedit";
	}
	
	// 切換已刊登/未刊登/待交換/已交換
	@ResponseBody
	@RequestMapping(value = "/query1")
	public List<Product> list(@RequestParam("query") String query, HttpSession session) {
		log.error("orderby = " + query);
		if (status == 2) {
			query = (String) session.getAttribute("query");
			status = 0;
		} else if (status == 1) {
			query = (String) session.getAttribute("query");
			status = 0;
		}
		
		List<Product> products = null;
		User user = (User) session.getAttribute("user");
		if (query.equals("已刊登")) {
			products = productService.findByUsersProductsIsPosted(user.getId(), "TRUE");
			session.setAttribute("query", query);
		} else if (query.equals("未刊登")) {
			products = productService.findByUsersProductsIsPosted(user.getId(), "FALSE");
			session.setAttribute("query", query);
		} else if (query.equals("待交換")) {
			products = productService.findUsersProductsByExchange(user.getId(), "FALSE");
		} else if (query.equals("已交換")) {
			products = productService.findUsersProductsByExchange(user.getId(), "TRUE");
		}

		return products;
	}

	//物品圖片
	@ResponseBody
	@RequestMapping(value = "/queryimg")
	public List<ProductPicture> imglist(@RequestParam("id") Integer id, Model model) {
		Product product = productService.getOne(id);
		List<ProductPicture> list = productPictureService.getProductPictures(product);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/edit")
	public String edit(@RequestParam("id") Integer id, Model model) {
		log.debug("&&&&&&&&&&&&&&&&&&&&"+ id);
		return "/e715/product/proEdit";
	}

	//刪除未刊登商品
	@ResponseBody
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {
		productService.deleteById(id);
		status = 2;
		return "/e715/product/productedit";
	}
	
	//下架已刊登商品
	@ResponseBody
	@RequestMapping(value = "/remove")
	public String remove(@RequestParam("id") Integer id, Model model) {
		productService.updateStatus(id, TrueFalse.FALSE);
		status = 1;
		return "/e715/product/productedit";
	}
}
