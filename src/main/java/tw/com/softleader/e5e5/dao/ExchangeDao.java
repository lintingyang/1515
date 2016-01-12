package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;

public interface ExchangeDao extends JpaRepository<Exchange, Integer> {
	
	public List<Exchange> findByProductAId (Product productAId);
	
	public List<Exchange> findByProductBId (Product productBId);
	
	//find the most popular item(productA)
	@Query(value="SELECT TOP 1 productA_id FROM exchange GROUP BY productA_id ORDER BY COUNT (*) DESC", nativeQuery = true)
	public int findTopOrderByCount();
	
	@Query(value="select * from exchange where producta_id = ?1 AND productb_id = ?2", nativeQuery = true)
	public List<Exchange> findByProductAANDProductB(Product productAId,Product productBId);
	
}
