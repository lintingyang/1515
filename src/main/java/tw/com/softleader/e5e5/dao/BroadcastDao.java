package tw.com.softleader.e5e5.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Broadcast;

public interface BroadcastDao extends JpaRepository<Broadcast, Integer> {

	
	public List<Broadcast> findByBroadcastDescription(String name);
	//find last 10 chat message by post time
	@Query(value ="select top 10 * from broadcast where post_time is not null order by post_time desc", nativeQuery = true)
	public List<Broadcast> findAllOrderByPostTime();
}
