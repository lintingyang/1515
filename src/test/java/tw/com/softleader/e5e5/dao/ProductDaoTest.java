package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.*;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Log4j
public class ProductDaoTest extends AbstractTest  {
	
	@Autowired
	private ProductDao productDao;
	
	@Test
	public void testCrud(){
		
		
		List<Product> entities = productDao.findUsersProductsByIsPosted(2, TrueFalse.FALSE);
		assertEquals(0, entities.size());

//		
//		List<Product> entities = productDao.findAll();
//		
//		assertEquals(0, entities.size());
//		
//		Product newProduct = new Product();
//		newProduct.setName("麻將桌");
////		newProduct.setCategory(categry);
////		newProduct.setUserId(userId);
//		newProduct.setPostTime(LocalDateTime.now());
//		newProduct.setDeadline(LocalDateTime.of(2016, 12, 31, 23, 59));
//		newProduct.setLocation("台北市捷運大安站");
//		newProduct.setTradeWay("面交");
//		newProduct.setWishItem("檯燈、電腦散熱器、行動電源");
////		newProduct.setPostStatus(TrueFalse.FALSE);
//		newProduct.setClickTimes(3);
//		newProduct = productDao.save(newProduct); 
//		
//		entities = productDao.findAll();
//		assertEquals(1, entities.size());
//		
//		Product oneProduct = productDao.findOne(newProduct.getId());
//		oneProduct.setLocation("台北市捷運忠孝復興站");
//		newProduct = productDao.save(oneProduct);
//		
//		Product updateProduct = productDao.findOne(newProduct.getId());
//		assertEquals("台北市捷運忠孝復興站", updateProduct.getLocation());
//		
//		productDao.delete(oneProduct.getId());
//		
//		entities = productDao.findAll();
//		assertEquals(0, entities.size());
//		
	}
}
