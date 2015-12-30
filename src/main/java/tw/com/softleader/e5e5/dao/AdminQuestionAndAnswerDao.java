package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.AdminQuestionAndAnswer;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.User;

public interface AdminQuestionAndAnswerDao extends JpaRepository<AdminQuestionAndAnswer, Integer> {
	
	public List<AdminQuestionAndAnswer> findByAdmin(Admin admin);
	public List<AdminQuestionAndAnswer> findByUser(User user);
	
	@Query(value="SELECT * FROM admin_question_and_answer WHERE answer is null ORDER BY created_date DESC", nativeQuery = true)
	public List<AdminQuestionAndAnswer> findAllUnAnswer();
	
	@Query(value="SELECT * FROM admin_question_and_answer WHERE answer is not null ORDER BY created_date DESC", nativeQuery = true)
	public List<AdminQuestionAndAnswer> findAllAnswered();
}	
