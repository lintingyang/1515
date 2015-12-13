package tw.com.softleader.e5e5.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.dao.TagDao;
import tw.com.softleader.e5e5.dao.ThreadTagDao;
import tw.com.softleader.e5e5.entity.ThreadTag;
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ThreadTagServiceTest {
	
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private ThreadTagDao threadTagDao;
	@Autowired
	private TagDao tagDao;
	@Test
	public void testThreadTagService() {
		ThreadTagService service = new ThreadTagService(threadTagDao,tagDao);
		List<ThreadTag> list = service.findByTagService(3);
		
		log.error("findByTag = 3");
		for(ThreadTag bean :list){
			log.error("thread = "+bean.getThread().getId());
			log.error("ThreadTagId = "+bean.getId());
		}
	
	}

}
