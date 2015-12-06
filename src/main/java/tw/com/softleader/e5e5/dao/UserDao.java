package tw.com.softleader.e5e5.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.User;

public interface UserDao extends JpaRepository<User, Integer> {
	
//	public int insert(Integer id);
//	
//	public int update(User user);
//	
//	public boolean deleteById(Integer id);
	
	public User findById(Integer id);
	
	public List<User> findByBirthdayAfter(Date birthday);
	
	public List<User> findByAddressStartingWith(String address);
	
	public List<User> findBySchoolEmailEndingWith(String cellphone);
	
	public List<User> findByGameScoreGreaterThanEqualOrderByGameScoreDesc(Integer gameScore);

}
