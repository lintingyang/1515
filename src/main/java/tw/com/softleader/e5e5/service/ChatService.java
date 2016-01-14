package tw.com.softleader.e5e5.service;


import java.time.LocalDateTime;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ChatDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.User;

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
		chat.setSendTime(LocalDateTime.now());
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
		chat.setSendTime(LocalDateTime.now());
		result = chatDao.save(chat);
		
		return result;
	}
	@Transactional
	public Chat postImage(int userId,String picture) {
		Chat result = null;
		Chat chat = new Chat();
		User user = (User) userDao.findOne(userId);
		chat.setUser(user);
		chat.setPicture(picture);
		chat.setSendTime(LocalDateTime.now());
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
	@Transactional
	public String upLoadImage(int id, ServletContext servletContext,MultipartFile file) {
		BufferedImage src = null;
		int counter=0;
		String path = "/resources/chatimgs/";

		path = servletContext.getRealPath(path);
		File destination = null;
		try {
			src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			if (!(new File(path)).exists()) {
				(new File(path)).mkdir();
			}

			destination = new File(path + String.valueOf(id)+"_"+file.getOriginalFilename());
			while(destination.exists()){
				counter++;
				destination = new File(path+ String.valueOf(id)+"_"+counter+"_"+file.getOriginalFilename());
			}
			ImageIO.write(src, "png", destination);
			String finalP= destination.getAbsolutePath().replace('\\', '/');
			int cut=finalP.indexOf("webapp");
			finalP=finalP.substring(cut+6);
			return finalP;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
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
