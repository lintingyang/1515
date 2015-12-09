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
	
	@Test
	public void testGetTopclickedProducts() {
		ProductService productService = new ProductService(productDao, userDao);
		List<Product> result= productService.getTopclickedProducts();
		for(Product p:result){
			log.debug(p);
		}
	}
	@Test
	public void testFindPostedMostUser() {
		ProductService productService = new ProductService(productDao, userDao);
		int who= productService.findPostedMostUser();
		User u = userDao.findById(who);
		log.debug(u);
	}
	
//	@Test
//	public void testFindPostedMostUser() {
//		ProductService productService = new ProductService(productDao, userDao);
//		User u = productService.findPostedMostUser();
//		log.debug(u);
//	}

}
