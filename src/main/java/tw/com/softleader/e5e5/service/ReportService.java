package tw.com.softleader.e5e5.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ExchangeDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.ReportDao;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class ReportService extends OurService<Report>{

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
	public int updateIsPassed(int id, TrueFalse status){
		Report temp = reportDao.findOne(id);
		if(temp != null){
			temp.setArticle(temp.getArticle());
//			temp.setIsPassed(status);
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
	
	//修改status pass
	@Transactional
	public int updateIsPassedPass(int id){
		Report temp = reportDao.findOne(id);
		if(temp != null){
//			temp.setIsPassed(TrueFalse.TRUE);
			reportDao.save(temp);
			return 1;
		}
		return 0;	
	}
	
	//修改status not pass
		@Transactional
		public int updateIsPassedNotPass(int id){
			Report temp = reportDao.findOne(id);
			if(temp != null){
//				temp.setIsPassed(TrueFalse.FALSE);
				reportDao.save(temp);
				return 1;
			}
			return 0;	
		}
		
	//尚未處理之物品
	@Transactional
	public List<Report> findAllProductUnread(){
		return reportDao.findAllProductUnread();
	}

	@Override
	public OurDao<Report> getDao() {
		// TODO Auto-generated method stub
		return reportDao;
	}

	@Override
	protected List<Message> validateInsert(Report entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(Report entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
