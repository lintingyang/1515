package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.Reply;
import tw.com.softleader.e5e5.entity.Thread;

public interface ReplyDao extends JpaRepository<Reply, Integer> {

	public List<Reply> findByReplyContent(String replyContent);

	public List<Reply> findByTitle(String title);

	@Query(value = "select * from Reply r where created_time is not null order by created_time desc", nativeQuery = true)
	public List<Reply> findAllByCreatedTime();

	public List<Reply> findByThread(Thread thread);

}
