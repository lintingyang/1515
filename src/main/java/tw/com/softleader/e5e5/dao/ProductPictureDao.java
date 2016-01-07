package tw.com.softleader.e5e5.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductPicture;

public interface ProductPictureDao extends OurDao<ProductPicture> {
	
	public List<ProductPicture> findByProduct(Product product);
	
}
