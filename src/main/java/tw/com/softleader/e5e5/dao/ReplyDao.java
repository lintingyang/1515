package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.Reply;

public interface ReplyDao extends JpaRepository<Reply, Integer> {

	public List<Reply> findByReplyContent(String replyContent);

}
