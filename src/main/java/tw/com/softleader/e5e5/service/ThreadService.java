package tw.com.softleader.e5e5.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ThreadDao;
import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.ForumPicture;
import tw.com.softleader.e5e5.entity.Thread;
import tw.com.softleader.e5e5.entity.ThreadTag;
import tw.com.softleader.e5e5.entity.User;

@Service
public class ThreadService {

	@Autowired
	private ThreadDao threadDao;
	
	@Transactional
	public int createThread(Board board , User user , String title , String threadContent , Set<ThreadTag> threadTags ,Set<ForumPicture> forumPictures){
		Thread thread = new Thread();
		thread.setBoard(board);
		thread.setUser(user);
		thread.setTitle(title);
		thread.setCreatedDate(new java.util.Date());
		thread.setThreadContent(threadContent);
		thread.setHit(0);
		thread.setIsCream('F');
		thread.setReplyCount(0);
		thread.setIsReadonly('F');
		thread.setTopped('F');
		thread.setForumPictures(forumPictures);
		thread.setThreadTags(threadTags);		
		threadDao.save(thread);
		return 1;
	}
	
	@Transactional
	public List<Thread> getThreadByCreatedTime(){
		return threadDao.findAllByCreatedTime();
	}
	@Transactional
	public Thread getThreadById(Integer id){
		return threadDao.findOne(id);
	}
	
	@Transactional
	public List<Thread> getThreadById(){
		return threadDao.findAll();
	}
	@Transactional
	public Thread updateHit(Thread thread ,Integer hit){
		Thread th = threadDao.findOne(thread.getId());
		th.setHit(hit);
		return th;
	}

	public List<Thread> getThreadByBoard(Board board) {
		return threadDao.findByBoard(board);
	}
}
