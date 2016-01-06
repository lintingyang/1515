package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.FocusUserListDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.FocusUserList;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.UserBanList;

@Service
public class FocusUserListService  extends OurService<FocusUserList>{
	
	@Autowired
	private FocusUserListDao focusUserListDao;
	@Autowired
	private UserDao userDao;
	

	
	@Transactional
	public List<FocusUserList> findOneUser(int id){
		if(userDao.findById(id)!=null){
		List<FocusUserList> result = focusUserListDao.findByOneUser(id);
		return result;
		}
		return null;
	}
	
	@Transactional
	public int insert (int userAId , int userBId){
		List<FocusUserList> fuls = focusUserListDao.findByOneUser(userAId);
		boolean temp = false;
		for(FocusUserList ful : fuls){
			if((int)ful.getUserBId().getId()!= userBId ){
				temp=true;
			}
		}
		
		if(!temp){
			FocusUserList fulNew = new FocusUserList();
			fulNew.setUserAId(new User(userAId));
			fulNew.setUserBId(new User(userBId));
			focusUserListDao.save(fulNew);
			return 1;	
				}
			return 0;
		}
			
	@Transactional
	public boolean deletOne(int userAId , int userBId){
		FocusUserList ful2 = focusUserListDao.findByOnly(userAId, userBId);
		if(ful2!=null){
			focusUserListDao.delete(ful2.getId());
			return true;
		}
		return false;
	}

	@Override
	public OurDao<FocusUserList> getDao() {
		return focusUserListDao;
	}

	@Override
	protected List<Message> validateInsert(FocusUserList entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(FocusUserList entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
		
	
}
