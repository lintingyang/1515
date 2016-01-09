package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
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
	public String editPage(@PathVariable("id") final int id, final Model model,
							HttpSession session) {
		
//		SecRole role = secRoleService.getOne(id);
		
//		model.addAttribute("entity", role);
		Product product = productService.getOne(id);
		if(product==null){
			return "redirect:/";
		}
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		model.addAttribute("product", product);
		model.addAttribute("productPictures", productPictures);
		
		//銘加的 上面參數session也是
		session.setAttribute("thisProduct", product);
		
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

	@RequestMapping(value = "/query")
	@ResponseBody
	public List<Product> query(@RequestParam("id") Integer id, HttpSession session) {
		List<Product> list = null;
		
		list = productService.findByUserId(id);
		
		return list;

	}
	
	

	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/e715/product/proAdd";
	}
	//新增商品
	@RequestMapping(value = "/insert")
	public String insert(Model model, @ModelAttribute Product product, 
									  @RequestParam("pCategory") int pCategory,
									  @RequestParam("pPicture") MultipartFile pPicture,
									  @RequestParam("pStatusBad") String pStatusBad, 
									  @RequestParam("pWishItem") String pWishItem, 
									  @RequestParam("pStartTime") String pStartTime, 
									  @RequestParam("pDeadline") String pDeadline, 
									  HttpSession session) {
		
		//錯誤訊息顯示
//		Map<String, String> errorMessage = new HashMap<>();
//		session.removeAttribute("errorMsg");
//		session.setAttribute("errorMsg", errorMessage);
//		//error1 pStatusBad= null
//		if(product.getStatus() == "破損"){
//			if(pStatusBad == null || pStatusBad.trim().length() == 0){
//				errorMessage.put("status", "請描述損壞情形");
//			}
//		}
//		//error3 time = null
//		if(product.getPostStatus() == TrueFalse.TRUE){
//			if(pStartTime == null || pStartTime.trim().length() == 0){
//				errorMessage.put("timeS", "請輸入起始時間");
//			}
//			if(pDeadline == null || pDeadline.trim().length() == 0){
//				errorMessage.put("timeD", "請輸入結束時間");
//			}
//		}
//		//error2 wishItem = null
//		if(product.getWishItem() == "希望商品"){
//			if(pWishItem == null || pWishItem.trim().length() == 0){
//				errorMessage.put("wish", "請輸入希望清單");
//			}
//		}
//		//若有錯誤回新增畫面
//		if(errorMessage != null && !errorMessage.isEmpty()) {
//			return "redirect:/product/add";
//		}
		
		//取userId
		User userData = (User) session.getAttribute("user");
		
		//物品狀態 輸入值修改
		String productStatus = null;
		if(product.getStatus() == "破損"){
			productStatus = product.getStatus() +"(" +pStatusBad +")";
		}else{
			productStatus = product.getStatus();
		}
		
		//希望清單 輸入值判斷
		String productWish = null;
		if(product.getWishItem() == "希望商品"){
			productWish = pWishItem;
		}else{
			productWish = product.getWishItem();
		}
		
		//時間處理
		LocalDateTime startTime =null;
		LocalDateTime deadline =null;
		if(product.getPostStatus() == TrueFalse.TRUE){
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			String monthS = pStartTime.substring(0, 2);
			String dayS = pStartTime.substring(3, 5);
			String yearS = pStartTime.substring(6, 10);
			String start = yearS + "-" + monthS + "-" + dayS+" 00:00"; //"1986-04-08";
			try {
				startTime = LocalDateTime.parse(start, formatter);
			} catch (Exception e) {
			}
			String monthD = pDeadline.substring(0, 2);
			String dayD = pDeadline.substring(3, 5);
			String yearD = pDeadline.substring(6, 10);
			String end = yearD + "-" + monthD + "-" + dayD+" 00:00"; //"1986-04-08";
			try {
				deadline = LocalDateTime.parse(end, formatter);
			} catch (Exception e) {
			}
		}else{
			startTime =null;
			deadline =null;
		}
		
		//存入資料
		Product newProduct = productService.insert(product.getName(),
					userData.getId(), pCategory, productStatus, 
					product.getDescription(), deadline, startTime,
					product.getTransactionTime(), product.getLocation(), 
					product.getTradeWay(), productWish, 
					product.getPostStatus());
		System.out.println("newProduct========================" + newProduct);
		if(newProduct != null){
			model.addAttribute("result", "新增成功");
			session.setAttribute("new", newProduct);
		}else{
			model.addAttribute("result", "新增失敗");
		}
		
		//存取productPicture
		String path = productPictureService.upLoadImage(newProduct.getId(), servletContext, pPicture);
		int numPicture = productPictureService.insertImage(newProduct.getId(), path);
		if(numPicture == 1){
			model.addAttribute("picResult", "圖片新增成功");
		}else{
			model.addAttribute("picResult", "圖片新增失敗");
		}
		
		return "/e715/product/proAdd";
		
	}
	
	//交易進行中頁面
	@RequestMapping(value = "/exchanging")
	public String exchanging(Model model,@RequestParam("id") int exId , HttpSession session) {
		Exchange exchange = exchangeService.finishTrade(exId);
		session.setAttribute("exchange", exchange);
		
		return "/e715/product/proExchanging";
	}

}