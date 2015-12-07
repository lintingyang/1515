package tw.com.softleader.e5e5.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Exchange;
import tw.com.softleader.e5e5.entity.Product;

public interface ExchangeDao extends JpaRepository<Exchange, Integer> {
	
	public List<Exchange> findByProductByProductAId (Product productAId);

}
