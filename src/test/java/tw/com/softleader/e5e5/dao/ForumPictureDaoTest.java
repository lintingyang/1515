package tw.com.softleader.e5e5.dao;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.ForumPicture;
import tw.com.softleader.e5e5.entity.Thread;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ForumPictureDaoTest {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ForumPictureDao forumPicture;
	@Autowired
	private ThreadDao threadDao;
	
	@Test
	public void testCRUD(){
		ForumPicture forumPicture = new ForumPicture();
		Thread thread = threadDao.findOne(7);
		forumPicture.setPicture("http://");
	}
	
}
