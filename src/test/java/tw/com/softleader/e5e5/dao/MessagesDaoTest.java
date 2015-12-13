package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Messages;
import tw.com.softleader.e5e5.entity.User;





@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class MessagesDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MessagesDao messagesDao;
	
	
	@Test
	public void testCrud() {
		
//		Messages msg = new Messages();
//		msg.setReadTime(new java.util.Date(32767321L));
//		msg.setArticle("gagagagaga");
//		msg.setUserBySenderId(new User(1));
//		msg.setUserByReceiverId(new User(3));
//		msg.setReadTime(new java.util.Date());
//		messagesDao.save(msg);
		

		
		
		List<Messages> msg1 = messagesDao.findBySenderId(1);
		for(Messages msg : msg1){
		log.debug(msg);
		}
//		List<Messages> temp = messagesDao.findByUser(new User(2));
//		for(Messages msg2 : temp){
//			log.debug(msg2);
//		}
		
		
		
		
		
		
	}

}
