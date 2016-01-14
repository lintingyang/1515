package tw.com.softleader.e5e5.dao;

import java.util.List;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

public interface LogMailDao extends OurDao<LogMail> {

//全部列出，依寄信時間由晚到早排列
public List<LogMail> findAllByOrderBySendTimeDesc();

//列出草稿
public List<LogMail> findByIsDraftOrderBySendTimeDesc(TrueFalse isDraft);

//列出寄件備份
public List<LogMail> findByIsBackupOrderBySendTimeDesc(TrueFalse isBackup);

//列出垃圾信件
public List<LogMail> findByIsTrashOrderBySendTimeDesc(TrueFalse isTrash);
	
}
