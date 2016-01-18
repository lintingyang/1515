package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

public interface ProductDao extends OurDao<Product> {

	//後台
	//(1)findOne byId
	//(2)findAll
	//(3)update product's post_status
	
	
	
	//(1)最新商品列：fineAll byPostTime
	@Query(value ="SELECT * FROM product WHERE post_time IS NOT NULL AND post_status = 'TRUE' ORDER BY post_time DESC", nativeQuery = true)
	public List<Product> findAllByPostTime();
	
	//(2)點擊次數排序商品列：findAll byClickTimes
	@Query(value ="SELECT * FROM product WHERE click_times IS NOT NULL AND post_status = 'TRUE' ORDER BY click_times DESC", nativeQuery = true)
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
	
//	//(8)查詢商品是否交易成功：findOne byTradeStatus 
//	@Query(value ="SELECT trade_status FROM product WHERE name = ?1", nativeQuery = true)
//	public String findOneByTradeStatus(String name);
	
	//(10)關鍵字搜尋:產品名稱、交換地、使用者名稱、產品類別
	@Query(value ="SELECT p.* FROM product p JOIN product_category pc ON p.category_id = pc.id JOIN [user] u ON p.user_id = u.id WHERE pc.name LIKE %?1% OR p.name LIKE %?1% OR p.location LIKE %?1% OR u.name LIKE %?1%", nativeQuery = true)
	public List<Product> findAllByKeywords(String keywords);

	//(11)查詢使用者已/未刊登的物品/Enum/yao
	@Query(value = "SELECT p.* FROM product p WHERE p.user_id = ?1 AND p.post_status = ?2 order by post_time", nativeQuery = true)
	public List<Product> findUsersProductsByIsPosted(Integer id , TrueFalse postStatus);
	
	//(11)查詢使用者已/未刊登的物品/String/yao
	@Query(value = "SELECT p.* FROM product p WHERE p.user_id = ?1 AND p.post_status = ?2 AND trade_status = 'FALSE' order by post_time DESC", nativeQuery = true)
	public List<Product> findUsersProductsByIsPosted(Integer id , String post);

	@Query(value = "SELECT p.* FROM product p WHERE  p.user_id = ?1 AND p.trade_status='FALSE' " , nativeQuery = true)
	public List<Product> findByUserId(Integer id);
	
	//(12)查詢我想跟別人交換與已跟別人刊登的交換排序未解決/String/yao
	@Query(value = "SELECT distinct p.* FROM product p JOIN exchange e ON e.productA_id = p.id WHERE p.post_status = ?3 AND productA_id IN (SELECT productA_id FROM exchange WHERE productB_id in (SELECT productB_id FROM exchange e Join product p ON e.productB_id = p.id WHERE p.[user_id] = ?1 AND e.trade_status = ?2))", nativeQuery = true)
	public List<Product> findUsersProductsByExchange(Integer userId, String tradeStatus, String postStatus);
		
	//(13)查詢自己刊登的已交換/String/yao
	@Query(value = "SELECT p.* FROM exchange e JOIN product p ON e.productA_id = p .id WHERE e.trade_status = 'TRUE' AND p.post_status = 'FALSE' and p.[user_id] = ?1 ORDER BY e.trade_finished_time DESC" , nativeQuery = true)
	public List<Product> findUserPostedProductsByExchanged(Integer userId);
	
	@Query(value = "SELECT p.* FROM product p JOIN product_category pc ON p.category_id = pc.id WHERE p.name LIKE %?1% AND pc.name = ?2  AND p.post_status = 'TRUE' AND p.trade_status='FALSE' order by click_times DESC", nativeQuery = true)
	public List<Product> findByProdcutOrderByClickTimes(String productName,String categoryName );

	@Query(value = "SELECT p.* FROM product p JOIN product_category pc ON p.category_id = pc.id WHERE p.name  LIKE %?1% AND pc.name = ?2 AND p.post_status = 'TRUE'AND p.trade_status='FALSE' order by post_time DESC", nativeQuery = true)
	public List<Product> findByProductOrderByPostTime(String productName,String categoryName );
	
	//查詢名稱並按照最高點擊率排序
	@Query(value ="SELECT * FROM product WHERE name LIKE %?1% AND post_status = 'TRUE' AND trade_status='FALSE' order by click_times DESC", nativeQuery = true)
	public List<Product> findAllByNameOrderbyByClickTimes(String name);
	
	//查詢名稱並按照最新發文排序
	@Query(value ="SELECT * FROM product WHERE name LIKE %?1% AND post_status = 'TRUE' AND trade_status='FALSE' order by post_time DESC", nativeQuery = true)
	public List<Product> findAllByNameOrderbyByPostTime(String name);
	//查詢名稱並且物品狀態為未被交換  by shuang
	@Query(value = "SELECT p.* FROM product p WHERE p.user_id = ?1 AND p.trade_status='FALSE'", nativeQuery = true)
	public List<Product> findByUserIdAndStatue(Integer id);
	
	//查詢別人想跟我交換的物品總數/yao
	@Query(value = "SELECT count (productb_id) FROM exchange WHERE producta_id = ?1", nativeQuery = true)
	public int findCountByProductBId(Integer id);
	
	//查詢exchange
	@Query(value = "SELECT DISTINCT e.id FROM exchange e JOIN product p ON e.productA_id = p .id OR e.productB_id = p.id WHERE e.trade_status = 'TRUE' AND (productA_id = ?1 OR productB_id = ?1)", nativeQuery = true)
	public int findExchangeIdByProductId(Integer productId);

	//查詢別人向我提出的Q&A/yao
	@Query(value = "SELECT count (product_id) FROM question_and_answer WHERE product_id = ?1 and answer is null", nativeQuery = true)
	public int findCountByProductAQA(Integer id);
	
	//查詢我向別人提出的Q&A回覆數/yao
	@Query(value = "SELECT count (product_id) FROM question_and_answer WHERE product_id = ?1 and questioner_id = ?2 and answer is not null", nativeQuery = true)
	public int findCountByQuestionerQA(Integer productId ,Integer userId);
	
	//查詢我向別人提出的Q&A物品/yao
	@Query(value = "SELECT DISTINCT p.* FROM product p JOIN question_and_answer q ON p.id = q.product_id WHERE questioner_id = ?1 and answer is not null", nativeQuery = true)
	public List<Product> findProductByQuestionerQA(Integer userId);
}
