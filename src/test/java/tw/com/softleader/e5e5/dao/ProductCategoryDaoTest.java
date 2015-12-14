package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.ProductCategory;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { E5e5App.class })
public class ProductCategoryDaoTest {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	@Test
	public void testCrud() {
//		ProductCategory productCategory = new ProductCategory();
//		productCategory.setName("美妝");
//		productCategoryDao.save(productCategory);
		
		ProductCategory findone = productCategoryDao.findOne(1);
		log.debug(findone);
		
		List<ProductCategory> findall = productCategoryDao.findAll();
		for(ProductCategory fa:findall){
			log.debug(fa);
		}
		
	}

}
