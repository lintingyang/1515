package tw.com.softleader.e5e5.dao;


import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.BoardCategory;
import tw.com.softleader.e5e5.entity.Broadcast;
import tw.com.softleader.e5e5.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class BroadcastDaoTest {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BroadcastDao broadcastDao;
	@Autowired
	private UserDao userDao;

	@Test
	public void testCrud() {
		Broadcast broadcast = new Broadcast();
		User userone = userDao.findOne(1);
		log.debug(userone);
		

		broadcast.setBroadcastDescription("桌子?");
		broadcast.setPostTime(new Date());
		broadcast.setUser(userone);
		log.debug(broadcastDao.save(broadcast));
		
		
		List<Broadcast> broadcasts = broadcastDao.findByBroadcastDescription("桌子桌子");
		
		for(Broadcast b:broadcasts) {
			log.debug("test fidospahfodsaf: "+b);
		}
	}



}
