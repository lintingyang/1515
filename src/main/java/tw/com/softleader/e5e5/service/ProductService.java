package tw.com.softleader.e5e5.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.User;

@Service
public class ProductService {
	private final ProductDao productDao;
	private final UserDao userDao;
	
	@Autowired
	public ProductService(ProductDao productDao, UserDao userDao){
		this.productDao = productDao;
		this.userDao = userDao;
	}
	
	//(1)最新商品列：fineAll byPostTime
	@Transactional
	public List<Product> getProductsOrderByPostTime(){
		return productDao.findAllByPostTime();
	}
	
	//(2)點擊次數排序商品列：findAll byClickTimes
	@Transactional
	public List<Product> getProductsOrderByClickTimes(){
		return productDao.findAllByClickTimes();
	}
	
	//(3)依商品名稱搜尋：findAll byName 
	@Transactional
	public List<Product> getProductsByName(String productKeywords){
		//
		return productDao.findAllByName(productKeywords);
	}
	
	//(4)依商品交換地搜尋：findAll byLocation 
	@Transactional
	public List<Product> getProductsByLocation(String locationKeywords){
		//
		return productDao.findAllByLocation(locationKeywords);
	}
	
	//(5)依會員名稱搜尋：findAll byUserName 
	@Transactional
	public List<Product> getProductsByUserName(String userName){
		//
		return productDao.findAllByUserName(userName);
	}
	
	//(6)依會員學校搜尋：findAll byUserSchoolName 
	@Transactional
	public List<Product> getProductsByUserSchoolName(String userSchoolName){
		//
		return productDao.findAllByUserSchoolName(userSchoolName);
	}
	
	//(7)依商品種類搜尋：findAll byProductCategory 
	@Transactional
	public List<Product> getProductsByProductCategory(String productCategory){
		//
		return productDao.findAllByProductCategory(productCategory);
	}

	//(8)查詢商品是否交易成功：findOne byTradeStatus
	@Transactional
	public String getProductTradeStaus(String name){
		try {
			if(productDao.findOneByTradeStatus(name).equals("T")){
				return "交易成功";
			}else {
				return "尚未交易";
			}
		} catch (Exception e) {
			return "查無此商品";
		}
	}
	
	
	
	
	
	
//		@Transactional
//		public List<Product> getProductsByUserName(String userName){
//			Integer idNumber = userDao.findByName(userName);
//			//
//			return productDao.findAllByUserName(idNumber);
//		}
	
	
//	@Transactional
//	public List<Product> getTopclickedProducts(){
//		String hotProducts = productDao.findByTopClickedProduct();
//		return productDao.findByName(hotProducts);
//	}
//	
//	@Transactional
//	public int findPostedMostUser(){
//		return productDao.findByUserCounts();
//	}
	
//	@Transactional
//	public User findPostedMostUser(){
//		int id = productDao.findByUserCounts();
//		User u = userDao.findById(id);
//		return u;
//	}

}
