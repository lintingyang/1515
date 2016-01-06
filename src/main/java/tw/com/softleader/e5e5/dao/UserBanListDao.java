package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.UserBanList;

public interface UserBanListDao extends OurDao<UserBanList> {
	
	@Query(value ="select * from user_ban_list where user_a_id = ?1", nativeQuery = true)
	public List<UserBanList> findByUserAId(Integer userAId);
	
	@Query(value ="select * from user_ban_list where user_a_id = ?1 and user_b_id = ?2", nativeQuery = true)
	public UserBanList findByOnly(Integer userAId ,Integer userBId);
}

