package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Report;

public interface ReportDao extends JpaRepository<Report, Integer> {

	@Query(value="SELECT * FROM report WHERE is_passed is null ORDER BY report_time DESC", nativeQuery = true)
	public List<Report> findAllUnread();
	
	//尚未處理之物品
	@Query(value="SELECT * FROM report WHERE is_passed is null and product_id is not null ORDER BY report_time", nativeQuery = true)
	public List<Report> findAllProductUnread();

	public List<Report> findAllByOrderByReportTimeDesc();
	
}
