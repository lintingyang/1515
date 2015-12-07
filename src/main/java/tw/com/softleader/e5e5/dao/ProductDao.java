package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.e5e5.entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {
	public List<Product> findByName(String name);
}
