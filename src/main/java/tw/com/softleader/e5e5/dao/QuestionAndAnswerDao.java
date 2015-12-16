package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

public interface QuestionAndAnswerDao extends JpaRepository<QuestionAndAnswer, Integer> {
	
	@Query(value="select question, answer FROM question_and_answer qa WHERE product_id = ?1", nativeQuery=true)
	public List<Object[]> findByProduct (Product product);
	
}
