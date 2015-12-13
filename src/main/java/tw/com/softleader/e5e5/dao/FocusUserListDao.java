package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.FocusUserList;

public interface FocusUserListDao extends JpaRepository<FocusUserList, Integer> {

	@Query(value ="select user_a_id,user_b_id from focus_user_list where user_a_id = ?1", nativeQuery = true)
	public List<Object[]> findByUserAId(Integer userAId);
	
}
