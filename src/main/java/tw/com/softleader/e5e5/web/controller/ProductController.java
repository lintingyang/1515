package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.service.ExchangeService;
import tw.com.softleader.e5e5.service.ProductPictureService;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.User;
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

	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable("id") final int id, final Model model) {

		// SecRole role = secRoleService.getOne(id);

		// model.addAttribute("entity", role);
		Product product = productService.getOne(id);
		if(product==null){
			return "redirect:/";
		}
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		model.addAttribute("product", product);
		model.addAttribute("productPictures", productPictures);
		return "/e715/product/product";
	}

	@RequestMapping(value = "/findexchange")
	@ResponseBody
	public List<Exchange> findExchange(@RequestParam("id") Integer id, Model model) {
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


	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/e715/product/proAdd";
	}


}
