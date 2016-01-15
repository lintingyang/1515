package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.LogMailDao;
import tw.com.softleader.e5e5.dao.MailDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class MailService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MailDao mailDao;
	@Autowired
	private UserDao userDao;
	@Autowired 
	private LogMailDao logMailDao;
	
	public List<Mail> getAllMailByReceiver(int id){
		List<Mail> mails = mailDao.findByReceiverOrderBySendTimeDesc(userDao.findOne(id));
		return mails;
	}
	
	public void updateIsImportant(int id, String isImportant){
		Mail mail = mailDao.findOne(id);
		if("true".equals(isImportant)){
		mail.setIsImportant(TrueFalse.TRUE);
		} else {
			mail.setIsImportant(TrueFalse.FALSE);
		}
		mailDao.save(mail);
	}
	
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
		if(saveAsLog.equals("true")){
			LogMail logMail = new LogMail();
			logMail.setSender(userDao.getOne(senderId));
			logMail.setReceiver(userDao.findByAccount(receiverAccount));
			logMail.setTitle(title);
			logMail.setArticle(article);
			logMail.setSendTime(LocalDateTime.now());
			logMail.setIsBackup(TrueFalse.TRUE);
			logMail.setIsTrash(TrueFalse.FALSE);
			logMail.setIsDraft(TrueFalse.FALSE);
			logMailDao.save(logMail);
		}
		
	}
}
