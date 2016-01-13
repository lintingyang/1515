package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		return "/e715/product/productedit";
	}

	// 切換已刊登/未刊登/待交換/已交換
	@ResponseBody
	@RequestMapping(value = "/query1")
	public List<Product> list(@RequestParam("query") String query, HttpSession session) {
		log.error("orderby = " + query);
		// if (status == 2) {
		// query = (String) session.getAttribute("query");
		// status = 0;
		// } else if (status == 1) {
		// query = (String) session.getAttribute("query");
		// status = 0;
		// }

		List<Product> products = null;
		User user = (User) session.getAttribute("user");
		if (query.equals("posted")) { // 已刊登
			products = productService.findByUsersProductsIsPosted(user.getId(), "TRUE");
			// session.setAttribute("query", query);
		} else if (query.equals("notPost")) { // 未刊登
			products = productService.findByUsersProductsIsPosted(user.getId(), "FALSE");
			// session.setAttribute("query", query);
		} else if (query.equals("exchanging")) { // 我想跟別人交換 沒排序
			products = productService.findUsersProductsByExchange(user.getId(), "TRUE" , "FALSE");
		} else if (query.equals("OthersExchanged")) { // 已交換(待改)
			products = productService.findUsersProductsByExchange(user.getId(), "FALSE" , "TRUE");
		} else if (query.equals("myExchanged")) { // 已交換(待改)
			products = productService.findUserPostedProductsByExchanged(user.getId());
		}

		return products;
	}

	// 已刊登的物品別人想交換的總數
	@ResponseBody
	@RequestMapping(value = "/queryCount")
	public int productCount(@RequestParam("id") Integer id, @RequestParam("query") String query , Model model) {
		if (query.equals("posted")) { 
			return productService.findCountByProductBId(id);
		}
		return -1;
	}
	
	// 物品圖片
	@ResponseBody
	@RequestMapping(value = "/queryimg")
	public List<ProductPicture> imglist(@RequestParam("id") Integer id, Model model) {
		Product product = productService.getOne(id);
		List<ProductPicture> list = productPictureService.getProductPictures(product);
		return list;
	}

	// 刪除未刊登商品
	@ResponseBody
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {
		productService.deleteById(id);
		// status = 2;
		return "/e715/product/productedit";
	}

	// 下架已刊登商品
	@ResponseBody
	@RequestMapping(value = "/remove")
	public String remove(@RequestParam("id") Integer id, Model model) {
		productService.updateStatus(id, TrueFalse.FALSE);
		status = 1;
		return "/e715/product/productedit";
	}
	
	//點選編輯
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable("id") final int id, final Model model, HttpSession session) {
		Product product = productService.getOne(id);
		model.addAttribute("productY", product);
		session.setAttribute("productId", id);
		return "/e715/product/proEdit";
	}
	//exchange
	@RequestMapping(value = "/exchangedProduct")
	public int exchangedProduct(@RequestParam ("id") int productId ){
		log.debug("##############"+productId);
		int exchangeId = productService.findExchangeIdByProductId(48);
		String ddc = Integer.toString(exchangeId);
		log.debug("##############exchangeId "+exchangeId);
		log.debug("##############ddc "+ddc);
		
		return 16;
	}
	//編輯物品
	@RequestMapping(value = "/update")
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
		// 返回頁面
		
//		status = 2;
		// 物品實體狀態 輸入值修改
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
		product = productService.update((Integer) session.getAttribute("productId"), product.getName(), pCategory,
				productStatus, product.getDescription(), deadline, startTime, product.getTransactionTime(),
				product.getLocation(), product.getTradeWay(), productWish, product.getPostStatus());
		System.out.println("newProduct========================" + product);
		if (product != null) {
			model.addAttribute("result", "恭喜您編輯商品成功！！");
			// session.setAttribute("new", newProduct);
		} else {
			model.addAttribute("result", "編輯失敗");
		}

		// 存取productPicture
		String path = productPictureService.upLoadImage((Integer) session.getAttribute("productId"), servletContext,
				pPicture);
		int numPicture = productPictureService.insertImage((Integer) session.getAttribute("productId"), path);
		if (numPicture == 1) {
			model.addAttribute("picResult", "圖片新增成功");
		} else {
			model.addAttribute("picResult", "圖片新增失敗");
		}

		return "/e715/product/productedit";
	}

}
