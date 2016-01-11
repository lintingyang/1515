
package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.UserLike;

public interface UserLikeDao extends OurDao<UserLike> {
	
	@Query(value ="select * from user_like where user_id = ?1" , nativeQuery = true)
	public List<UserLike> findByUserId(Integer userId);
	

	@Query(value ="delete from user_like where user_id = ?1" , nativeQuery = true)
	public void deleteByUserId(Integer userId);
	

//	@Query(value ="insert into user_like([product_category_id], [user_id]) VALUES ( ?1 , ?2 )" , nativeQuery = true)
//	public UserLike insert(Integer productCategoryId ,Integer userId);
}


