package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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

import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.Grade;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.ExchangeService;
import tw.com.softleader.e5e5.service.ProductPictureService;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/product")
@Service
public class ProductController {

	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	public ProductService productService;
	@Autowired
	public ProductPictureService productPictureService;
	@Autowired
	public ExchangeService exchangeService;
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable("id") final int id, final Model model, HttpSession session) {

		Product product = productService.getOne(id);
		if (product == null) {
			return "redirect:/";
		}
		// 已公開
		if (TrueFalse.TRUE == product.getPostStatus()) {
			User user = (User) session.getAttribute("user");
			if (user != null) {
				List<Product> productList = productService.findByUserId(user.getId());
				model.addAttribute("productList", productList);
			}

			List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
			model.addAttribute("product", product);
			model.addAttribute("productPictures", productPictures);

			// 銘加的 上面參數session也是
			session.setAttribute("thisProduct", product);

			return "/e715/product/product";
		}
		// 未公開
		else {
			User user = (User) session.getAttribute("user");
			if (user != null && product.getUserId().getId() == user.getId()) {
				List<Product> productList = productService.findByUserId(user.getId());
				model.addAttribute("productList", productList);

				List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
				model.addAttribute("product", product);
				model.addAttribute("productPictures", productPictures);

				// 銘加的 上面參數session也是
				session.setAttribute("thisProduct", product);

				return "/e715/product/product";
			} else {
				return "redirect:/";
			}
		}

	}

	@RequestMapping(value = "/findexchange")
	@ResponseBody
	public List<Exchange> findExchange(@RequestParam("id") Integer id, Model model) {
		List<Exchange> exchanges = exchangeService.findByProductAId(id);
		for (Exchange exchange : exchanges) {
			log.error("agagsfsdf"+exchange.getProductBId().getName());
		}
		
		List<Exchange> exchangesRemove = new ArrayList<Exchange>();
		if (exchanges != null) {
			for (Exchange exchange : exchanges) {
				if(TrueFalse.TRUE == exchange.getProductBId().getTradeStatus() &&
						exchange.getTradeStatus()!=TrueFalse.TRUE){
					exchangesRemove.add(exchange);
				}
			}
			exchanges.removeAll(exchangesRemove);
		}
//		for (Exchange exchange : exchanges) {
//			log.error("fdasfasdf"+exchange.getProductBId().getName());
//		}
		
		
//		if (exchanges != null) {
//			List<Exchange> exchangesBA = null;
//			List<Exchange> exchangesBB = null;
//			List<Exchange> exchangesCheck = null;
//			List<Exchange> exchangesRemove = new ArrayList<Exchange>();
//			
//			// 列出ProductB有關的所有交易
//			for (Exchange exchange : exchanges) {
//				exchangesBA = exchangeService.findByProductAId(exchange.getProductBId().getId());
//				if (exchangesBA != null) {
//					if (exchangesCheck != null) {
//						exchangesCheck.addAll(exchangesBA);
//					} else {
//						exchangesCheck = exchangesBA;
//					}
//				}
//				exchangesBB = exchangeService.findByProductBId(exchange.getProductBId().getId());
//				if (exchangesBB != null) {
//					if (exchangesCheck != null) {
//						exchangesCheck.addAll(exchangesBB);
//					} else {
//						exchangesCheck = exchangesBB;
//					}
//				}
//			}
//
//			if (exchangesCheck != null) {
//				for (Exchange check : exchangesCheck) {
//					// 確認ProductB是否已交易過
//					if (TrueFalse.TRUE == check.getTradeStatus()) {
//						for (Exchange exchange : exchanges) {
//							if (exchange.getProductBId().getId() == check.getProductAId().getId()) {
////								// 移除交易過的ProductB
//								exchangesRemove.add(exchange);
//							}
//						}
//						exchanges.removeAll(exchangesRemove);
//					}
//				}
//			}
//		}
		return exchanges;
	}

	@RequestMapping(value = "/findexchanged")
	@ResponseBody
	public List<Exchange> findExchanged(@RequestParam("id") Integer id, Model model) {
		List<Exchange> exchanges = exchangeService.findByProductBId(id);

		return exchanges;
	}

	@RequestMapping(value = "/findproductimg")
	@ResponseBody
	public ProductPicture findProductPicture(@RequestParam("id") Integer id, Model model) {
		Product product = productService.getOne(id);
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		if (productPictures != null && productPictures.size() != 0) {
			return productPictures.get(0);
		} else {
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

	// 新增商品
	@RequestMapping(value = "/insert")
	public String insert(Model model, @ModelAttribute Product product, @RequestParam("pCategory") int pCategory,
			@RequestParam("pPicture") MultipartFile pPicture, @RequestParam("pStatusBad") String pStatusBad,
			@RequestParam("pWishItem") String pWishItem, @RequestParam("pStartTime") String pStartTime,
			@RequestParam("pDeadline") String pDeadline, HttpSession session) {

		// 錯誤訊息顯示
		// Map<String, String> errorMessage = new HashMap<>();
		// session.removeAttribute("errorMsg");
		// session.setAttribute("errorMsg", errorMessage);
		// //error1 pStatusBad= null
		// if(product.getStatus() == "破損"){
		// if(pStatusBad == null || pStatusBad.trim().length() == 0){
		// errorMessage.put("status", "請描述損壞情形");
		// }
		// }
		// //error3 time = null
		// if(product.getPostStatus() == TrueFalse.TRUE){
		// if(pStartTime == null || pStartTime.trim().length() == 0){
		// errorMessage.put("timeS", "請輸入起始時間");
		// }
		// if(pDeadline == null || pDeadline.trim().length() == 0){
		// errorMessage.put("timeD", "請輸入結束時間");
		// }
		// }
		// //error2 wishItem = null
		// if(product.getWishItem() == "希望商品"){
		// if(pWishItem == null || pWishItem.trim().length() == 0){
		// errorMessage.put("wish", "請輸入希望清單");
		// }
		// }
		// //若有錯誤回新增畫面
		// if(errorMessage != null && !errorMessage.isEmpty()) {
		// return "redirect:/product/add";
		// }

		// 取userId
		User userData = (User) session.getAttribute("user");

		// 物品狀態 輸入值修改
		String productStatus = null;
		if (product.getStatus() == "破損") {
			productStatus = product.getStatus() + "(" + pStatusBad + ")";
		} else {
			productStatus = product.getStatus();
		}

		// 希望清單 輸入值判斷
		String productWish = null;
		if (product.getWishItem() == "希望商品") {
			productWish = pWishItem;
		} else {
			productWish = product.getWishItem();
		}

		// 時間處理
		LocalDateTime startTime = null;
		LocalDateTime deadline = null;
		if (product.getPostStatus() == TrueFalse.TRUE) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			String monthS = pStartTime.substring(0, 2);
			String dayS = pStartTime.substring(3, 5);
			String yearS = pStartTime.substring(6, 10);
			String start = yearS + "-" + monthS + "-" + dayS + " 00:00"; // "1986-04-08";
			try {
				startTime = LocalDateTime.parse(start, formatter);
			} catch (Exception e) {
			}
			String monthD = pDeadline.substring(0, 2);
			String dayD = pDeadline.substring(3, 5);
			String yearD = pDeadline.substring(6, 10);
			String end = yearD + "-" + monthD + "-" + dayD + " 00:00"; // "1986-04-08";
			try {
				deadline = LocalDateTime.parse(end, formatter);
			} catch (Exception e) {
			}
		} else {
			startTime = null;
			deadline = null;
		}

		// 存入資料
		Product newProduct = productService.insert(product.getName(), userData.getId(), pCategory, productStatus,
				product.getDescription(), deadline, startTime, product.getTransactionTime(), product.getLocation(),
				product.getTradeWay(), productWish, product.getPostStatus());
		System.out.println("newProduct========================" + newProduct);
		if (newProduct != null) {
			model.addAttribute("result", "success");
			session.setAttribute("new", newProduct);
		} else {
			model.addAttribute("result", "fail");
		}

		// 存取productPicture
		String path = productPictureService.upLoadImage(newProduct.getId(), servletContext, pPicture);
		int numPicture = productPictureService.insertImage(newProduct.getId(), path);
		if (numPicture == 1) {
			model.addAttribute("picResult", "圖片新增成功");
		} else {
			model.addAttribute("picResult", "圖片新增失敗");
		}

		return "/e715/product/productedit";

	}

	// 交易確認頁面
	@RequestMapping(value = "/makeSure")
	public String exchangeMakeSure(Model model, @RequestParam("id") int exId, HttpSession session) {
		Exchange exchange = exchangeService.findOne(exId);
		session.setAttribute("makeSure", exchange);
		
		String s = exchange.getProductBId().getDeadline().toString();
		String ss = s.substring(0, 10);
		session.setAttribute("ss", ss);
		
		List<ProductPicture> pa = productPictureService.getProductPictures(exchange.getProductAId());
		List<ProductPicture> pb = productPictureService.getProductPictures(exchange.getProductBId());
		model.addAttribute("pa", pa);
		model.addAttribute("pb", pb);
		
		// 時間顯示（年月日分秒）
//		String tradeTime = exchange.getTradeFinishedTime().toString();
//		String year = tradeTime.substring(0, 4);
//		String month = tradeTime.substring(5, 7);
//		String day = tradeTime.substring(8, 10);
//		String hour = tradeTime.substring(11, 13);
//		String minute = tradeTime.substring(14, 16);
//		String second = tradeTime.substring(17, 19);
//		String finalTradeTime = year + "年" + month + "月" + day + "日" + hour + "時" + minute + "分" + second + "秒";
//		session.setAttribute("finalTradeTime", finalTradeTime);
		
		return "/e715/product/proExMakeSure";
	}
	
	// 交易進行中頁面
	@RequestMapping(value = "/exchanging")
	public String exchanging(Model model, @RequestParam("id") int exId, HttpSession session) {
		Exchange exchange = exchangeService.finishTrade(exId);
		session.setAttribute("exchange", exchange);

		List<ProductPicture> pa = productPictureService.getProductPictures(exchange.getProductAId());
		List<ProductPicture> pb = productPictureService.getProductPictures(exchange.getProductBId());
		model.addAttribute("pa", pa);
		model.addAttribute("pb", pb);
		
		
		// 時間顯示（年月日分秒）
		String tradeTime = exchange.getTradeFinishedTime().toString();
		String year = tradeTime.substring(0, 4);
		String month = tradeTime.substring(5, 7);
		String day = tradeTime.substring(8, 10);
		String hour = tradeTime.substring(11, 13);
		String minute = tradeTime.substring(14, 16);
		String second = tradeTime.substring(17, 19);
		String finalTradeTime = year + "年" + month + "月" + day + "日" + hour + "時" + minute + "分" + second + "秒";
		session.setAttribute("finalTradeTime", finalTradeTime);

		// 倒數時間計算
		Date d1 = Date.from(exchange.getTradeFinishedTime().atZone(ZoneId.systemDefault()).toInstant());
		Long long1 = d1.getTime();
		LocalDateTime l1 = exchange.getProductAId().getDeadline();
		Date d2 = Date.from(l1.atZone(ZoneId.systemDefault()).toInstant());
		Long long2 = d2.getTime();
		session.setAttribute("long1", long1);
		session.setAttribute("long2", long2);

		return "/e715/product/proExchanging";
	}
	
	//評分
	@RequestMapping(value = "/grade")
	public String grade(Model model, @RequestParam("g") int g, HttpSession session) {
		User loginUser = (User) session.getAttribute("user");
		Exchange exchange = (Exchange) session.getAttribute("exchange");
		User ua = exchange.getProductAId().getUserId();
		Grade point = null;
		if(g == 1){
			point = Grade.DAMN;
		}else if (g == 2){
			point = Grade.BAD;
		}else if (g == 3){
			point = Grade.SOSO;
		}else if (g == 5){
			point = Grade.GOOD;
		}else if (g == 5){
			point = Grade.GREAT;
		}else{
			point = null;
		}
		int i = 0;
		if(loginUser.getId() == ua.getId()){
			
			i = exchangeService.gradeProductX(exchange.getProductBId(), point);
		}else{
			i = exchangeService.gradeProductX(exchange.getProductAId(), point);
		}
		if(i == 1){
			model.addAttribute("ans", "success");
		}else{
			model.addAttribute("ans", "fail");
		}
			
		return "/e715/product/proExchanging";
	}
	
	
	@RequestMapping(value = "/querytradstatus")
	@ResponseBody
	public List<Product> querytradstatus(@RequestParam("id") Integer id, HttpSession session) {
		List<Product> list = null;
		list = productService.findByNameAndStatus(id);

		return list;

	}
	@RequestMapping(value="/checkexchanged")
	@ResponseBody
	public String checkexchanged(@RequestParam("bid")int bid,@RequestParam("aid")int aid){
		if(exchangeService.findByProductAANDProductB(aid, bid).size()==0){
			return "true";
		}else{
			return "false";
		}
	}
	
	//by雙 我要交換按鈕
	@RequestMapping(value="/exchange/{Bid}/{Aid}", method = RequestMethod.GET)
	public String exchangeproduct(@PathVariable("Bid")final int bid,@PathVariable("Aid")final int aid){	
			exchangeService.addexchange(aid, bid);
		return "redirect:/product/"+aid;
	}

}