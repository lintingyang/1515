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
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ProductPictureDaoTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ProductPictureDao productpictureDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Test
	public void testCrud() {
		//insert
		ProductPicture pic = new ProductPicture();
		Product product = productDao.findOne(3);
		pic.setPicture("http://picture_xx.jpg");
		pic.setProduct(product);
		productpictureDao.save(pic);
			
		//find
		List<ProductPicture> pics = productpictureDao.findByProduct(product);
		for(ProductPicture p:pics){
			log.info(p);
		}
		
//		//delete
//		productpictureDao.delete(2);
		
	}

	

}
