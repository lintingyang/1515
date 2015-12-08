package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

public interface QuestionAndAnswerDao extends JpaRepository<QuestionAndAnswer, Integer> {
	
	public List<QuestionAndAnswer> findByProduct (Product product);
	
}
