package tw.com.softleader.e5e5.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Chat;

public interface ChatDao extends JpaRepository<Chat, Integer> {

	//find last 3 chat message by post time
	@Query(value ="select top 3 * from Chat c where send_time is not null order by send_time desc", nativeQuery = true)
	public List<Chat> findAllOrderBySendTime();

}
