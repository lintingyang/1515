package tw.com.softleader.e5e5.service;


import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.AdminQuestionAndAnswer;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { E5e5App.class })
public class AdminQuestionAndAnswerServiceTest {
	@Autowired
	private AdminQuestionAndAnswerService adminqaService;
	
	Logger log = Logger.getLogger(this.getClass());
	@Test
	public void testFindByAdmin() {
		List<AdminQuestionAndAnswer> list = adminqaService.findAll();
		for(AdminQuestionAndAnswer result : list){
			log.error(result);
		}
	}

//	@Test
//	public void testFindAllUnAnswer() {
//		log.error(adminqaService.findAllUnAnswer());
//	}
//
//	@Test
//	public void testFindAllAnswered() {
//		log.error(adminqaService.findAllAnswered());
//	}

}
