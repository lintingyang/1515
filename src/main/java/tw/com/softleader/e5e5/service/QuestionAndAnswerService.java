package tw.com.softleader.e5e5.service;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.QuestionAndAnswerDao;
import tw.com.softleader.e5e5.entity.Product;

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
	public List<String> findQAByProduct(Product product){
		List<String> result = new ArrayList<String>();
		if(product != null){
		List<Object[]> list = questionandanswerDao.findByProduct(product);
		for(int i=0; i<list.size(); i++){
			Object[] row = list.get(i);
			result.add(Arrays.toString(row));
		}
		return result;
		} 
		return null;
		
	}
	
//	public boolean deleteQuestion(int id){
//		
//		return false;
//	}



}
