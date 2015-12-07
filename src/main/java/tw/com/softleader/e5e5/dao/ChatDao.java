package tw.com.softleader.e5e5.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Chat;

public interface ChatDao extends JpaRepository<Chat, Integer> {

	

}
