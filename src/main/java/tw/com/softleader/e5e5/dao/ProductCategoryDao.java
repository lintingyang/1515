package tw.com.softleader.e5e5.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.ProductCategory;

public interface ProductCategoryDao extends JpaRepository<ProductCategory, Integer>{
	
}
