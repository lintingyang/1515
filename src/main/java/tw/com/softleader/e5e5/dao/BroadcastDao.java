package tw.com.softleader.e5e5.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import tw.com.softleader.e5e5.entity.Broadcast;

public interface BroadcastDao extends JpaRepository<Broadcast, Integer> {

	
	public List<Broadcast> findByBroadcastDescription(String name);
}
