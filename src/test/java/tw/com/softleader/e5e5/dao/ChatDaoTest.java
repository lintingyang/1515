package tw.com.softleader.e5e5.dao;


import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Chat;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ChatDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ChatDao chatDao;
	@Autowired
	private UserDao userDao;
	
	@Test
	public void testSaveS() {
//		Chat chat = new Chat();
//		User userone = userDao.findOne(4);
//		log.debug(userone);
//		
//
//		chat.setMessages("有問題想問一下");
//		chat.setSendTime(new Date());
//		chat.setUser(userone);
//		log.debug(chatDao.save(chat));
		
		List<Chat> chats = chatDao.findAllOrderBySendTime();
		for(Chat c: chats){
			log.debug("Test: "+c);
		}

			
				
	}

}
