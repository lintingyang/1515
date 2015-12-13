package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Messages;

public interface MessagesDao extends JpaRepository<Messages, Integer> {
	
	@Query(value="select * from Messages where sender_id = ?1", nativeQuery = true)
	public List<Messages> findBySenderId(Integer id);
	
}
