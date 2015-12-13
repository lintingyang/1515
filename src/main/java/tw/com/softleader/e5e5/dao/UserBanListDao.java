package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.UserBanList;

public interface UserBanListDao extends JpaRepository<UserBanList, Integer> {
	
	@Query(value ="select user_a_id from user_ban_list where user_a_id = ?1", nativeQuery = true)
	public List<UserBanList> findByUserAId(Integer userAId);
	
}

