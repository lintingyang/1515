package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.UserLikeDao;
import tw.com.softleader.e5e5.entity.UserLike;

@Service
public class UserLikeService extends OurService<UserLike>{
	@Autowired
	private UserLikeDao userLikeDao;
	
	public List<UserLike> findUserLike(Integer userId){
		List<UserLike> result = null;
		result = userLikeDao.findByUserId(userId);
		return result;
	}
	
	@Override
	public OurDao<UserLike> getDao() {
		// TODO Auto-generated method stub
		return userLikeDao;
	}

	@Override
	protected List<Message> validateInsert(UserLike entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(UserLike entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
