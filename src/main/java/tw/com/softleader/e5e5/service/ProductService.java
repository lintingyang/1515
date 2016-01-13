package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ProductCategoryDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserLike;
import tw.com.softleader.e5e5.entity.enums.Time;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class ProductService extends OurService<Product> {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private ProductDao productDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private ProductCategoryDao productCategoryDao;
	@Autowired
	private UserLikeService userLikeService;

	@Transactional
	public List<Product> indexsearch(String namelike, String category, String orderby, User user) {
		List<Product> list = null;

		if (orderby.equals("熱門")) {
			if (category.equals("全部")) {
				list = productDao.findAllByNameOrderbyByClickTimes(namelike);
				log.error(list);
			} else {
				list = productDao.findByProdcutOrderByClickTimes(namelike, category);
			}
		} else if (orderby.equals("最新")) {
			if (category.equals("全部")) {
				list = productDao.findAllByNameOrderbyByPostTime(namelike);
			} else {
				list = productDao.findByProductOrderByPostTime(namelike, category);
			}
		} else if (orderby.equals("推薦")) {
			if (user != null) {
				List<UserLike> userLike = userLikeService.findUserLike(user.getId());
				for (UserLike likelist : userLike) {
					ProductCategory productCategory = productCategoryDao
							.findOne(likelist.getProductCategoryId().getId());

					if (category.equals("全部")) {
						list = productDao.findAllByNameOrderbyByClickTimes(namelike);
						log.error(list);
					} else {
						list = productDao.findByProdcutOrderByClickTimes(namelike, productCategory.getName());
					}

				}

			}
		} else if (orderby.equals("誠信")) {

		}

		return list;
	}

	@Transactional // shuang
	public List<Product> findByNameAndStatus(int id) {
		List<Product> list = productDao.findByUserIdAndStatue(id);

		return list;
	}

	@Transactional // shuang
	public List<Product> findeOrderByClickTime(String productName, String categoryName) {
		List<Product> list = productDao.findByProdcutOrderByClickTimes(productName, categoryName);
		return list;
	}

	@Transactional // shuang
	public List<Product> findByProductOrderByPostTime(String productName, String categoryName) {
		List<Product> list = productDao.findByProductOrderByPostTime(productName, categoryName);
		return list;
	}

	// (11)查詢使用者已/未刊登的物品/Enum/yao
	@Transactional
	public List<Product> findByUsersProductsIsPosted(Integer id, TrueFalse postStatus) {
		return productDao.findUsersProductsByIsPosted(id, postStatus);
	}

	// (11)查詢使用者已/未刊登的物品/String/yao
	@Transactional
	public List<Product> findByUsersProductsIsPosted(Integer id, String postStatus) {
		return productDao.findUsersProductsByIsPosted(id, postStatus);
	}

	// (12)查詢我想跟別人交換與已跟別人刊登的交換排序未解決/String/yao
	public List<Product> findUsersProductsByExchange(Integer userId, String tradeStatus, String postStatus) {
		return productDao.findUsersProductsByExchange(userId, tradeStatus, postStatus);
	}
	
	// (13)查詢自己刊登的已交換/String/yao
	public List<Product> findUserPostedProductsByExchanged(Integer userId){
		return productDao.findUserPostedProductsByExchanged(userId);
	}

	@Transactional
	public List<Product> findByUserId(Integer id) {
		return productDao.findByUserId(id);
	}

	// 後台
	// (1)findOne byId
	@Transactional
	public Product getOneById(Integer id) {
		return productDao.findOne(id);
	}

	// (2)findAll
	@Transactional
	public List<Product> getAllProducts() {
		return productDao.findAll();
	}

	// (3)update product's post_status
	@Transactional
	public Product update(Integer id, TrueFalse postStatus) {
		Product product = productDao.findOne(id);
		product.setPostStatus(postStatus);
		productDao.save(product);
		return productDao.findOne(id);
	}

	// (4)update product's post_status return int
	@Transactional
	public int updateStatus(Integer id, TrueFalse postStatus) {
		Product product = productDao.findOne(id);
		if (product != null) {
			product.setPostStatus(postStatus);// yao打開此行註解
			productDao.save(product);
			return 1;
		} else {
			return 0;
		}
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

	// // (8)查詢商品是否交易成功：findOne byTradeStatus
	// @Transactional
	// public String getProductTradeStaus(String name) {
	// try {
	// if (productDao.findOneByTradeStatus(name).equals("T")) {
	// return "交易成功";
	// } else {
	// return "尚未交易";
	// }
	// } catch (Exception e) {
	// return "查無此商品";
	// }
	// }

	// (10) 關鍵字搜尋:產品名稱、交換地、使用者名稱、產品類別
	@Transactional
	public List<Product> getAllByKeywords(String keywords) {
		if (keywords.isEmpty()) {
			return productDao.findAll();
		} else {
			return productDao.findAllByKeywords(keywords);
		}
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
	public Product insert(String name, int user, int category, String status, String description,
			LocalDateTime deadline, LocalDateTime startTime, Time transactionTime, String location, String tradeWay,
			String wishItem, TrueFalse postStatus) {
		Product product = new Product();
		product.setName(name);
		product.setUserId(userDao.findOne(user));
		product.setProductCategory(productCategoryDao.findOne(category));
		product.setStatus(status);
		product.setDescription(description);
		product.setPostTime(LocalDateTime.now());
		product.setStartTime(startTime);
		product.setDeadline(deadline);
		product.setTransactionTime(transactionTime);
		product.setLocation(location);
		product.setTradeWay(tradeWay);
		product.setWishItem(wishItem);
		product.setPostStatus(postStatus);
		product.setTradeStatus(TrueFalse.FALSE);
		productDao.save(product);
		return product;

	}

	// (14)編輯產品/yao
	@Transactional
	public Product update(int id, String name, int category, String status, String description, LocalDateTime deadline,
			LocalDateTime startTime, Time transactionTime, String location, String tradeWay, String wishItem,
			TrueFalse postStatus) {
		Product product = productDao.findOne(id);
		product.setName(name);
		product.setProductCategory(productCategoryDao.findOne(category));
		product.setStatus(status);
		product.setDescription(description);
		product.setPostTime(LocalDateTime.now());
		product.setStartTime(startTime);
		product.setDeadline(deadline);
		product.setTransactionTime(transactionTime);
		product.setLocation(location);
		product.setTradeWay(tradeWay);
		product.setWishItem(wishItem);
		product.setPostStatus(postStatus);
		productDao.save(product);
		return product;

	}

	// 查詢別人想跟我交換的物品總數/yao
	@Transactional
	public int findCountByProductBId(Integer id) {
		return productDao.findCountByProductBId(id);
	}
	
	@Transactional
	public int findExchangeIdByProductId(Integer productId){
		return productDao.findExchangeIdByProductId(productId);
	}
	@Override
	public OurDao<Product> getDao() {
		return productDao;
	}

	@Override
	protected List<Message> validateInsert(Product entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(Product entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}