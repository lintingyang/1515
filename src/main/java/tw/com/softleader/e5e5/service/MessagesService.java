package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.MessagesDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Messages;
import tw.com.softleader.e5e5.entity.User;


@Service
public class MessagesService {
	
	@Autowired
	private MessagesDao msgDao;
	@Autowired
	private UserDao userDao;
	
	
	@Transactional
	public List<Messages> findSenderAllArticle(Integer senderId){
		if(userDao.findById(senderId)!=null && msgDao.findBySenderId(senderId)!=null){
			List<Messages> msgs = msgDao.findBySenderId(senderId);
			return msgs;
		}
		return null;
	}
	
	public List<Messages> findByBoth(Integer senderId ,Integer receiverId){
		if(msgDao.findBySenderId(receiverId)!=null){
			List<Messages> msgs = msgDao.findByBoth(senderId, receiverId);
			return msgs;
		}
		return null;
		
	}
	
	
	@Transactional
	public int insert (Integer senderId ,Integer receiverId,String article){
		if(userDao.findById(receiverId)!=null){
			Messages msg = new Messages();
			msg.setUserBySenderId(new User(senderId));
			msg.setUserByReceiverId(new User(receiverId));
			msg.setDeliverTime(new java.util.Date());
			msg.setArticle(article);
			msgDao.save(msg);
			return 1;
		}
		return 0;
	}
	
	@Transactional
	public int updata(Integer senderId ,Integer receiverId){
		int record = 0;
		List <Messages> temp = msgDao.findByOther(senderId, receiverId);
		for(Messages msg : temp){
			if(msg.getReadTime() == null){
				msg.setReadTime(new java.util.Date());
				msgDao.save(msg);
				record++;
			}	
		}
		return record;
	}
	
	
	
	
	
	
}
