package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.service.ExchangeService;
import tw.com.softleader.e5e5.service.ProductPictureService;
import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.security.entity.SecRole;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/product")
@Service
public class ProductController {

	@Autowired
	public ProductService productService;
	@Autowired
	public ProductPictureService productPictureService;
	@Autowired
	public ExchangeService exchangeService;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable("id") final int id, final Model model) {

		// SecRole role = secRoleService.getOne(id);

		// model.addAttribute("entity", role);
		Product product = productService.getOne(id);
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		model.addAttribute("product", product);
		model.addAttribute("productPictures", productPictures);
		return "/e715/product/product";
	}

	@RequestMapping(value = "/findexchange")
	@ResponseBody
	public List<Exchange> add(@RequestParam("id") Integer id, Model model) {
		List<Exchange> exchanges = exchangeService.findByProductAId(id);

		return exchanges;
	}

	@RequestMapping(value = "/findproductimg")
	@ResponseBody
	public ProductPicture findProductPicture(@RequestParam("id") Integer id, Model model) {
		Product product = productService.getOne(id);
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		if (productPictures != null) {
			return productPictures.get(0);
		}else{
			return null;
		}
	}

	// 銘 新增商品
	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/e715/product/proAdd";
	}

	// @ResponseBody
	// @RequestMapping(value = "/insert" )
	// public String insert(@RequestBody Product product) {
	@RequestMapping(value = "/insert")
	public String insert(Model model, @ModelAttribute Product product, @RequestParam("pCategory") int pCategory,
			@RequestParam("pStatusBad") String pStatusBad) {
		System.out.println("product========================" + product);
		int number = productService.insert(product.getName(), pCategory, product.getStatus() + pStatusBad,
				product.getDescription(), product.getDeadline(), product.getTransactionTime(), product.getLocation(),
				product.getTradeWay(), product.getWishItem(), product.getPostStatus());
		System.out.println("number========================" + number);
		if (number == 1) {
			return "insert successful !!";
		} else {
			return "insert failed !!";
		}
	}
	// @ResponseBody
	// @RequestMapping(value = "/insert")
	// public String insert(Model model, @RequestBody Product product) {
	// int number = productService.insert(product.getName(), 1,
	// product.getDeadline(), product.getLocation(), product.getTradeWay(),
	// product.getWishItem());
	// if(number == 1){
	// model.addAttribute("result", "新增成功");
	// }else{
	// model.addAttribute("result", "新增失敗");
	// }
	// System.out.println("############################"+product);
	// return "/product/add";
	// }
	// @RequestMapping(value = "/insert")
	// public String insert(Model model, @ModelAttribute Product product,
	// @RequestParam("pCategory") int pCategory) {
	// int number = productService.insert(product.getName(), pCategory,
	// product.getDeadline(), product.getLocation(), product.getTradeWay(),
	// product.getWishItem());
	// if(number == 1){
	// model.addAttribute("result", "新增成功");
	// }else{
	// model.addAttribute("result", "新增失敗");
	// }
	// return "/product/add";
	// }

}
