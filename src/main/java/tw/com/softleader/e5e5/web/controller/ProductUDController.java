package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import tw.com.softleader.e5e5.entity.enums.Time;
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
		} else if (query.equals("exchanging")) { // 我想跟別人交換 沒排序 是錯的
			products = productService.findUsersProductsByExchange(user.getId(), "FALSE", "TRUE");
		} else if (query.equals("OthersExchanged")) { // 原本是別人的，現在是我的。 已交換(待改)
			products = productService.findUsersProductsByExchange(user.getId(), "TRUE", "FALSE");
		} else if (query.equals("myExchanged")) { // 原本是我的，現在是別人的。 已交換(待改)
			products = productService.findUserPostedProductsByExchanged(user.getId());
		} else if (query.equals("question")) {
			products = productService.findByUsersProductsIsPosted(user.getId(), "TRUE");
		} else if (query.equals("answer")) {
			products = productService.findProductByQuestionerQA(user.getId());
		}

		return products;
	}

	// 已刊登的物品別人想交換的總數
	@ResponseBody
	@RequestMapping(value = "/queryCount")
	public int productCount(@RequestParam("id") Integer id, @RequestParam("query") String query) {
		if (query.equals("posted")) {
			return productService.findCountByProductBId(id);
		}
		return -1;
	}

	// 已刊登的物品新的問與答
	@ResponseBody
	@RequestMapping(value = "/queryQA")
	public int qACount(@RequestParam("id") Integer id, @RequestParam("query") String query, HttpSession session) {
		if (query.equals("question")) {
			return productService.findCountByProductAQA(id);
		}
		if (query.equals("answer")) {
			User user = (User) session.getAttribute("user");
			return productService.findCountByQuestionerQA(id, user.getId());
		}
		return -1;
	}

	// query載入物品圖片
	@ResponseBody
	@RequestMapping(value = "/queryimg")
	public Product imglist(@RequestParam("id") Integer id, Model model) {
		// Product product = productService.getOne(id);
		// List<ProductPicture> list =
		// productPictureService.getProductPictures(product);
		return productService.getOne(id);
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
		productService.updateBackPostStatus(id, TrueFalse.FALSE);
		status = 1;
		return "/e715/product/productedit";
	}

	// 顯示交易完成頁面
	@ResponseBody
	@RequestMapping(value = "/exchangedProduct")
	public int exchangedProduct(@RequestParam("id") Integer productId) {
		return productService.findExchangeIdByProductId(productId);
	}

	// 點選編輯
	@RequestMapping(value = "/edit/{id}")
	public String edit(@PathVariable("id") final int id, final Model model, HttpSession session) {
		Product product = productService.getOne(id);
		model.addAttribute("productY", product);
		session.setAttribute("productId", id);
		// 抓物品圖片
		List<ProductPicture> productPictures = productPictureService.getProductPictures(product);
		model.addAttribute("productPicturesY", productPictures);
		return "/e715/product/proEdit";
	}

	// 編輯物品
	@RequestMapping(value = "/update")
	public String update(Model model, @ModelAttribute Product product, @RequestParam("pCategory") int pCategory,
			@RequestParam("pPicture") MultipartFile pPicture, @RequestParam("pPicture1") MultipartFile pPicture1,
			@RequestParam("pPicture2") MultipartFile pPicture2, @RequestParam("pPicture3") MultipartFile pPicture3,
			@RequestParam("pStatusBad") String pStatusBad, @RequestParam("pWishItem") String pWishItem,
			@RequestParam("pDeadline") String pDeadline, HttpSession session) {

		// 錯誤訊息顯示
		Map<String, String> errorMessage = new HashMap<>();
		session.removeAttribute("errorMsg");
		session.setAttribute("errorMsg", errorMessage);

		// 物品狀態 輸入值修改
		String productStatus = null;
		if (product.getStatus().equals("破損")) {
			productStatus = product.getStatus() + "(" + pStatusBad + ")";
		} else {
			productStatus = product.getStatus();
		}

		// 時間處理
		LocalDateTime startTime = null;
		LocalDateTime deadline = null;

		// 時段、地點、方式、希望清單
		Time tradeTime = null;
		String location = null;
		String tradeWay = null;
		String productWish = null;

		if (product.getPostStatus() == TrueFalse.TRUE) {
			startTime = LocalDateTime.now();

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			String monthD = pDeadline.substring(0, 2);
			String dayD = pDeadline.substring(3, 5);
			String yearD = pDeadline.substring(6, 10);
			String end = yearD + "-" + monthD + "-" + dayD + " 00:00"; // "1986-04-08";
			deadline = LocalDateTime.parse(end, formatter);

			if (deadline.isBefore(startTime)) {
				errorMessage.put("timeD", "截止日期一定要比今天晚喔！！");
				if (errorMessage != null && !errorMessage.isEmpty()) {
					return "redirect:/product/update"; // 重新導向update
				}
			}

			tradeTime = product.getTransactionTime();
			location = product.getLocation();
			tradeWay = product.getTradeWay();
			// 希望清單 輸入值判斷
			if (product.getWishItem().equals("希望商品")) {
				productWish = pWishItem;
			} else {
				productWish = product.getWishItem();
			}

		} else {
			startTime = null;
			deadline = null;
			tradeTime = null;
			location = null;
			tradeWay = null;
			productWish = null;
		}

		// 存入資料
		Product editProduct = productService.update((Integer) session.getAttribute("productId"), product.getName(),
				pCategory, productStatus, product.getDescription(), deadline, startTime, tradeTime, location, tradeWay,
				productWish, product.getPostStatus());
		if (editProduct != null) {
			model.addAttribute("result", "success");
			// session.setAttribute("new", editProduct);
		} else {
			model.addAttribute("result", "fail");
		}

		// 存取productPicture 讀取新圖跟砍檔(別忘記jsp的enctype
		// pPicture 是 primaryPicture in product
		if (!pPicture.isEmpty()) {
			Product productPrimaryPic = productService.getOne(editProduct.getId());
			if (productPrimaryPic.getPrimaryPicture() != null)
				productService.deletePrimaryPic(editProduct.getId(), servletContext);
			String path = productPictureService.upLoadImage(editProduct.getId(), servletContext, pPicture);
			productService.insertPrimaryPic(editProduct.getId(), path);
		}
		if (!pPicture1.isEmpty()) {
			List<ProductPicture> productPic = productPictureService.getProductPictures(editProduct);
			if (productPic.size() > 0) {
				productService.deleteImage(editProduct.getId(), 0, servletContext);
			}
			String path1 = productPictureService.upLoadImage(editProduct.getId(), servletContext, pPicture1);
			productPictureService.insertImage(editProduct.getId(), path1);
		}

		if (!pPicture2.isEmpty()) {
			List<ProductPicture> productPic = productPictureService.getProductPictures(editProduct);
			if (productPic.size() > 1)
				productService.deleteImage(editProduct.getId(), 1, servletContext);
			String path2 = productPictureService.upLoadImage(editProduct.getId(), servletContext, pPicture2);
			productPictureService.insertImage(editProduct.getId(), path2);
		}

		if (!pPicture3.isEmpty()) {
			List<ProductPicture> productPic = productPictureService.getProductPictures(editProduct);
			if (productPic.size() > 2)
				productService.deleteImage(editProduct.getId(), 2, servletContext);
			String path3 = productPictureService.upLoadImage(editProduct.getId(), servletContext, pPicture3);
			productPictureService.insertImage(editProduct.getId(), path3);
		}

		return "/e715/product/productedit";

	}

}
