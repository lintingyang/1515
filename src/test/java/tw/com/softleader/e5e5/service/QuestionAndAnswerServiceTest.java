package tw.com.softleader.e5e5.service;
import static org.junit.Assert.assertEquals;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.QuestionAndAnswerDao;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

public class QuestionAndAnswerServiceTest extends AbstractTest{

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private QuestionAndAnswerService qandaService;
	
	@Test
	public void test() {
//		List<QuestionAndAnswer> list = qandaService.findByProductId(2);
//		log.info(list);
//		}
		
//		int result = qandaService.updateAnswer("測試", 31);
//		assertEquals(1, result);
		
		int count = qandaService.countByProduct(39);
		assertEquals(4, count);
	}

}
