package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.MailDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class MailService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MailDao mailDao;
	@Autowired
	private UserDao userDao;
	@Transactional
	public void sendNewMail(int senderId,String receiverAccount,String title,String article,String saveAsLog){
		Mail mail = new Mail();
		mail.setSender(userDao.getOne(senderId));
		mail.setReceiver(userDao.findByAccount(receiverAccount));
		mail.setTitle(title);
		mail.setArticle(article);
		mail.setIsRead(TrueFalse.FALSE);
		mail.setSendTime(LocalDateTime.now());
		mail.setIsImportant(TrueFalse.FALSE);
		mail.setIsTrash(TrueFalse.FALSE);
		mailDao.save(mail);
		
	}
}
