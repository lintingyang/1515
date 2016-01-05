package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.UserBanListDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.UserBanList;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class UserBanListServiceTest {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserBanListService ublService;

	
	
	@Test
	public void testFindOneUser() {
	;
		List<UserBanList> test = ublService.findOneUser(1);
		for(UserBanList ubl:test){
			log.debug(ubl);
		}
	}

//	@Test
//	public void testinsert(){
//		int ubs = ublService.insert(5,1);
//		
//		log.debug(ubs);
//		
//	}
//	
//	@Test
//	public void testDelete(){
//		boolean ubs = ublService.deletOne(5, 1);
//		
//		log.debug(ubs);
//	}
	
	
	
}
