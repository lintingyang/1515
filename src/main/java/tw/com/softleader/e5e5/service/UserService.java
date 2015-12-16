package tw.com.softleader.e5e5.service;



import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao uDao;
	
	@Transactional
	public User findByAccount(String account){
		User user = uDao.findByAccount(account);
		return user;
	}
	
	public String[] findRangeScore(Integer score){
		
		List<User> temp = uDao.findByGameScoreGreaterThanEqualOrderByGameScoreDesc(score);
		String[] result = null;
		int i =0;
		for(User user : temp){
			result[i] = user.getAccount();
			i++;
		}	
		return result;
	}
	
	@Transactional
	public int insert(String password, String name, String nickname, String account, Integer age, Character sex,
			Date birthday, String address, String phone, String cellphone, String email, String picture,
			String schoolEmail , Integer onlineDatetime,String schoolName,Character emailCheck){
			Character temp1 = 'T';
			if(uDao.findBySchoolEmail(schoolEmail) == null){
				if(temp1.equals(emailCheck)){
					if(account !=null && password!=null && account.length() >= 5 && uDao.findByAccount(account)==null
					 && password.length() >= 8 && (cellphone!=null || phone!=null)){
						User user = new User();
						user.setName(name);
						user.setAccount(account);
						user.setPassword(password);
						user.setNickname(nickname);
						user.setAge(age);
						user.setSex(sex);
						user.setBirthday(birthday);
						user.setAddress(address);
						user.setPhone(phone);
						user.setCellphone(cellphone);
						user.setEmail(email);
						user.setPicture(picture);
						user.setSchoolEmail(schoolEmail);
						user.setOnlineDatetime(onlineDatetime);
						user.setSchoolName(schoolName);
						user.setEmailCheck(emailCheck);
						uDao.save(user);
						return 1;
					}
				}
			}
		
		
		return 0;
	}
	
	
	
	
}
