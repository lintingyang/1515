package tw.com.softleader.e5e5.dao;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Messages;





@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class MessagesDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MessagesDao messagesDao;
	
	
	@Test
	public void testCrud() {
		
		Messages msg = new Messages();
		msg.setArticle("asdasdasd");
		msg.setSenderId("asd");
		
		
		messagesDao.save(msg);
		
		
		
		
		
	}

}
