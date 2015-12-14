package tw.com.softleader.e5e5.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.QuestionAndAnswerDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

@Service
public class QuestionAndAnswerService {

	private final QuestionAndAnswerDao questionandanswerDao;
	private final ProductDao productDao;

	@Autowired
	public QuestionAndAnswerService(QuestionAndAnswerDao questionandanswerDao,ProductDao productDao) {
		this.questionandanswerDao = questionandanswerDao;
		this.productDao = productDao;
	}

	@Transactional
	public String[] findQAByProduct(Product product){
		if(product != null){
		List<Object[]> list = questionandanswerDao.findByProduct(product);
		Object[] array = list.get(0);
		String question = (String) array[0];
		String answer = (String) array[1];
		String[] result = {question, answer};
		return result;
		} 
		return null;
		
	}
	
//	public boolean deleteQuestion(int id){
//		
//		return false;
//	}



}
