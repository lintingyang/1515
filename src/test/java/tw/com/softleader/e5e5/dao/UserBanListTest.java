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

	@Test
	public void testCrud() {

	UserBanList ubs = new UserBanList();
	ubs.setUserByUserAId( new User(2));
	ubs.setUserByUserBId(new User(5));
	userbanlistdao.save(ubs);	
	
	
	
//		List<UserBanList> ubss = userbanlistdao.findAll();
//		for(UserBanList ubs : ubss){
//		log.debug(ubs);
//		}
		
		
	}

}
