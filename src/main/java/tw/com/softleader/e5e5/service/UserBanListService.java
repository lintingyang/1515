package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.UserBanListDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;

@Service
public class UserBanListService {
	
	private UserBanListDao ublDao;
	private UserDao userDao;
	
	@Autowired
	public UserBanListService(UserBanListDao ublDao, UserDao userDao){
	this.ublDao = ublDao;
	this.userDao = userDao;
	}
	
	@Transactional
	public List<UserBanList> findOneUser(int id){
		if(userDao.findById(id)!=null){
		List<UserBanList> result = ublDao.findByUserAId(id);
		return result;
		}
		return null;
	}
	
	@Transactional
	public int insert (int userAId , int userBId){
		List<UserBanList> ubss = ublDao.findByUserAId(userAId);
		boolean temp = false;
		for(UserBanList ubs : ubss){
			if((int)ubs.getUserByUserBId().getId() != userBId ){
				temp=true;
			}
		}
	
	if(!temp){
		UserBanList ub = new UserBanList();
		ub.setUserByUserAId(new User(userAId));
		ub.setUserByUserBId(new User(userBId));
		ublDao.save(ub);
		return 1;	
	}
		return 0;
	}
	
	@Transactional
	public boolean deletOne(int userAId , int userBId){
		UserBanList ub2 =ublDao.findByOnly(userAId, userBId);
		if(ub2!=null){
			ublDao.delete(ub2.getId());
			return true;
		}
		
		return false;
	}
	

}
