package tw.com.softleader.e5e5.dao;

import java.util.List;

import tw.com.softleader.e5e5.entity.Product;

public interface ProductDAO {
	public int insert(Product productbean);
	public int update(Product productbean);
	public boolean delete(int productId);
	public Product select(int productId);
	public List<Product> select();
}
