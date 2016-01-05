package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.*;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Log4j
public class ReprotDaoTest extends AbstractTest  {
	
	@Autowired
	private ReportDao reportDao;
	
	@Test
	public void testCrud(){
		
		List<Report> entities = reportDao.findAll();
		
		assertEquals(3, entities.size());
		
		Report newReport = new Report();
		newReport.setArticle("try try see");
		newReport.setReportTime(LocalDateTime.now());
		newReport = reportDao.save(newReport);

		entities = reportDao.findAll();
		assertEquals(4, entities.size());
		
		Report oneReport = reportDao.findOne(newReport.getId());
		oneReport.setArticle("++++++++++++++");
		oneReport = reportDao.save(oneReport);

		Report updateReport = reportDao.findOne(newReport.getId());
		assertEquals("++++++++++++++", updateReport.getArticle());
		
		reportDao.delete(oneReport.getId());
		
		entities = reportDao.findAll();
		assertEquals(3, entities.size());
		
	}
}
