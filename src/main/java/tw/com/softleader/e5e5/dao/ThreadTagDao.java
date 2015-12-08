package tw.com.softleader.e5e5.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.ThreadTag;

public interface ThreadTagDao extends JpaRepository<ThreadTag, Integer> {
	
}
