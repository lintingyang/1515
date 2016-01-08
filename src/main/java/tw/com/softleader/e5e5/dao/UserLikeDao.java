package tw.com.softleader.e5e5.dao;

import java.util.List;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.UserLike;

public interface UserLikeDao extends OurDao<UserLike> {

	public List<UserLike> findByUserId(Integer userId);
	
}
