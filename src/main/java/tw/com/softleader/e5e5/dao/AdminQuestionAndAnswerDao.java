package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Admin;
import tw.com.softleader.e5e5.entity.AdminQuestionAndAnswer;

public interface AdminQuestionAndAnswerDao extends JpaRepository<AdminQuestionAndAnswer, Integer> {
	
	public List<AdminQuestionAndAnswer> findByAdmin(Admin admin);
	
}	
