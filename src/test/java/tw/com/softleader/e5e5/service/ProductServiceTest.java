package tw.com.softleader.e5e5.service;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ProductServiceTest {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private UserDao userDao;
	
	//(1)最新商品列：fineAll byPostTime
	@Test
	public void testGetProductsOrderByPostTime(){
		ProductService productservice = new ProductService(productDao, userDao);
		List<Product> resultByPostTime = productservice.getProductsOrderByPostTime();
		for(Product rbpt:resultByPostTime){
			log.debug("(1)最新商品列：" + rbpt);
		}
	}
	
	//(2)點擊次數排序商品列：findAll byClickTimes
	@Test
	public void testGetProductsOrderByClickTimes(){
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> resultByClickTimes = productService.getProductsOrderByClickTimes();
		for(Product rbct:resultByClickTimes){
			log.debug("(2)點擊次數排序商品列" + rbct);
		}
	}
	
	//(3)依商品名稱搜尋：findAll byName 
	@Test
	public void testGetProductsByName(){
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> resultByProductsKeywords = productService.getProductsByName("會");
		for(Product rbpk:resultByProductsKeywords){
			log.debug("(3)依商品名稱搜尋：" + rbpk);
		}
	}
	
	//(4)依商品交換地搜尋：findAll byLocation
	@Test
	public void testGetProductsByLocation(){
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> resultByLocationKeywords = productService.getProductsByLocation("台灣大學");
		for(Product rblk:resultByLocationKeywords){
			log.debug("(4)依商品交換地搜尋" + rblk);
		}
	}

	//(5)依會員名稱搜尋：findAll byUserName 
	@Test
	public void testGetProductsByUserName(){
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> resultByUserName = productService.getProductsByUserName("張三");
		for(Product rbun:resultByUserName){
			log.debug("(5)依會員名稱搜尋：" + rbun);
		}
	}	
	
	//(6)依會員學校搜尋：findAll byUserSchoolName 
	@Test
	public void testGetProductsByUserSchoolName(){
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> resultByUserSchoolName = productService.getProductsByUserSchoolName("央");
		for(Product rbusn:resultByUserSchoolName){
			log.debug("(6)依會員學校搜尋：" + rbusn);
		}
	}	
	
	//(7)依商品種類搜尋：findAll byProductCategory 
	@Test
	public void testGetProductsByProductCategory(){
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> resultByProductCategory = productService.getProductsByProductCategory("家");
		for(Product rbpc:resultByProductCategory){
			log.debug("(7)依商品種類搜尋：" + rbpc);
		}
	}	
	
//	@Test
//	public void testGetTopclickedProducts() {
//		ProductService productService = new ProductService(productDao, userDao);
//		List<Product> result= productService.getTopclickedProducts();
//		for(Product p:result){
//			log.debug(p);
//		}
//	}
//	@Test
//	public void testFindPostedMostUser() {
//		ProductService productService = new ProductService(productDao, userDao);
//		int who= productService.findPostedMostUser();
//		User u = userDao.findById(who);
//		log.debug(u);
//	}
	

}
