package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.UserOwner;

public class UserOwnerDAOHibernate{
	private Session session;
	
	public UserOwnerDAOHibernate(Session session) {
		super();
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	

	public UserOwner selectOne(int uOwnerId){
		
		return (UserOwner) getSession().get(UserOwner.class,uOwnerId );
	}

	public List<UserOwner> selectAll(){
		
		return session.createQuery("from UserOwner").list();
	}
	

	public int update(UserOwner bean){
		UserOwner temp =(UserOwner) getSession().get(UserOwner.class, bean.getuOwnerId());
		if(temp!=null){
			temp.setBoardId(bean.getBoardId());
			temp.setUserId(bean.getUserId());
			return 1;
		}
		return 0;
	}
	

	public int insert (UserOwner bean){
		if(bean!=null){
			int temp = (Integer) getSession().save(bean);
			return temp;
		}
		return 0;
	}
	

	public boolean delete(int uOwnerId){
			UserOwner bean = this.selectOne(uOwnerId);
			if(bean!=null){
				getSession().delete(bean);
				return true;
			}
			
			return false;
		}
	
	
	
	
	
	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			UserOwnerDAOHibernate dao = new UserOwnerDAOHibernate(session);
			UserOwner bean = dao.selectOne(1);
			System.out.println("UserOwner = "+bean);
//			UserBanList bean = new UserBanList();
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	
	
	
	
	
}
