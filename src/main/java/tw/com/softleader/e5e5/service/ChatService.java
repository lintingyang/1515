package tw.com.softleader.e5e5.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.common.dao.GenericDao;
import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ChatDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.security.entity.SecRole;

@Service
public class ChatService extends OurService<Chat> {
	
	@Autowired
	private ChatDao chatDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public OurDao<Chat> getDao() {
		return chatDao;
	}

	@Transactional
	public List<Chat> getLastThreeChats() {
		List<Chat> chats = chatDao.findAllOrderBySendTime();
		return chats;
	}

	@Transactional
	public Chat postChat(int userId, String messages) {
		Chat result = null;
		Chat chat = new Chat();
		User user = (User) userDao.findOne(userId);

		chat.setMessages(messages);
		chat.setUser(user);
		chat.setSendTime(new Date());
		result = chatDao.save(chat);

		return result;
	}
	@Transactional
	public Chat postChat(int userId, String messages,String picture) {
		Chat result = null;
		Chat chat = new Chat();
		User user = (User) userDao.findOne(userId);
		
		chat.setMessages(messages);
		chat.setUser(user);
		chat.setPicture(picture);
		chat.setSendTime(new Date());
		result = chatDao.save(chat);
		
		return result;
	}
	@Transactional
	public Chat update(int id, String messages) {
		Chat chat = new Chat();
		chat =  chatDao.findOne(id);

		chat.setMessages(messages);
		Chat result = chatDao.save(chat);

		return result;
	}
	@Override
	protected List<Message> validateInsert(Chat entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(Chat entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}


}
