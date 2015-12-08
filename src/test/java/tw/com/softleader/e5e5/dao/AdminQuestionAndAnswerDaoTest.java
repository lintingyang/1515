package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.AdminQuestionAndAnswer;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})

public class AdminQuestionAndAnswerDaoTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminQuestionAndAnswerDao adminQuestionAndAnswerDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Test
	public void testFind() {
//		
//		Admin admin = adminDao.findOne(1);
//		Admin admin2 = new Admin();
//		admin2.setName("test save");
//		adminDao.save(admin2);
//		log.error(admin);
//		List<AdminQuestionAndAnswer> a =  adminQuestionAndAnswerDao.findByAdmin(admin);
//		for(AdminQuestionAndAnswer aa: a){
//			log.error(a);
//		}
		adminQuestionAndAnswerDao.delete(1);
		
		
	}

}
