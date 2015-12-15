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
	private FocusUserListDao fulDao;
	
	@Autowired
	private UserDao uDao;
	
	
//	@Test
//	public void testFindOneUser() {
//		FocusUserListService fuls = new FocusUserListService(fulDao,uDao);
//		List<FocusUserList> test = fuls.findOneUser(2);
//		for(FocusUserList ful : test){
//			log.debug(ful);
//		}
//	}
	
//	@Test
//	public void testinsert(){
//		FocusUserListService fuls2 = new FocusUserListService(fulDao,uDao);
//		log.debug(fuls2.insert(2, 1));
//	}
	
	@Test
	public void testDelete(){
		FocusUserListService fuls3 = new FocusUserListService(fulDao,uDao);
		log.debug(fuls3.deletOne(5, 1));
		}
	
}
