package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.FocusUserListDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.FocusUserList;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class FocusUserListServiceTest {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private FocusUserListService fulService;

	
	
//	@Test
//	public void testFindOneUser() {
//		List<FocusUserList> test = fulService.findOneUser(2);
//		for(FocusUserList ful : test){
//			log.debug(ful);
//		}
//	}
	
//	@Test
//	public void testinsert(){
//		int fuls2 = fulService.insert(2, 1);
//		log.debug(fuls2);
//	}
	
	@Test
	public void testDelete(){
		boolean fuls3 = fulService.deletOne(5, 1);
		log.debug(fuls3);
		}
	
}
