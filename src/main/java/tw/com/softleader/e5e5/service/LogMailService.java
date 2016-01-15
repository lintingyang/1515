package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.LogMailDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class LogMailService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired 
	private LogMailDao logMailDao;
	@Autowired
	private UserDao userDao;
	
	@Transactional
	public void saveDraft(int senderId,String receiverAccount,String title,String article){
		LogMail logMail = new LogMail();
		logMail.setSender(userDao.getOne(senderId));
		logMail.setReceiver(userDao.findByAccount(receiverAccount));
		logMail.setTitle(title);
		logMail.setArticle(article);
		logMail.setDraftTime(LocalDateTime.now());
		logMail.setIsBackup(TrueFalse.FALSE);
		logMail.setIsTrash(TrueFalse.FALSE);
		logMail.setIsDraft(TrueFalse.TRUE);
		logMailDao.save(logMail);
	}
	
}
