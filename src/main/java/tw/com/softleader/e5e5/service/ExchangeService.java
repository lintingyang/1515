package tw.com.softleader.e5e5.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.softleader.e5e5.dao.ExchangeDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.entity.Product;

@Service
public class ExchangeService {

	private final ExchangeDao exchangeDao;
	private final ProductDao productDao;

	@Autowired
	public ExchangeService(ExchangeDao exchangeDao,ProductDao productDao) {
		this.exchangeDao = exchangeDao;
		this.productDao = productDao;
	}

	@Transactional
	public Product findMostPopularProduct(){
		int result = exchangeDao.findTopOrderByCount();
		Product product = productDao.findOne(result);
		return product;
	}



}
