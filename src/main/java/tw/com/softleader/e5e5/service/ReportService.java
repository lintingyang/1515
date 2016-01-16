package tw.com.softleader.e5e5.service;


import java.time.LocalDateTime;
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
	public List<Report> findAll(){
		return reportDao.findAll();
	}
	
	@Transactional
	public List<Report> findAllByName(String name){
		return reportDao.findAllByName(name);
	}
	
	@Transactional
	public List<Report> findAllUnread(){
		return reportDao.findAllUnread();
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
			temp.setProduct(temp.getProduct());
			temp.setReportTime(temp.getReportTime());
			temp.setReporterId(temp.getReporterId());
//			temp.setIsPassed(status);
//			temp.setReply(temp.getReply());
//			temp.setThread(temp.getThread());
			reportDao.save(temp);
			return 1;
		}
		return 0;	
	}
	
	//修改status pass
	@Transactional
	public Report updateIsPassedPass(int id){
		Report temp = reportDao.findOne(id);
		if(temp != null){
			temp.setIsPassed(TrueFalse.TRUE);
			temp.setFinishTime(LocalDateTime.now());
			temp = reportDao.save(temp);
			return temp;	
		}
		return reportDao.findOne(id);	
	}
	
	//修改status not pass
		@Transactional
		public Report updateIsPassedNotPass(int id){
			Report temp = reportDao.findOne(id);
			if(temp != null){
				temp.setIsPassed(TrueFalse.FALSE);
				temp.setFinishTime(LocalDateTime.now());
				temp = reportDao.save(temp);
				return temp;
			}
			return reportDao.findOne(id);	
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
