package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.FocusUserList;
import tw.com.softleader.e5e5.entity.UserBanList;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class FocusUserListDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private FocusUserListDao fulDao;
	
	@Autowired
	private UserDao userDao;
	
	@Test
	public void testCrud() {
//		User u1 = userDao.findById(1);
//		User u2 = userDao.findById(3);
//		FocusUserList ubs = new FocusUserList();
//		ubs.setUserByUserAId(u1);
//		ubs.setUserByUserBId(u2);
//		fulDao.save(ubs);
			
			
			List<Object[]> ubss = fulDao.findByUserAId(1);
			for(int i = 0 ; i < ubss.size() ; i++){
				Object[] temp = ubss.get(i);
				for (int j = 0 ; j < temp.length ; j++){
					int ubs =(int) temp[j];
					log.debug(ubs)
				;}
			}
			
			
//			List<FocusUserList> ubs1 = fulDao.findAll();
//			for(FocusUserList ubs : ubs1){
//			log.debug(ubs);
//			}
	}

}
