package tw.com.softleader.e5e5.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.School;

public interface SchoolDao extends JpaRepository<School, Integer> {

	@Query(value ="select check_mail from school where id = ?1", nativeQuery = true)
	public char findCheckEmailbyId(int id);

}
