package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.UserOwner;



@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class UserOwnerTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserOwnerDao userOwnerDao;
	
	
	@Test
	public void testCrud() {
		
//		UserOwner uo1 = new UserOwner();
//		uo1.setUserId(4);
//		uo1.setBoard(new Board(5, null));
//		userOwnerDao.save(uo1);	
	
	//	UserOwner uo2 = new UserOwner();
	//	uo2.setId(3);
	//	uo2.setUserId(4);
	//	uo2.setBoard(new Board(5, null));
	//	userOwnerDao.save(uo2);	
			
			
//	UserOwner uo3 = new UserOwner();	
//	uo3.setUserId(4);	
//	userOwnerDao.delete(uo3);
		
		UserOwner uo4 = userOwnerDao.findById(1);
		log.debug(uo4);
		
		List<UserOwner> temp = userOwnerDao.findByUserId(3);
		for(UserOwner uo5 : temp){
			log.debug(uo5);
		}
		
		
		
	}
}
