package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.Admin;


public class AdminDaoTest extends AbstractTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminDao adminDao;
	

	@Test
	public void testFindAll() {
	
		
		Admin dbEntity = adminDao.findByAccount("1");
		log.debug(dbEntity);
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
