package tw.com.softleader.e5e5.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.UserBanList;

public interface UserBanListDao extends JpaRepository<UserBanList, Integer> {
	
	//public List<UserBanList> findByuserByUserAId()
	
}
