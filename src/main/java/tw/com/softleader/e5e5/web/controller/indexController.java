package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
public class indexController {
	@Autowired
	private ProductService productService;
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping("/")
	public String home() {
		return "/index";
	}

	@RequestMapping(value = "/query")
	@ResponseBody
	public List<Product> query(@RequestParam("orderby") String orderby, HttpSession session) {
		log.error("orderby = " + orderby);
		List<Product> list = null;
		if (orderby.equals("熱門")) {

			if (session.getAttribute("searchByCategory") == null) {
				list = productService.getProductsOrderByClickTimes();
			} else {
				list = productService.findeOrderByClickTime("", "文具用品");
			}
		} else if (orderby.equals("最新")) {

			if (session.getAttribute("searchByName") == null) {
				list = productService.getProductsOrderByPostTime();
			} else {
				list = productService.findByProductOrderByPostTime("", "文具用品");
			}

		} else if (orderby.equals("誠信")) {

		} else if (orderby.equals("推薦")) {

		}
		return list;

	}
}
