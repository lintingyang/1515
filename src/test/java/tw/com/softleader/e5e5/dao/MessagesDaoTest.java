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
//		msg.setReceiverId("2");
//		msg.setArticle("gagagagaga");
//		msg.setSenderId("dfbsffsgerhhner");
//		msg.setUser(new User(3));
//		messagesDao.save(msg);
		
//		Messages msg = new Messages();
//		msg.setId(1);
//		msg.setReadTime(new java.util.Date(50));
//		msg.setArticle("hahahahahah");
//		msg.setSenderId("asdasdsad");
//		msg.setUser(new User(2));
//		messagesDao.save(msg);
		
//		Messages msg = new Messages();
//		msg.setUser(new User(3));
//		messagesDao.delete(msg);
		
//		Messages msg1 = messagesDao.findById(1);
//		log.debug(msg1);
//		
//		List<Messages> temp = messagesDao.findByUser(new User(2));
//		for(Messages msg2 : temp){
//			log.debug(msg2);
//		}
		
		
		
		
		
		
	}

}
