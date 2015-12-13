package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.SchoolDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Chat;

@Service
public class SchoolService {

	private SchoolDao schoolDao;
	private UserDao userDao;

	@Autowired
	public SchoolService(SchoolDao schoolDao,UserDao userDao) {
		this.schoolDao = schoolDao;
		this.userDao = userDao;
	}

	@Transactional
	public boolean checkStatus(int id) {
		Character c =Character.toLowerCase(schoolDao.findCheckEmailbyId(id));
		if(c.equals('t')){			
			return true;
		}else{
			return false;
		}

	}




}
