package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.ForumPicture;
import tw.com.softleader.e5e5.entity.Reply;

public interface ForumPictureDao extends JpaRepository<ForumPicture, Integer> {

	public List<ForumPicture> findByThread(tw.com.softleader.e5e5.entity.Thread thread);

	public List<ForumPicture> findByReply(Reply reply);

}
