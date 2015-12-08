package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { E5e5App.class })
public class QuestionAndAnswerDaoTest {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private QuestionAndAnswerDao qandaDao;

	@Autowired
	private ProductDao productDao;

	@Test
	public void testFindByProduct() {
		Product product = productDao.findOne(3);
		log.info(product);
		List<QuestionAndAnswer> qandas = qandaDao.findByProduct(product);
		for (QuestionAndAnswer qa : qandas) {
			log.info(qa);
		}
	}

	@Test
	public void testFindAll(){
		List<QuestionAndAnswer> qandas = qandaDao.findAll();
		for(QuestionAndAnswer qa:qandas){
			log.info(qa);
		}
	}
	
	@Test
	public void testInsert(){
		
	}
}
