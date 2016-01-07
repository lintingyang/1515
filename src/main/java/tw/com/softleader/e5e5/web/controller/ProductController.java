package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import tw.com.softleader.e5e5.service.ExchangeService;
import tw.com.softleader.e5e5.service.ProductPictureService;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
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
		
//		SecRole role = secRoleService.getOne(id);
		
//		model.addAttribute("entity", role);
		Product product = productService.getOne(id);
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		model.addAttribute("product", product);
		model.addAttribute("productPictures", productPictures);
		return "/e715/product/product";
	}
	
	@RequestMapping(value = "/findexchange")
	@ResponseBody
	public List<Exchange> add(@ModelAttribute @RequestParam("id") Integer id, Model model) {
		List<Exchange> exchanges=exchangeService.findByProductAId(id);

		return exchanges;
	}
	
	//銘 新增商品
	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/e715/product/proAdd";
	}
	
	
	@RequestMapping(value = "/insert")
	public String insert(Model model, @ModelAttribute Product product, 
									  @RequestParam("pCategory") int pCategory, 
									  @RequestParam("pStatusBad") String pStatusBad, 
									  @RequestParam("pWishItem") String pWishItem, 
									  @RequestParam("pyyyy") String pyyyy, 
									  @RequestParam("pMM") String pMM, 
									  @RequestParam("pdd") String pdd, 
									  @RequestParam("pHH") String pHH, 
									  @RequestParam("pmm") String pmm,
									  HttpSession session) {
		
		User userData = (User) session.getAttribute("user");
		System.out.println("product========================" + product);
		Map<String, String> errorMessage = new HashMap<>();
		session.setAttribute("errorMsg", errorMessage);
//		if(product.getName() == null || product.getName().trim().length() == 0){
//			errorMessage.put("name", "請輸入商品標題/名稱");
//		}
//		if(product.getDescription() == null || product.getDescription().trim().length() == 0){
//			errorMessage.put("description", "請輸入商品描述");
//		}
//		if(product.getLocation() == null || product.getLocation().trim().length() == 0){
//			errorMessage.put("description", "請輸入交換地點");
//		}
//		try{
//			LocalDateTime.of(pyyyy, pMM, pdd, pHH, pmm);
//		}catch(Exception e){
//			errorMessage.put("transTime", "時間格式不正確");
//		}
//		if(errorMessage != null && !errorMessage.isEmpty()) {
//			return "redirect:/product/insert";
//		}
//		if (!month.equals("") && month.length() < 2) {
//			month = "0" + month;
//		}
//		if (!day.equals("") && day.length() < 2) {
//			day = "0" + day;
//		}
//		String str = year + "-" + month + "-" + day+" 00:00"; //"1986-04-08";
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime dateTime =null;
		try {
			if(pyyyy == null){
				dateTime = null;				
			}else{
				int year = Integer.parseInt(pyyyy);
				int month = Integer.parseInt(pMM);
				int day = Integer.parseInt(pdd);
				int hour = Integer.parseInt(pHH);
				int minute = Integer.parseInt(pmm);
				dateTime = LocalDateTime.of(year, month, day, hour, minute);
			}
			
		} catch (Exception e) {
		}
		int number = productService.insert(product.getName(),
				userData.getId(), 
				pCategory, 
				product.getStatus() +"(" +pStatusBad +")", 
				product.getDescription(), 
				dateTime, 
				product.getTransactionTime(), 
				product.getLocation(), 
				product.getTradeWay(), product.getWishItem() +"(" +pWishItem +")", 
				product.getPostStatus());
		System.out.println("number========================" + number);
		if(number == 1){
			model.addAttribute("result", "新增成功");
		}else{
			model.addAttribute("result", "新增失敗");
		}
		return "/e715/product/proAdd";
		
	}

	}
