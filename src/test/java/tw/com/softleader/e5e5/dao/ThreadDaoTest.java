package tw.com.softleader.e5e5.dao;



import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.Thread;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ThreadDaoTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ThreadDao threadDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private UserDao userDao;
	
	@Test
	public void testCrud() {
		//create
//		Thread thread = new Thread();
//		Board board = boardDao.findOne(4);
//		User user = userDao.findOne(1);
//		thread.setTitle("徵家教600");
//		thread.setCreatedDate(new java.util.Date());
//		thread.setThreadContent("教高一英文");
//		thread.setBoard(board);
//		thread.setIsReadonly('F');
//		thread.setTopped('F');
//		thread.setUser(user);
//
//		threadDao.save(thread);
		
		
		Thread  dbEntity = threadDao.findOne(6);
		log.debug(dbEntity);
		
//		threadDao.delete(5);
		
/*		List<Thread> threads = threadDao.findByTitle("徵家教");		
		for(Thread b:threads) {
			log.debug(b);
		}*/
	
	}
}
