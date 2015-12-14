package tw.com.softleader.e5e5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.AdminDao;
import tw.com.softleader.e5e5.entity.Admin;

@Service
public class AdminService {
	private AdminDao adminDao;
	
	@Autowired
	public AdminService (AdminDao adminDao){
		this.adminDao = adminDao;
	}
	
	@Transactional
	public List<Admin> findAllAdmins(){
		return adminDao.findAll();
	}
	@Transactional
	public int addNewAdmin(String authority,String name,String password,String email){
		Admin admin = new Admin();
		admin.setAuthority(authority);
		admin.setName(name);
		admin.setPassword(password);
		admin.setEmail(email);
		adminDao.save(admin);
		return 0;
	}
	@Transactional
	public int deleteByAccount(String account){
		Admin admin = adminDao.findByAccount(account);
		adminDao.delete(admin);
		return 0;
	}
	
	
}
