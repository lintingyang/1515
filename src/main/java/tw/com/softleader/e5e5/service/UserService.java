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
	
	@Transactional
	public List<User> findAll(){
		List<User> allUser = uDao.findAll();
		return allUser;
	}
	
	
	@Transactional
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
						user.setIsolated('F');
						uDao.save(user);
						return 1;
					}
				}
			}
		
		
		return 0;
	}
	
	@Transactional
	public int drewScores (String account , Integer score){
		User temp = uDao.findByAccount(account);
		if (temp!=null){
			User temp3 = new User();
			temp3.setId(temp.getId());
			temp3.setAccount(temp.getAccount());
			temp3.setAddress(temp.getAddress());
			temp3.setAge(temp.getAge());
			temp3.setBirthday(temp.getBirthday());
			temp3.setCellphone(temp.getCellphone());
			temp3.setEmail(temp.getEmail());
			temp3.setEmailCheck(temp.getEmailCheck());
			temp3.setFocusItemList(temp.getFocusItemList());
			temp3.setName(temp.getName());
			temp3.setNickname(temp.getNickname());
			temp3.setOnlineDatetime(temp.getOnlineDatetime());
			temp3.setPassword(temp.getPassword());
			temp3.setPhone(temp.getPhone());
			temp3.setPicture(temp.getPicture());
			temp3.setSchoolEmail(temp.getSchoolEmail());
			temp3.setSchoolName(temp.getSchoolName());
			temp3.setSex(temp.getSex());
			temp3.setIsolated(temp.getIsolated());
			temp3.setGameScore(score);
			uDao.save(temp3);
			return 1;
		}		
		return 0 ;
		
	} 
	
	@Transactional
	public int updataIsolated (String account ,Character isolated ){
		User temp = uDao.findByAccount(account);
		if (temp!=null){
			User temp2 = new User();
			temp2.setId(temp.getId());
			temp2.setAccount(temp.getAccount());
			temp2.setAddress(temp.getAddress());
			temp2.setAge(temp.getAge());
			temp2.setBirthday(temp.getBirthday());
			temp2.setCellphone(temp.getCellphone());
			temp2.setEmail(temp.getEmail());
			temp2.setEmailCheck(temp.getEmailCheck());
			temp2.setFocusItemList(temp.getFocusItemList());
			temp2.setGameScore(temp.getGameScore());
			temp2.setName(temp.getName());
			temp2.setNickname(temp.getNickname());
			temp2.setOnlineDatetime(temp.getOnlineDatetime());
			temp2.setPassword(temp.getPassword());
			temp2.setPhone(temp.getPhone());
			temp2.setPicture(temp.getPicture());
			temp2.setSchoolEmail(temp.getSchoolEmail());
			temp2.setSchoolName(temp.getSchoolName());
			temp2.setSex(temp.getSex());
			temp2.setIsolated(isolated);
			uDao.save(temp2);
			return 1;
		}		
		return 0 ;
	}
	
	
	
	
}
