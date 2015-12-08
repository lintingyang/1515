package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Reply;
import tw.com.softleader.e5e5.entity.Thread;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = { E5e5App.class })
public class ReplyDaoTest {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private ReplyDao replyDao;

	@Autowired
	private ThreadDao threadDao;
	
	@Test
	public void testCrud() {
		Reply reply = new Reply();
		Thread thread = threadDao.findOne(4);
		reply.setTitle("選我");
		reply.setCreatedDate(new java.util.Date());
		reply.setFloor(2);
		reply.setReplyContent("我會我會");
		reply.setThread(thread);
		replyDao.save(reply);

		Reply dbEntity = replyDao.findOne(1);
		log.debug(dbEntity);

		List<Reply> replies = replyDao.findByReplyContent("abc");

		for (Reply b : replies) {
			log.debug(b);
		}
	}

}
