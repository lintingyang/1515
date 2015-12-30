package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.AdminDao;
import tw.com.softleader.e5e5.dao.AdminQuestionAndAnswerDao;
import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.AdminQuestionAndAnswer;

@Service
@Transactional
public class AdminQuestionAndAnswerService {
	@Autowired
	private AdminQuestionAndAnswerDao adminqaDao;
	@Autowired
	private AdminDao adminDao;
	
	public List<AdminQuestionAndAnswer> findAll(){
		return adminqaDao.findAll();	
	}
	
	public List<AdminQuestionAndAnswer>  findByAdmin(String account){
		Admin result = adminDao.findByAccount(account);
		return adminqaDao.findByAdmin(result);
	}
	public List<AdminQuestionAndAnswer> findAllUnAnswer(){
		return adminqaDao.findAllUnAnswer();
	}
	
	public List<AdminQuestionAndAnswer> findAllAnswered(){
		return adminqaDao.findAllAnswered();
	}
}
