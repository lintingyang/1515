package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.LogMailDao;
import tw.com.softleader.e5e5.dao.MailDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.entity.User;
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
	@Autowired
	private ProductDao productDao;
	
	public void deleteMail(int id){
		mailDao.delete(id);
	}
	
	public List<Mail> getAllMailByReceiver(int id){
		List<Mail> mails = mailDao.findByReceiverOrderBySendTimeDesc(userDao.findOne(id));
		return mails;
	}
	
	public List<Mail> getImportantMails(int receiverId){
		User user = userDao.findOne(receiverId);
		if(user != null){
		List<Mail> mails = mailDao.findByReceiverAndIsImportantOrderBySendTimeDesc(user, TrueFalse.TRUE);
		return mails;
		}
		return null;
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
	public void sendNewMail(int senderId,String receiverAccount,String title,String article,String saveAsLog,int logMailId){
		Mail mail = new Mail();
		mail.setSender(userDao.getOne(senderId));
		mail.setReceiver(userDao.findByAccount(receiverAccount));
		mail.setTitle(title);
		mail.setArticle(article);
		mail.setIsRead(TrueFalse.FALSE);
		mail.setSendTime(LocalDateTime.now(ZoneId.of("UTC+8")));
		mail.setIsImportant(TrueFalse.FALSE);
		mail.setIsTrash(TrueFalse.FALSE);
		mailDao.save(mail);
		if(saveAsLog.equals("true")){
			LogMail logMail = new LogMail();
			logMail.setSender(userDao.getOne(senderId));
			logMail.setReceiver(userDao.findByAccount(receiverAccount));
			logMail.setTitle(title);
			logMail.setArticle(article);
			logMail.setSendTime(LocalDateTime.now(ZoneId.of("UTC+8")));
			logMail.setIsBackup(TrueFalse.TRUE);
			logMail.setIsTrash(TrueFalse.FALSE);
			logMail.setIsDraft(TrueFalse.FALSE);
			logMailDao.save(logMail);
		}
		
		if(logMailId != 0){
			logMailDao.delete(logMailId);
		}
	}
	
	
	//物品完成交易自動送信給userB
	@Transactional
	public void autoSendMail(int receiverId,int productAId,int productBId){
		Mail mail = new Mail();
		mail.setSender(userDao.getOne(36));
		mail.setReceiver(userDao.getOne(receiverId));
		mail.setTitle("系統:您的物品已被交易!");
		mail.setArticle("您好,親愛的用戶"+userDao.getOne(receiverId).getName()+"您好:<br>您的物品"+productDao.getOne(productBId).getName()
				+"已經與"+productDao.getOne(productAId).getName()+"配對成功,請盡速與交易者取得聯繫完成交易,並給予對方評分唷!=)<br><br><br>E715管理員初號機敬上");
		mail.setIsRead(TrueFalse.FALSE);
		mail.setSendTime(LocalDateTime.now(ZoneId.of("UTC+8")));
		mail.setIsImportant(TrueFalse.FALSE);
		mail.setIsTrash(TrueFalse.FALSE);
		mailDao.save(mail);
	}
	
	
	@Transactional
	public void autoSendMailWhileExchange(int receiverId,int productAId,int productBId){
		Mail mail = new Mail();
		mail.setSender(userDao.getOne(36));
		mail.setReceiver(userDao.getOne(receiverId));
		mail.setTitle("系統:有人想要交換您的物品!");
		mail.setArticle("您好,親愛的用戶"+userDao.getOne(receiverId).getName()+"<br>有人想要使用"+productDao.getOne(productBId).getName()+
				"交換您刊登的"+productDao.getOne(productAId).getName()+",請盡速前往物品頁面察看確認是否想要交換喔!=D<br><br><br>E715管理員初號機敬上");
		mail.setIsRead(TrueFalse.FALSE);
		mail.setSendTime(LocalDateTime.now(ZoneId.of("UTC+8")));
		mail.setIsImportant(TrueFalse.FALSE);
		mail.setIsTrash(TrueFalse.FALSE);
		mailDao.save(mail);
	}
	
}// end of MailService
