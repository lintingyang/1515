package tw.com.softleader.e5e5.service;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class UserServiceTest {

	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
//	@Test
//	public void testupdataIsolated() {
//		int i = userService.updataIsolated("1", 'T');
//		log.debug(i);
//	}

	@Test
	public void testfind(){
		User temp = userService.findByAccount("1");
		log.debug(temp);
	}
	
	
}
