package tw.com.softleader.e5e5.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.AdminDao;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class AdminServiceTest {
	@Autowired
	private AdminDao adminDao;
	AdminService adminService = new AdminService(adminDao); 
	
	@Test
	public void deleteAdminByName() {
		adminService.deleteByAccount("abc");
	}

}
