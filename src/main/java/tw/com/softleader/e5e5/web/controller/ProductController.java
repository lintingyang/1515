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
	
	//新增商品
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
									  @RequestParam("pyyyy") String pyyyy, 
									  @RequestParam("pMM") String pMM, 
									  @RequestParam("pdd") String pdd, 
									  @RequestParam("pHH") String pHH, 
									  @RequestParam("pmm") String pmm,
									  HttpSession session) {
		
		//錯誤訊息顯示
//		Map<String, String> errorMessage = new HashMap<>();
//		session.setAttribute("errorMsg", errorMessage);
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
		
		//取userId
		User userData = (User) session.getAttribute("user");
		
		//時間處理
		LocalDateTime dateTime =null;
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
		
		//存入資料
		Product newProduct = productService.insert(product.getName(),
				userData.getId(), 
				pCategory, 
				product.getStatus() +"(" +pStatusBad +")", 
				product.getDescription(), 
				null, 
				product.getTransactionTime(), 
				product.getLocation(), 
				product.getTradeWay(), product.getWishItem() +"(" +pWishItem +")", 
				product.getPostStatus());
		System.out.println("newProduct========================" + newProduct);
		if(newProduct != null){
			model.addAttribute("result", "新增成功");
			session.setAttribute("new", newProduct);
		}else{
			model.addAttribute("result", "新增失敗");
		}
//		//get ProductId
//		Product p = productService. 
		
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

	}
