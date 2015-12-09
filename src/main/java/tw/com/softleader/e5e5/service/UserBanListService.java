package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.UserBanListDao;
import tw.com.softleader.e5e5.dao.UserDao;
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
	
	

}
