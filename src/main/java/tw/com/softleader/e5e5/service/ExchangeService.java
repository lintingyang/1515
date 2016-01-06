package tw.com.softleader.e5e5.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ExchangeDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;

@Service
public class ExchangeService {

	@Autowired
	private ExchangeDao exchangeDao;
	@Autowired
	private ProductDao productDao;

	@Transactional
	public Product findMostPopularProduct(){
		int result = exchangeDao.findTopOrderByCount();
		Product product = productDao.findOne(result);
		return product;
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
	public List<Exchange> findByProduct(Product product){
		List<Exchange> list = exchangeDao.findByProductAId(product);
		return list;
	}


}
