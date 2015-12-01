package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.BoardCategory;
	
public class BoardCategoryDAO {
	private Session session = null;
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			//select1
			BoardCategoryDAO dao = new BoardCategoryDAO(session);
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

	public BoardCategoryDAO(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}

	public BoardCategory select(int categoryId) {
		return (BoardCategory) this.getSession().get(BoardCategory.class, categoryId);
	}

	public List<BoardCategory> select() {
		return this.getSession().createQuery("from boardCategories").list();
	}

	public int insert(BoardCategory bean) {
//		boardCategories temp = (boardCategories) this.getSession().get(boardCategories.class, bean.getCategoryId());
		if (bean != null) {
			this.getSession().save(bean);
			return 1;
		}
		return -1;
	}

	public int update( String name, java.util.Date dateCreated,int CategoryId) {
		BoardCategory result = (BoardCategory) this.getSession().get(BoardCategory.class, CategoryId);
		if(result == null){
			result.setName(name);
			result.setDateCreated(dateCreated);
			return 1;
		}
		return -1;
	}
	public boolean delete(int CategoryId){
		BoardCategory bean = (BoardCategory) this.getSession().get(BoardCategory.class, CategoryId);
		if(bean != null){
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
