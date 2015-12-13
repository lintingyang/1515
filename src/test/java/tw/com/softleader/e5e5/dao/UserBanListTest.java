package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;




@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class UserBanListTest {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserBanListDao userbanlistdao;
	
	@Autowired
	private UserDao userDao;

	@Test
	public void testCrud() {
//	User u1 = userDao.findById(2);
//	User u2 = userDao.findById(5);
//
//	UserBanList ubs = new UserBanList();
//	ubs.setUserByUserAId(u1);
//	ubs.setUserByUserBId(u2);
//	userbanlistdao.save(ubs);
		
		
		List<UserBanList> ubss = userbanlistdao.findByUserAId(1);
		for(UserBanList ubs : ubss){
			log.debug(ubs);
		}
		
		
//		List<UserBanList> ubss = userbanlistdao.findAll();
//		for(UserBanList ubs : ubss){
//		log.debug(ubs);
//		}
		
		
	}

}
