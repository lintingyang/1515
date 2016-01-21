package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.QuestionAndAnswerDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

@Service
public class QuestionAndAnswerService extends OurService<QuestionAndAnswer> {

	@Autowired
	public QuestionAndAnswerDao questionandanswerDao;
	@Autowired
	public ProductDao productDao;

	public List<QuestionAndAnswer> findByProductId(int id) {
		if(productDao.findOne(id) != null){
			return questionandanswerDao.findByProductId(id);
		}
		return null;
	}
	
	public int countByProduct(int id){
		if(productDao.findOne(id) != null){
			int count = questionandanswerDao.findByProductId(id).size();
		return count;
		}
		return 0;
	}
	
	@Transactional
	public int updateAnswer(String answer, int id){
		QuestionAndAnswer theQuestion = questionandanswerDao.findOne(id);
		if (theQuestion != null){
		theQuestion.setAnswer(answer);
		theQuestion.setAnswerTime(LocalDateTime.now(ZoneId.of("UTC+8")));
		questionandanswerDao.save(theQuestion);
		return 1;
		}
		return 0;
	}

	@Override
	public OurDao<QuestionAndAnswer> getDao() {
		return questionandanswerDao;
	}

	@Override
	protected List<Message> validateInsert(QuestionAndAnswer entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(QuestionAndAnswer entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
