package tw.com.softleader.e5e5.dao;


import static org.junit.Assert.*;

import java.util.Date;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.School;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class SchoolDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SchoolDao schoolDao;
	@Autowired
	private UserDao userDao;
	
	@Test
	public void testSaveS() {
		School school = new School();
		User userone = userDao.findOne(4);
		log.debug(userone);
		
		school.setArea("新竹市");
		school.setCheckMail('T');
		school.setName("交通大學");
		school.setUser(userone);
		log.debug(schoolDao.save(school));
	}

}
