package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ExchangeDaoTest {

private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ExchangeDao exchangeDao;
	
	@Autowired
	private ProductDao productDao;
	
//	@Test
//	public void testFindByExchangeTime() {
//		fail("Not yet implemented");
//	}

	@Test
	public void testFindByProductByProductAId() {
		
		Product product = productDao.findOne(3);
		log.info(product);
		List<Exchange> exchanges = exchangeDao.findByProductByProductAId(product);
		for(Exchange e:exchanges){
			log.info(e);
		}
	}

}
