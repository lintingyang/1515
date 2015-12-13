package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {
	public List<Product> findByName(String name);
	
	//find most clicked product
	@Query(value="SELECT TOP 1 name FROM product ORDER BY click_times DESC", nativeQuery=true)
	public String findByTopClickedProduct();
	
	//find user who posted products most
	@Query(value="SELECT TOP 1 user_id FROM product GROUP BY user_id ORDER BY COUNT (*) DESC", nativeQuery=true)
	public int findByUserCounts();
}
