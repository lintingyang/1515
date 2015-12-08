package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Messages;
import tw.com.softleader.e5e5.entity.User;

public interface MessagesDao extends JpaRepository<Messages, Integer> {
	
	public List<Messages> findByUser(User user);
	public Messages findById(Integer id);
	
}
