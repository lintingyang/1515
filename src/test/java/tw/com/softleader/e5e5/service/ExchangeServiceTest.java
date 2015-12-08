package tw.com.softleader.e5e5.service;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.ExchangeDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.entity.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ExchangeServiceTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ExchangeDao exchangeDao;
	@Autowired
	private ProductDao productDao;
	@Test
	public void testfindMostPopularProduct() {
		ExchangeService es = new ExchangeService(exchangeDao, productDao);
		Product result = es.findMostPopularProduct();
		log.info(result);
	
	}
	

}
