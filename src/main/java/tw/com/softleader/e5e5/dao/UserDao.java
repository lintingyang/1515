package tw.com.softleader.e5e5.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

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
	
	@Query(value="select id , name , game_score from [user] where game_score >=?1 order by game_score desc" , nativeQuery = true)
	public List<Object[]> findByGameScoreGreaterThanEqualOrderByGameScoreDesc(Integer gameScore);

}
