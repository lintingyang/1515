package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Thread;

public interface ThreadDao extends JpaRepository<Thread, Integer> {

	public List<Thread> findByTitle(String title);

	@Query(value = "select * from Thread t where created_date is not null order by created_date desc", nativeQuery = true)
	public List<Thread> findAllByCreatedTime();

	@Query(value = "select * from Thread t where hit is not null order by hit desc", nativeQuery = true)
	public List<Thread> findAllByHit();

	
//	@Modifying
//	@Query("update Thread t set t.hit = ?1 where t.id = ?2")
//	public Thread updateHit(Integer hit , Integer threadId);

}
