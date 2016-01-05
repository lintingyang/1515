package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.BroadcastDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Broadcast;
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class BroadcastServiceTest {

	private Logger log = Logger.getLogger(this.getClass());
	@Autowired
	BroadcastService bs;

	@Test
	public void testGetLastTenBroadcasts() {
		List<Broadcast> broadcasts =bs.getLastTenBroadcasts();
		for(Broadcast b:broadcasts){
			log.debug(b);
		}
	}

	@Test
	public void testPostBroadcast() {
		bs.postBroadcast(1, "測試是也");
	}

}
