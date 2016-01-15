package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.assertEquals;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.e5e5.E5e5App;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

public class LogMailDaoTest extends AbstractTest{

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private LogMailDao logMailDao;
	
	@Test
	public void testFindAll(){

	
//		List<Mail> list = mailDao.findAllByOrderBySendTimeDesc();
//		log.info(list);
//		
//		List<LogMail> list = logMailDao.findByIsDraftOrderBySendTimeDesc(TrueFalse.TRUE);
//		log.info("****"+list);
		
	}

}
