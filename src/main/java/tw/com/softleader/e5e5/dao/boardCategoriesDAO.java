package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.boardCategories;
	
public class boardCategoriesDAO {
	private Session session = null;
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			//select1
			boardCategoriesDAO dao = new boardCategoriesDAO(session);
//			boardCategories bean = dao.select(1);
//			System.out.println(bean);
			
			//selectall
//			List<boardCategories> beans = dao.select();
//			System.out.println(beans);
			
			//update
//			int result = dao.update("站務管理", new java.util.Date(), 1);
//			System.out.println(result);
			
			//insert(?)
//			boardCategories bean = new boardCategories();
//			bean.setDateCreated(new java.util.Date());
//			bean.setName("test2");
//			int result = dao.insert(bean);
//			System.out.println(result);
			
			
			//delete
			boolean delete=dao.delete(7);
			System.out.println(delete);
			
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	public boardCategoriesDAO(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}

	public boardCategories select(int categoryId) {
		return (boardCategories) this.getSession().get(boardCategories.class, categoryId);
	}

	public List<boardCategories> select() {
		return this.getSession().createQuery("from boardCategories").list();
	}

	public int insert(boardCategories bean) {
//		boardCategories temp = (boardCategories) this.getSession().get(boardCategories.class, bean.getCategoryId());
		if (bean != null) {
			this.getSession().save(bean);
			return 1;
		}
		return -1;
	}

	public int update( String name, java.util.Date dateCreated,int CategoryId) {
		boardCategories result = (boardCategories) this.getSession().get(boardCategories.class, CategoryId);
		if(result == null){
			result.setName(name);
			result.setDateCreated(dateCreated);
			return 1;
		}
		return -1;
	}
	public boolean delete(int CategoryId){
		boardCategories bean = (boardCategories) this.getSession().get(boardCategories.class, CategoryId);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
