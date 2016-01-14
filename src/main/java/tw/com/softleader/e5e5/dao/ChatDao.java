package tw.com.softleader.e5e5.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.Chat;

public interface ChatDao extends OurDao<Chat> {

//	@Autowired
//	private Chat chat;
	
	//find last 3 chat message by post time
//	@Query(value ="select top 3 * from Chat c where send_time is not null order by send_time desc", nativeQuery = true)
	@Query(value ="select top 300 * from Chat c where send_time is not null order by send_time desc", nativeQuery = true)
	public List<Chat> findAllOrderBySendTime();

}
