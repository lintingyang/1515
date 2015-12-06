package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.Thread;

public interface ThreadDao extends JpaRepository<Thread, Integer> {

	List<Thread> findByTitle(String title);

}
