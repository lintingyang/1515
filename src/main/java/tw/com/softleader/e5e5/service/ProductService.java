package tw.com.softleader.e5e5.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.User;

@Service
public class ProductService {
	private final ProductDao productDao;
	private final UserDao userDao;
	
	@Autowired
	public ProductService(ProductDao productDao, UserDao userDao){
		this.productDao = productDao;
		this.userDao = userDao;
	}
	
	@Transactional
	public List<Product> getTopclickedProducts(){
		String hotProducts = productDao.findByTopClickedProduct();
		return productDao.findByName(hotProducts);
	}
	
	@Transactional
	public int findPostedMostUser(){
		return productDao.findByUserCounts();
	}
	
//	@Transactional
//	public User findPostedMostUser(){
//		int id = productDao.findByUserCounts();
//		User u = userDao.findById(id);
//		return u;
//	}

}
