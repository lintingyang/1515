package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;

public interface QuestionAndAnswerDao extends OurDao<QuestionAndAnswer> {
	
	@Query(value="select * FROM question_and_answer qa WHERE product_id = ?1 ORDER BY question_time DESC", nativeQuery=true)
	public List<QuestionAndAnswer> findByProductId (Integer id);
	
}
