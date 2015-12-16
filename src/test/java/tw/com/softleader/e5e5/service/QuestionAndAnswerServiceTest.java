package tw.com.softleader.e5e5.service;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.QuestionAndAnswerDao;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class QuestionAndAnswerServiceTest {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private QuestionAndAnswerDao qandaDao;
	@Autowired
	private ProductDao productDao;
	@Test
	public void testFindQAByProduct() {
		QuestionAndAnswerService qas = new QuestionAndAnswerService(qandaDao,productDao); 
		List<String> result = qas.findQAByProduct(productDao.findOne(3));
		for(int i = 0; i<result.size(); i++){
			String value = result.get(i);
			log.info(value);
//			String[] sa = value.split(",");
//			for(int j = 0; j<sa.length; j++){
//				log.info(sa[j]);
//			}
		}
	}

}
