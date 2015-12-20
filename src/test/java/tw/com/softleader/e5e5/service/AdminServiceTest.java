package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.AdminDao;
import tw.com.softleader.e5e5.entity.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { E5e5App.class })
public class AdminServiceTest {
	@Autowired
	private AdminService adminService;

	Logger log = Logger.getLogger(this.getClass());

	 @Test
	 public void deleteAdminByName() {
	 int result = adminService.deleteByAccount("55555");
	 log.error("delete = " + result);
	 }
	 
	@Test
	public void updateAuthority(){
		int result = adminService.updateAuthority("345", "A");
		log.error("updateAuthority = "+ result);
	}
	
	@Test
	public void addNewAdmin(){
		int result = adminService.addNewAdmin("shuangtest", "AA", "shuang", "0000", "f228300k@gmail.com");
		log.error("addNewAdmin " + result);
	}
	
	@Test
	public void updateAdmin(){
		int result = adminService.updateAdmin("123", null, "ssss","123", "123");
		log.error("update = " + result);
	}
	
	@Test
	public void findAllAdmins() {
		List<Admin> list = adminService.findAllAdmins();
		for (Admin admin : list) {
			log.error(admin);
		}

	}

}
