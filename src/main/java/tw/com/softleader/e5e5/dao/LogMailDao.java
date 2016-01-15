package tw.com.softleader.e5e5.dao;

import java.util.List;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

public interface LogMailDao extends OurDao<LogMail> {

//全部列出，依寄信時間由晚到早排列
public List<LogMail> findBySenderOrderBySendTimeDesc(User sender);

//列出草稿
public List<LogMail> findBySenderAndIsDraftOrderByDraftTimeDesc(User sender,TrueFalse isDraft);

//列出寄件備份
public List<LogMail> findBySenderAndIsBackupOrderBySendTimeDesc(User sender,TrueFalse isBackup);

//列出垃圾信件
public List<LogMail> findBySenderAndIsTrashOrderBySendTimeDesc(User sender,TrueFalse isTrash);
	
}
