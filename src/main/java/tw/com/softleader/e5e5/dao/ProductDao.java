package tw.com.softleader.e5e5.dao;

import java.util.Date;
import java.util.List;

import tw.com.softleader.e5e5.entity.Product;

public interface ProductDao {
	public int insert(Product productbean);
	public int update(Product productbean);
//	public int update(String productName, String category, Integer pictureId, byte[] video, int userId, Date postTime,
//			Date deadline, String location, String tradeWay, String wishItem, boolean postStatus, boolean tradeStatus,
//			Integer clickTimes, Integer exchangeId, Integer itemId, Integer itemOwnerId, Date tradeFinishedTime,
//			String grade, Date gradeTime, int productId);
	public boolean delete(int productId);
	public Product select(int productId);
	public List<Product> select();
}
