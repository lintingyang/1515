package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.MessagesDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Messages;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;


@Service
public class MessagesService extends OurService<Messages>{
	
	@Autowired
	private MessagesDao messagesDao;
	@Autowired
	private UserDao userDao;
	
	
	@Transactional
	public List<Messages> findSenderAllArticle(Integer senderId){
		if(userDao.findById(senderId)!=null && messagesDao.findBySenderId(senderId)!=null){
			List<Messages> msgs = messagesDao.findBySenderId(senderId);
			return msgs;
		}
		return null;
	}
	
	public List<Messages> findByBoth(Integer senderId ,Integer receiverId){
		if(messagesDao.findBySenderId(receiverId)!=null){
			List<Messages> msgs = messagesDao.findByBoth(senderId, receiverId);
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
			msg.setDeliverTime(LocalDateTime.now());
			msg.setArticle(article);
			messagesDao.save(msg);
			return 1;
		}
		return 0;
	}
	
	@Transactional
	public int updata(Integer senderId ,Integer receiverId){
		int record = 0;
		List <Messages> temp = messagesDao.findByOther(senderId, receiverId);
		for(Messages msg : temp){
			if(msg.getReadTime() == null){
				msg.setReadTime(LocalDateTime.now());
				messagesDao.save(msg);
				record++;
			}	
		}
		return record;
	}

	@Override
	public OurDao<Messages> getDao() {
		return messagesDao;
	}

	@Override
	protected List<Message> validateInsert(Messages entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(Messages entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
}
