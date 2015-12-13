package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Tag;
import tw.com.softleader.e5e5.entity.ThreadTag;

public interface ThreadTagDao extends JpaRepository<ThreadTag, Integer> {

	@Query(value="select top 5 tag_id account from thread_tag group by tag_id order by count(tag_id) desc",nativeQuery=true)
	public List<Integer> findByTopUsedTag();
	

	public List<ThreadTag> findByTag(Tag tag);
	
	
}
