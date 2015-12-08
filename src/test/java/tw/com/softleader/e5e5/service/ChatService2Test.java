package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.ChatDao;
import tw.com.softleader.e5e5.entity.Chat;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ChatService2Test {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ChatDao chatDao;
	
	@Test
	public void testGetLastThreeChats() {
		ChatService2 cs = new ChatService2(chatDao);
		List<Chat> chats=cs.getLastThreeChats();
		for(Chat c: chats){
			log.debug("Test: "+c);
		}
	}



}
