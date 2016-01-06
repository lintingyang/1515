package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.FocusUserList;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;

public interface FocusUserListDao extends OurDao<FocusUserList> {

	@Query(value ="select user_a_id,user_b_id from focus_user_list where user_a_id = ?1", nativeQuery = true)
	public List<Object[]> findByUserAId(Integer userAId);
	
	
	@Query(value ="select * from focus_user_list where user_a_id = ?1", nativeQuery = true)
	public List<FocusUserList> findByOneUser(Integer userAId);
	
	@Query(value ="select * from focus_user_list where user_a_id = ?1 and user_b_id = ?2", nativeQuery = true)
	public FocusUserList findByOnly(Integer userAId ,Integer userBId);
	
	
}
