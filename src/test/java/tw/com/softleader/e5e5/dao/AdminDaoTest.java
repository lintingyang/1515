package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.Admin;

@Log4j
public class AdminDaoTest extends AbstractTest {

	//private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminDao adminDao;
	

	@Test
	public void testCrud() {
	
		// 1. select 
		List<Admin> entities = adminDao.findAll();
		
		assertEquals(0, entities.size());
		
		Admin newAdmin = new Admin();
		
		newAdmin.setName("admin");
		
		newAdmin = adminDao.save(newAdmin);
		assertEquals(1, newAdmin.getId());
		
		entities = adminDao.findAll();
		assertEquals(1, entities.size());
		
		
		Admin dbAdmin = adminDao.findOne(newAdmin.getId());
		dbAdmin.setEmail("test@test.com");
		dbAdmin = adminDao.save(dbAdmin);
		
		Admin testAdmin = adminDao.findOne(newAdmin.getId());
		assertEquals("test@test.com", testAdmin.getEmail());
		
		adminDao.delete(newAdmin.getId());
		
		entities = adminDao.findAll();

		
		assertEquals(0, entities.size());
	}

}
