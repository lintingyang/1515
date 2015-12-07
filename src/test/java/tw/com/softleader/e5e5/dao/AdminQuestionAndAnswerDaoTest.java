package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.fail;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.AdminQuestionAndAnswer;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})

public class AdminQuestionAndAnswerDaoTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminQuestionAndAnswerDao adminQuestionAndAnswerDao;
	
	@Test
	public void testFind() {
		AdminQuestionAndAnswer a = adminQuestionAndAnswerDao.findOne(1);
		log.error(a);
	}

}
