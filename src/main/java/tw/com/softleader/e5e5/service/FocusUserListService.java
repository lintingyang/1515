package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.FocusUserListDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.FocusUserList;
import tw.com.softleader.e5e5.entity.User;

@Service
public class FocusUserListService {
	
	private FocusUserListDao fulDao;
	private UserDao uDao;
	
	@Autowired
	public FocusUserListService(FocusUserListDao fulDao , UserDao uDao){
		this.fulDao = fulDao;
		this.uDao = uDao;
	}
	
	@Transactional
	public List<FocusUserList> findOneUser(int id){
		if(uDao.findById(id)!=null){
		List<FocusUserList> result = fulDao.findByOneUser(id);
		return result;
		}
		return null;
	}
	
	@Transactional
	public int insert (int userAId , int userBId){
		List<FocusUserList> fuls = fulDao.findByOneUser(userAId);
		boolean temp = false;
		for(FocusUserList ful : fuls){
			if((int)ful.getUserByUserBId().getId()!= userBId ){
				temp=true;
			}
		}
		
		if(!temp){
			FocusUserList fulNew = new FocusUserList();
			fulNew.setUserByUserAId(new User(userAId));
			fulNew.setUserByUserBId(new User(userBId));
			fulDao.save(fulNew);
			return 1;	
				}
			return 0;
		}
			
	@Transactional
	public boolean deletOne(int userAId , int userBId){
		FocusUserList ful2 = fulDao.findByOnly(userAId, userBId);
		if(ful2!=null){
			fulDao.delete(ful2.getId());
			return true;
		}
		return false;
	}
		
	
}
