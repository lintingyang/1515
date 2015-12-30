package tw.com.softleader.e5e5.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ReplyDao;
import tw.com.softleader.e5e5.entity.ForumPicture;
import tw.com.softleader.e5e5.entity.Reply;
import tw.com.softleader.e5e5.entity.Thread;

@Service
public class ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	@Transactional
	public int createReply(Set<ForumPicture> forumPictures , tw.com.softleader.e5e5.entity.Thread thread ,String title){
//		Reply reply = new Reply(id, forumPicture, thread, createdDate, 
//				title, replyContent, floor, boards, reports)
		Reply reply = new Reply();
		reply.setThread(thread);
		reply.setTitle(title);
		reply.setCreatedDate(new java.util.Date());
		reply.setFloor(reply.getFloor()+1);
		replyDao.save(reply);
		return 1;
	}
	
	@Transactional
	public List<Reply> getReplyByCreatedTime(){
		return replyDao.findAllByCreatedTime();
	}
	
	@Transactional
	public  List<Reply> getReplyByThread(Thread thread){
		return replyDao.findByThread(thread);
	}
	@Transactional
	public Character hideReply(Reply reply){
		if(reply.getIsHide()=='F'){
			reply.setIsHide('T');
		}
		return 'F';
	}
	
	@Transactional
	public List<Reply> getReplyById() {
		return replyDao.findAll();
	}
}
