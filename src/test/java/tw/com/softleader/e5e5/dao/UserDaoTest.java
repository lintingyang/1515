package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.assertEquals;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.Role;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

public class UserDaoTest extends AbstractTest{
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserDao userDao;
	
	
	@Test
	public void testCrud() {
	
//		User usera = new User();
//
//		usera.setName("yoming2");
//		usera.setNickname("yo");
//		usera.setAddress("台北市大安區");
//		usera.setPassword("password");
//		usera.setAge(28);
//		usera.setBirthday(LocalDateTime.now());
//		usera.setCellphone("0911-111-111");
//		usera.setGameScore(320);
//		usera.setGameScore(30000);
//		usera.setSchoolName("中央大學");
//		usera.setEmailCheck(TrueFalse.FALSE);
//		usera.setRole(Role.USER);
//		userDao.save(usera);
//		assertEquals(Role.USER,usera.getRole());
//
//		usera.setName("aaa");
//		userDao.save(usera);
//		User userb = new User();
//		userb.setName("bbb");
//		userDao.save(userb);
//		User userc = new User();
//		userc.setName("ccc");
//		userDao.save(userc);
//		


//		User userid = userDao.findById(1);
//		log.debug(userid);
		
//		List<User> userscs = userDao.findByGameScoreGreaterThanEqualOrderByGameScoreDesc(3000);
//		for(User usersc : userscs ){
//		log.debug(usersc);
//		}
		
//		List<Object[]> userscs = userDao.findRangeScore(3000);
		
//		User us = (User) temp[0];
//		for(int j =0 ; j <= 2 ; j++){
//			Object[] temp = userscs.get(j);
//				for(int i =0 ; i <= 2 ; i++){
//					log.debug(temp[i]);
//				}
//		}
//		userDao.delete(7);
		
		
//		User useradd = userDao.findByAddressStartingWith("台北市");
//		log.debug(useradd);
		
//		User usercell = userDao.findByCellphone("0911-111-111");
//		log.debug(usercell);
		
		
//		User userone = userDao.findOne(1);
//		log.debug(userone);
		
		List<User> users = userDao.findAll();
		
		for(User u:users) {
			log.debug(u);
		}
		
		

	}

}
