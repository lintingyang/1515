package tw.com.softleader.e5e5.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ExchangeDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.ReportDao;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.Report;

@Service
public class ReportService {

	@Autowired
	private ReportDao reportDao;

	
	@Transactional
	public List<Report> findAllUnread(){
		return reportDao.findAllUnread();
	}
	
	@Transactional
	public List<Report> findHistory(){
		return reportDao.findAllByOrderByReportTimeDesc();
	}
	
	@Transactional
	public Report findById(int id){
		return reportDao.findOne(id);
	}
	
	@Transactional
	public int updateIsPassed(int id, char status){
		Report temp = reportDao.findOne(id);
		if(temp != null){
			temp.setArticle(temp.getArticle());
			temp.setIsPassed(status);
			temp.setProduct(temp.getProduct());
			temp.setReply(temp.getReply());
			temp.setReportTime(temp.getReportTime());
			temp.setThread(temp.getThread());
			temp.setUser(temp.getUser());
			reportDao.save(temp);
			return 1;
		}
		return 0;	
	}
	


}
