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
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

public class QuestionAndAnswerDaoTest extends AbstractTest{

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private QuestionAndAnswerDao qandaDao;


//	@Test
//	public void testInsert(){
//		QuestionAndAnswer qaa = new QuestionAndAnswer();
//		Product product = productDao.findOne(3);
//		qaa.setProduct(product);
//		qaa.setQuestion("test question");
//		qaa.setAnswer("test answer");
//		qaa.setEditTime(new java.util.Date());
//		qaa.setIsPublic('T');
//		qandaDao.save(qaa);
//	}
	

//	@Test
//	public void testFindAll(){
//		List<QuestionAndAnswer> qandas = qandaDao.findAll();
//		for(QuestionAndAnswer qa:qandas){
//			log.info(qa);
//		}
//	}
	
//	@Test
//	public void testUpdate(){
//		QuestionAndAnswer q1 = qandaDao.findOne(4);
//		q1.setAnswer("test update");
//		q1.setQuestion("test update");
//		qandaDao.save(q1);
//	}
	
//	@Test
//	public void testDelete(){
//		qandaDao.delete(3);
//	}
	
	@Test
	public void test(){
		long count = qandaDao.count();
		log.info(count);
		
		List<QuestionAndAnswer> list = qandaDao.findByProductId(2);
		log.info(list);
		
	
	}

}
