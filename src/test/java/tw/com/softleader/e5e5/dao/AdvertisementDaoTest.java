package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.entity.Advertisement;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes={E5e5App.class})
public class AdvertisementDaoTest {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdvertisementDao advertisementDao;
	
	@Test
	public void testFindAll() {
		List<Advertisement> list = advertisementDao.findAll();
		for( Advertisement advertisement:list){
			log.error(advertisement);
		}
	}

}
