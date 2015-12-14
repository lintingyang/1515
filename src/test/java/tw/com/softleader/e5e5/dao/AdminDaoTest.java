package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class AdminDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminDao adminDao;
	

	@Test
	public void testFindAll() {
	
		
//		Admin dbEntity = adminDao.findByAccount("abc");
//		log.debug(dbEntity);
//		Admin admin = new Admin();
//		admin.setPassword("123456");
//		admin.setName("xyz");		
//		adminDao.save(admin);

		
		List<Admin> boardCategories = adminDao.findByName("abc");
		
		for(Admin b:boardCategories) {
			log.debug(b);
		}
		
	}

}
