package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.User;

public interface UserDao extends JpaRepository<User, Integer> {
	public List<User> findById(Integer id);
}
