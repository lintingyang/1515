package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.UserOwner;

public interface UserOwnerDao extends JpaRepository<UserOwner, Integer> {
	public UserOwner findById(Integer id);
	
	public List<UserOwner> findByUserId(Integer id);
}
