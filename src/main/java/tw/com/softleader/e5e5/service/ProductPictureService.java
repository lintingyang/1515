package tw.com.softleader.e5e5.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ProductCategoryDao;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.ProductPictureDao;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductPicture;
import tw.com.softleader.e5e5.entity.enums.Time;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class ProductPictureService extends OurService<ProductPicture>{
	@Autowired
	private ProductPictureDao productPictureDao;
	
	@Transactional
	public List<ProductPicture> getProductPictures(Product product) {
		List<ProductPicture> productPictures = productPictureDao.findByProduct(product);
		return productPictures;
	}

	@Override
	public OurDao<ProductPicture> getDao() {
		// TODO Auto-generated method stub
		return productPictureDao;
	}

	@Override
	protected List<Message> validateInsert(ProductPicture entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(ProductPicture entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}

	
