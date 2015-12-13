package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.jboss.logging.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.ThreadTag;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class ThreadTagDaoTest {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private ThreadTagDao threadTagDao;
	@Autowired
	private TagDao tagDao;
	@Autowired
	private ThreadDao threadDao;
	
	@Test
	public void testCrud() {
		
//		
//		ThreadTag threadTag = new ThreadTag();
//		threadTag.setTag(tagDao.findOne(5));
//		threadTag.setThread(threadDao.findOne(6));
//		threadTagDao.save(threadTag);
//		threadTagDao.delete(4);
//		List<ThreadTag> list = threadTagDao.findAll();
//		for(ThreadTag obj:list){
//			log.error(obj);
//		}
//		
		
		
		List<ThreadTag> list = threadTagDao.findByTag(tagDao.findOne(3));
		
		for(ThreadTag a :list){
			log.error(a);
		}
		
		
		List<Integer> a = threadTagDao.findByTopUsedTag();
		for(Integer i:a){
			log.error(i);
		}
	}

}
