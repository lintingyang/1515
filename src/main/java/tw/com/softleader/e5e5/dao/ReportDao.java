package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.Report;

public interface ReportDao extends OurDao<Report>{

	@Query(value="SELECT * FROM report WHERE is_passed is null ORDER BY report_time DESC", nativeQuery = true)
	public List<Report> findAllUnread();
	
	@Query(value="SELECT r.* FROM report r JOIN product p ON r.product_id = p.id WHERE p.name like %?1% ORDER BY r.report_time DESC", nativeQuery = true)
	public List<Report> findAllByName(String name);
}
