package tw.com.softleader.e5e5.service;


import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ExchangeDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.enums.Grade;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class ExchangeService {

	@Autowired
	private ExchangeDao exchangeDao;
	@Autowired
	private ProductDao productDao;
	
	@Transactional
	public void addexchange(int productAId,int productBId){
		Exchange exchange = new Exchange();
		Product prodcutA = productDao.findOne(productAId);
		Product productB = productDao.findOne(productBId);
		exchange.setProductAId(prodcutA);
		exchange.setProductBId(productB);
		exchange.setTradeStatus(TrueFalse.FALSE);
		exchange.setExchangeTime(LocalDateTime.now());
		exchangeDao.save(exchange);
	}

	@Transactional
	public Product findMostPopularProduct(){
		int result = exchangeDao.findTopOrderByCount();
		Product product = productDao.findOne(result);
		return product;
	}
	
	@Transactional
	public Exchange findOne(int id){
		return exchangeDao.findOne(id);
	}
	
	
	//交易完成
	@Transactional
	public Exchange finishTrade(int id){
		Exchange ex = exchangeDao.findOne(id);
		ex.setTradeFinishedTime(LocalDateTime.now());
		ex.setTradeStatus(TrueFalse.TRUE);
		ex = exchangeDao.save(ex);
		
		//物品刊登狀態改為FALSE、交易狀態狀態改為TRUE
		Product a = ex.getProductAId();
		a.setPostStatus(TrueFalse.FALSE);
		a.setTradeStatus(TrueFalse.TRUE);
		a = productDao.save(a);
		Product b =ex.getProductBId();
		b.setPostStatus(TrueFalse.FALSE);
		b.setTradeStatus(TrueFalse.TRUE);
		b = productDao.save(b);
		
		return ex ;
	}
	
	
	//評比
	@Transactional
	public int gradeProductX(Product productX, Grade grade){
		if(productX != null){
			productX.setGrade(grade);
			System.out.println("--------------------------"+grade);
			productX.setGradeTime(LocalDateTime.now());
			productX = productDao.save(productX);
			return 1;
		}else{
			return 0;
		}
	}

	
	@Transactional
	public List<Exchange> findAll(){
		List<Exchange> list = exchangeDao.findAll();
		return list;
	}
	
	@Transactional
	public List<Exchange> findByProductAId(int productAId){
		Product product = productDao.findOne(productAId);
		List<Exchange> list = exchangeDao.findByProductAId(product);
		return list;
	}
	
	@Transactional
	public List<Exchange> findByProductBId(int productBId){
		Product product = productDao.findOne(productBId);
		List<Exchange> list = exchangeDao.findByProductBId(product);
		return list;
	}
	
	@Transactional
	public List<Exchange> findByProduct(Product product){
		List<Exchange> list = exchangeDao.findByProductAId(product);
		return list;
	}


}
