package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Messages;

public interface MessagesDao extends JpaRepository<Messages, Integer> {
	
	@Query(value="select * from Messages where sender_id = ?1 order by deliver_time Desc", nativeQuery = true)
	public List<Messages> findBySenderId(Integer id);
	
	@Query(value="select * from Messages where sender_id = ?1 and receiver_id = ?2 order by deliver_time Desc", nativeQuery = true)
	public List<Messages> findByOther(Integer senderId,Integer receiverId);
	
}
