package tw.com.softleader.e5e5.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.dao.ProductCategoryDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductCategory;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.QuestionAndAnswer;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.User;

@Service
public class ProductCategoryService {
	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	@Transactional
	public List<ProductCategory> getAllProducts() {
		return productCategoryDao.findAll();
	}

}
