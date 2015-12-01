package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.UserBanList;

public class UserBanListDAOHibernate{
	private Session session;
	
	public UserBanListDAOHibernate(Session session) {
		super();
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	
	
	
	
	public UserBanList selectOne(int bUserID){
		
		return (UserBanList) getSession().get(UserBanList.class,bUserID );
	}
	
	public List<UserBanList> selectAll(){
		
		return session.createQuery("from UserBanList").list();
	}
	
	
	public int update(UserBanList bean){
		UserBanList temp =(UserBanList) getSession().get(UserBanList.class, bean.getbUserID());
		if(temp!=null){
			temp.setBuserA(bean.getBuserA());
			temp.setBuserB(bean.getBuserB());
			return 1;
		}
		return 0;
	}
	
	
	public int insert (UserBanList bean){
		if(bean!=null){
			int temp = (Integer) getSession().save(bean);
			return temp;
		}
		return 0;
	}
	
	
	
	public boolean delete(int bUserID){
			UserBanList bean = this.selectOne(bUserID);
			if(bean!=null){
				getSession().delete(bean);
				return true;
			}
			
			return false;
		}
	
	
	
	
	
//	public static void main(String[] args) {
//		try {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			session.beginTransaction();
//			
//			UserBanListDAOHibernate dao = new UserBanListDAOHibernate(session);
//			//insert
//			UserBanList bean = new UserBanList();
//			bean.setBuserA(5);
//			bean.setBuserB(2);
//			int temp2 = dao.insert(bean);
//			System.out.println(temp2);
//			
//			
//			//update
////			UserBanList bean = new UserBanList();
////			bean.setbUserID(1);
////			bean.setBuserA(1);
////			int temp = dao.update(bean);
////			System.out.println("更改"+temp+"筆資料");
//			
//			
//			//select
////			UserBanList bean = dao.selectOne(1);
////			System.out.println(bean);
////			UserBanList bean = new UserBanList();
//			
//			
//			
//			
//			session.getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
	
	
	
	
	
	
}
