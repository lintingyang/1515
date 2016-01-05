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

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ExchangeServiceTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ExchangeService exchangeService;
	
	@Test
	public void testfindMostPopularProduct() {
		
//		Product result = es.findMostPopularProduct();
		String productName = exchangeService.findMostPopularProduct().getName();
//		log.info(result);
		log.info("最熱門物品=" + productName);
	}
	

}
