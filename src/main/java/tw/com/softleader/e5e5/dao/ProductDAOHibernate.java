package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.dao.ProductDAO;
import tw.com.softleader.e5e5.entity.Product;

public class ProductDAOHibernate implements ProductDAO {
	private Session session;
	public ProductDAOHibernate(Session session){
		super();
		this.session = session;
	}
	public Session getSession(){
		return session;
	}
	
	@Override
	public int insert(Product productbean) {
		Product p = (Product) getSession().get(Product.class, productbean.getProductId());
		if(p == null){
			getSession().save(productbean);
			return 1;
		}
		return 0;
	}

	@Override
	public int update(Product productbean) {
		Product p = (Product) getSession().get(Product.class, productbean.getProductId());
		if(p != null){
			p.setProductName(productbean.getProductName());
			p.setCategory(productbean.getCategory());
			p.setPictureId(productbean.getPictureId());
			p.setVideo(productbean.getVideo());
			p.setUserId(productbean.getUserId());
			p.setPostTime(productbean.getPostTime());
			p.setDeadline(productbean.getDeadline());
			p.setLocation(productbean.getLocation());
			p.setTradeWay(productbean.getTradeWay());
			p.setWishItem(productbean.getWishItem());
			p.setPostStatus(productbean.getPostStatus());
			p.setTradeStatus(productbean.getTradeStatus());
			p.setClickTimes(productbean.getClickTimes());
			p.setExchangeId(productbean.getExchangeId());
			p.setItemId(productbean.getItemId());
			p.setItemOwnerId(productbean.getItemOwnerId());
			p.setTradeFinishedTime(productbean.getTradeFinishedTime());
			p.setGrade(productbean.getGrade());
			p.setGradeTime(productbean.getGradeTime());
			return 1;
		}
		return 0;
	}

	@Override
	public boolean delete(int productId) {
		Product p = (Product) getSession().get(Product.class, productId);
		if(p !=null) {
			getSession().delete(p);
			return true;
		}
		return false;
	}

	@Override
	public Product select(int productId) {
		return (Product) getSession().get(Product.class, productId);
	}

	@Override
	public List<Product> select() {
		return (List<Product>) getSession().createQuery("from Product").list();
	}
	
	public static void main(String[] args){
		try{
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			ProductDAO dao = new ProductDAOHibernate(session);
			//insert
//			Product in  = new Product();
//			in.setCategory("BBBB");
//			in.setProductName("AAAAA");
//			in.setUserId(1);
//			int insert = dao.insert(in);
//			System.out.println(insert);
			
			//update
//			Product up  = new Product();
//			up.setProductId(12);
//			up.setCategory("uuuuuuuuu");
//			up.setUserId(3);
//			up.setProductName("uuuuuuuuuu");
//			int update = dao.update(up);
//			System.out.println(update);
			
			//delete
//			boolean delete = dao.delete(12);
//			System.out.println(delete);
			
			//select
			Product sel = dao.select(1);
			System.out.println(sel);
			
			//selectList
			List<Product> list = dao.select();
			System.out.println(list);
			
			session.getTransaction().commit();
		}finally{
			HibernateUtil.closeSessionFactory();
		}
	}
}
