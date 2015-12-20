package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.ForumPicture;
import tw.com.softleader.e5e5.entity.Reply;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ForumPictureDaoTest {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ForumPictureDao forumPictureDao;
	@Autowired
	private ThreadDao threadDao;
	@Autowired
	private ReplyDao replyDao;
	@Test
	public void testCRUD(){
		//insert
		ForumPicture forumPicture = new ForumPicture();
//		Thread thread = threadDao.findOne(7);
		Reply reply = replyDao.findOne(10);
		forumPicture.setPicture("http://reply");
//		forumPicture.setThread(thread);
		forumPicture.setReply(reply);
		forumPictureDao.save(forumPicture);
		
		//find
//		List<ForumPicture> pictures = forumPictureDao.findByThread(thread);
		List<ForumPicture> pictures = forumPictureDao.findByReply(reply);
		for(ForumPicture p : pictures){
			log.info(p);
		}
	
	}
	
}
