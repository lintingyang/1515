package tw.com.softleader.e5e5.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ChatDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;

@Service
public class ChatService {

	private ChatDao chatDao;
	private UserDao userDao;

	@Autowired
	public ChatService(ChatDao chatDao,UserDao userDao) {
		this.chatDao = chatDao;
		this.userDao = userDao;
	}

	@Transactional
	public List<Chat> getLastThreeChats() {
		// ChatDao chatDao= new ChatDao();
		List<Chat> chats = chatDao.findAllOrderBySendTime();
		return chats;
	}

	@Transactional
	public Chat postChat(int userId, String messages) {
		Chat result = null;
		Chat chat = new Chat();
		User user = userDao.findOne(userId);

		chat.setMessages(messages);
		chat.setUser(user);
		chat.setSendTime(new Date());
		result = chatDao.save(chat);

		return result;
	}

}
