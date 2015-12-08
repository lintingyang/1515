package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ProductDaoTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ProductDao productDao;
	
	@Test
	public void testFindByName() {
		List<Product> products = productDao.findByName("曾經天胡麻將桌");
		for(Product p:products) {
			log.debug(p);
		}
	}

	@Test
	public void testCrud() {
		//insert
//		Product productIn = new Product();
//		productIn.setName("中級會計學課本");
//		productIn.setCategory("書籍");
////		productIn.setPictureId(pictureId);
////		productIn.setVideo(video);
//		productIn.setUserByUserId(new User(2));
//		productIn.setPostTime(new Date());
////		productIn.setDeadline(new Date());
//		productIn.setLocation("台北市政治大學");
//		productIn.setTradeWay("面交");
//		productIn.setWishItem("管理學概論課本、審計學課本、統計學課本、總體經濟學課本");
//		productIn.setPostStatus('T');
//		productIn.setTradeStatus('F');
//		productIn.setClickTimes(4);
////		productIn.setExchangeId(exchangeId);
////		productIn.setItemId(itemId);
////		productIn.setItemOwnerId(itemOwnerId);
////		productIn.setTradeFinishedTime(tradeFinishedTime);
////		productIn.setGrade(grade);
////		productIn.setGradeTime(gradeTime);
//		productDao.save(productIn);
		
		//update
//		Product productUp = new Product();
//		productUp.setId(5);
//		productUp.setName("中級統計學");
//		productDao.save(productUp);
		
		
		//delete
//		productDao.delete(6);
		
		//findOne
//		Product productx = productDao.findOne(3);
//		log.debug(productx);
		
		//findAll^^^
//		List<Product> products = productDao.findAll();
//		for(Product p:products) {
//			log.debug(p);
//		}
	}

	

}
