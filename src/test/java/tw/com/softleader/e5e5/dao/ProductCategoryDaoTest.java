package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;
import tw.com.softleader.e5e5.common.AbstractTest;
import tw.com.softleader.e5e5.entity.ProductCategory;

@Log4j
public class ProductCategoryDaoTest extends AbstractTest{

	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	@Test
	public void testCrud() {
		List<ProductCategory> categorys = productCategoryDao.findAll();
		
		assertEquals(0, categorys.size());
		
		ProductCategory newCategory = new ProductCategory();
		newCategory.setName("3C");
		newCategory = productCategoryDao.save(newCategory); 
		
		categorys = productCategoryDao.findAll();
		assertEquals(1, categorys.size());
		
		ProductCategory oneCategory = productCategoryDao.findOne(newCategory.getId());
		oneCategory.setName("家電");
		newCategory = productCategoryDao.save(oneCategory);
		
		ProductCategory updateCategory = productCategoryDao.findOne(newCategory.getId());
		assertEquals("家電", updateCategory.getName());
		
		productCategoryDao.delete(oneCategory.getId());
		
		categorys = productCategoryDao.findAll();
		assertEquals(0, categorys.size());
		
	}

}
