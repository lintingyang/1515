package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {


	//(1)最新商品列：fineAll byPostTime
	@Query(value ="SELECT * FROM product WHERE post_time IS NOT NULL ORDER BY post_time DESC", nativeQuery = true)
	public List<Product> findAllByPostTime();
	
	//(2)點擊次數排序商品列：findAll byClickTimes
	@Query(value ="SELECT * FROM product WHERE click_times IS NOT NULL ORDER BY click_times DESC", nativeQuery = true)
	public List<Product> findAllByClickTimes();
	
	//(3)依商品名稱搜尋：findAll byName 
	@Query(value ="SELECT * FROM product WHERE name LIKE %?1%", nativeQuery = true)
	public List<Product> findAllByName(String name);
	
	//(4)依商品交換地搜尋：findAll byLocation 
	@Query(value ="SELECT * FROM product WHERE location LIKE %?1%", nativeQuery = true)
	public List<Product> findAllByLocation(String location);

	//(5)依會員名稱搜尋：findAll byUserName 
	@Query(value ="SELECT p.* FROM product p JOIN [user] u ON p.user_id = u.id WHERE u.name LIKE %?1%", nativeQuery = true)
	public List<Product> findAllByUserName(String userName);
	
	//(6)依會員學校搜尋：findAll byUserSchoolName 
	@Query(value ="SELECT p.* FROM product p JOIN [user] u ON p.user_id = u.id WHERE u.school_name LIKE %?1%", nativeQuery = true)
	public List<Product> findAllByUserSchoolName(String userSchoolName);
	
	//(7)依商品種類搜尋：findAll byProductCategory 
	@Query(value ="SELECT p.* FROM product p JOIN product_category pc ON p.category_id = pc.id WHERE pc.name LIKE %?1%", nativeQuery = true)
	public List<Product> findAllByProductCategory(String productCategory);
	
	//(8)查詢商品是否交易成功：findOne byTradeStatus 
	@Query(value ="SELECT trade_status FROM product WHERE name = ?1", nativeQuery = true)
	public String findOneByTradeStatus(String name);
	

	
	
	
//	//find most clicked product
//	@Query(value="SELECT TOP 1 name FROM product ORDER BY click_times DESC", nativeQuery=true)
//	public String findByTopClickedProduct();
//	
//	//find user who posted products most
//	@Query(value="SELECT TOP 1 user_id FROM product GROUP BY user_id ORDER BY COUNT (*) DESC", nativeQuery=true)
//	public int findByUserCounts();
}
