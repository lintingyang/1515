package tw.com.softleader.e5e5.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.dao.ProductCategoryDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.User;

@Service
public class ProductService {
	private final ProductDao productDao;
	private final ProductCategoryDao productCategoryDao;

	@Autowired
	public ProductService(ProductDao productDao, ProductCategoryDao productCategoryDao) {
		this.productDao = productDao;
		this.productCategoryDao = productCategoryDao;
	}

	// (1)最新商品列：fineAll byPostTime
	@Transactional
	public List<Product> getProductsOrderByPostTime() {
		return productDao.findAllByPostTime();
	}

	// (2)點擊次數排序商品列：findAll byClickTimes
	@Transactional
	public List<Product> getProductsOrderByClickTimes() {
		return productDao.findAllByClickTimes();
	}

	// (3)依商品名稱搜尋：findAll byName
	@Transactional
	public List<Product> getProductsByName(String productKeywords) {
		//
		return productDao.findAllByName(productKeywords);
	}

	// (4)依商品交換地搜尋：findAll byLocation
	@Transactional
	public List<Product> getProductsByLocation(String locationKeywords) {
		//
		return productDao.findAllByLocation(locationKeywords);
	}

	// (5)依會員名稱搜尋：findAll byUserName
	@Transactional
	public List<Product> getProductsByUserName(String userName) {
		//
		return productDao.findAllByUserName(userName);
	}

	// (6)依會員學校搜尋：findAll byUserSchoolName
	@Transactional
	public List<Product> getProductsByUserSchoolName(String userSchoolName) {
		//
		return productDao.findAllByUserSchoolName(userSchoolName);
	}

	// (7)依商品種類搜尋：findAll byProductCategory
	@Transactional
	public List<Product> getProductsByProductCategory(String productCategory) {
		//
		return productDao.findAllByProductCategory(productCategory);
	}

	// (8)查詢商品是否交易成功：findOne byTradeStatus
	@Transactional
	public String getProductTradeStaus(String name) {
		try {
			if (productDao.findOneByTradeStatus(name).equals("T")) {
				return "交易成功";
			} else {
				return "尚未交易";
			}
		} catch (Exception e) {
			return "查無此商品";
		}
	}

	// (9) 所有商品列表：findAll
	@Transactional
	public List<Product> getAllProducts() {
		return productDao.findAll();
	}

	// (10) 關鍵字搜尋:產品名稱、交換地、使用者名稱、產品類別
	@Transactional
	public List<Product> getAllByKeywords(String keywords) {
		if (keywords.isEmpty()) {
			return productDao.findAll();
		} else {
			return productDao.findAllByKeywords(keywords);
		}
	}

	// (11)找單一產品 by id
	@Transactional
	public Product getOneById(Integer id) {
		return productDao.findOne(id);
	}

	// (12)管理員修改刊登狀態
	@Transactional
	public Product update(Integer id, char postStatus) {
		Product product = productDao.findOne(id);
		product.setPostStatus(postStatus);
		productDao.save(product);
		return productDao.findOne(id);
	}

	// (13)刪除產品
	@Transactional
	public int deleteById(Integer id) {
		Product product = productDao.findOne(id);
		if (id == null) {
			return 0;
		} else {
			productDao.delete(product);
			return 1;
		}
	}

	// (14)新增產品
	@Transactional
	public int insert(String name,int category, Date deadline, String location, String tradeWay, String wishItem) {
		Product product = new Product();
		product.setName(name);
		product.setProductCategory(productCategoryDao.findOne(category));
		product.setPostTime(new Date());
		product.setDeadline(deadline);
		product.setLocation(location);
		product.setTradeWay(tradeWay);
		product.setWishItem(wishItem);
		productDao.save(product);
		return 1;

	}
	// @Transactional
	// public int insert(String name, ProductCategory category, byte[] video,
	// User userId, Date deadline,
	// String location, String tradeWay, String wishItem) {
	// Product product = new Product();
	// product.setName(name);
	// product.setProductCategory(category);
	// product.setVideo(video);
	// product.setUserByUserId(userId);
	// product.setPostTime(new Date());
	// product.setDeadline(deadline);
	// product.setLocation(location);
	// product.setTradeWay(tradeWay);
	// product.setWishItem(wishItem);
	// productDao.save(product);
	// return 1;
	//
	// }

}
