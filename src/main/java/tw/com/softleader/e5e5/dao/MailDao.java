package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

public interface MailDao extends OurDao<Mail> {

//全部列出，依寄信時間由晚到早排列
public List<Mail> findAllByOrderBySendTimeDesc();

//列出重要信件
public List<Mail> findByIsImportantOrderBySendTimeDesc(TrueFalse isImportant);

//列出垃圾信件
public List<Mail> findByIsTrashOrderBySendTimeDesc(TrueFalse isTrash);
	
}
