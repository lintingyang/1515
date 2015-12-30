package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.AdminDao;
import tw.com.softleader.e5e5.entity.Admin;

@Service
@Transactional
public class AdminService {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private AdminDao adminDao;

	@Transactional
	public Admin findById(Integer id) {
		return adminDao.findOne(id);
	}

	@Transactional
	public int deleteById(Integer id) {
		Admin admin = adminDao.findOne(id);
		if (admin != null) {
			adminDao.delete(admin);
			return 1;
		}
		return 0;
	}

	@Transactional
	public Admin findByAccount(String account) {
		Admin admin = adminDao.findByAccount(account);
		if (admin != null) {
			return admin;
		} else {
			return null;
		}
	}

	@Transactional
	public List<Admin> findAllAdmins() {
		return adminDao.findAll();
	}

	@Transactional
	public int updateAuthority(String account, String authority) {
		Admin admin = adminDao.findByAccount(account);
		if (admin != null) {
			admin.setAuthority(authority);
			adminDao.save(admin);
			return 1;
		}
		return 0;
	}

	@Transactional
	public int updateAdmin(String account, String authority, String name, String password, String email) {
		Admin admin = adminDao.findByAccount(account);
		if (admin != null) {
			admin.setAuthority(authority);
			admin.setName(name);
			admin.setEmail(email);
			admin.setPassword(password);
			adminDao.save(admin);
			return 1;
		} else {
			return 0;
		}
	}

	@Transactional
	public int addNewAdmin(String account, String authority, String name, String password, String email) {
		Admin checkAdmin = adminDao.findByAccount(account);
		if (checkAdmin == null) { // 檢查是否有相同帳號，如果有則回傳0
			Admin admin = new Admin();
			admin.setAccount(account);
			admin.setAuthority(authority);
			admin.setName(name);
			admin.setPassword(password);
			admin.setEmail(email);
			adminDao.save(admin);
			return 1; // 新增成功則回傳1
		} else {
			return 0;
		}
	}

	@Transactional
	public int deleteByAccount(String account) {
		Admin admin = adminDao.findByAccount(account);

		if (admin == null) { // 判斷是否有此帳號，如果沒有則回傳0
			return 0;
		} else {
			adminDao.delete(admin); // 有則刪除此帳號資料回傳1
			return 1;
		}

	}
	public Admin login(String account ,String password){
		Admin admin = adminDao.findByAccount(account);
		if(admin != null){
			if(password.equals(admin.getPassword()) ){
				log.error("登入成功！");
				return admin;
			}else{
				log.error(admin.getAccount());
				log.error("密碼錯誤");
			}
		}
		log.error("admin === null");
		return null;
		
	}
	

}
