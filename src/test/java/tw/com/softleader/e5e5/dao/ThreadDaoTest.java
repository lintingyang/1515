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

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ThreadDaoTest {

	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ThreadDao threadDao;
	@Autowired
	private BoardDao boardDao;

	
	@Test
	public void testCrud() {
		Thread thread = new Thread();
		Board board = boardDao.findOne(7);

		thread.setTitle("徵家教");
		thread.setCreatedDate(new java.sql.Date(0));
		thread.setThreadContent("教高一英文");
		thread.setBoard(board);

		threadDao.save(thread);
		
		Thread  dbEntity = threadDao.findOne(4);
		log.debug(dbEntity);
		
		List<Thread> threads = threadDao.findByTitle("xyz");
		
		for(Thread b:threads) {
			log.debug(b);
		}
	}

}
