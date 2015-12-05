package tw.com.softleader.e5e5.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.User;

public interface UserDao extends JpaRepository<User, Integer> {
	public User findById(Integer id);
	
	public User findByAddressStartingWith(String address);
	
	public User findByCellphone(String cellphone);
}
