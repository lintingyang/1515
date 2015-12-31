package tw.com.softleader.e5e5.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.User;

public interface UserDao extends OurDao<User> {
	
//	public int insert(Integer id);
//	
//	public int update(User user);
//	
//	public boolean deleteById(Integer id);
	
	
	public User findByAccount(String account);
	
	public User findByAccountContaining(String account);
	
	public User findById(Integer id);
	
	public List<User> findByBirthdayAfter(Date birthday);
	
	public List<User> findByAddressStartingWith(String address);
	
	public User findBySchoolEmail(String schoolEmail);
	
	public List<User> findBySchoolEmailEndingWith(String schoolEmail);
	
	@Query(value="select id , name , game_score from [user] where game_score >=?1 order by game_score desc" , nativeQuery = true)
	public List<Object[]> findRangeScore(Integer gameScore);
	
	public List<User> findByGameScoreGreaterThanEqualOrderByGameScoreDesc(Integer gameScore);
}
