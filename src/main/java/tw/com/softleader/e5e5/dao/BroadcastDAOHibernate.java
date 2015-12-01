package tw.com.softleader.e5e5.dao;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.Broadcast;

public class BroadcastDAOHibernate{
	private Session session;
	public BroadcastDAOHibernate(Session session) {
		super();
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			BroadcastDAOHibernate dao = new BroadcastDAOHibernate(session);
//			Broadcast bean = new Broadcast();
			Broadcast bean = dao.selectById(1);
			System.out.println(bean);
//			List<Broadcast> beans= dao.selectAll();
//			System.out.println(beans);
			
//			bean.setBroadcastDescription("這是測試二號");
//			bean.setPostTime(new Date());
//			bean.setUserId(7);
//			bean.setBroadcastId(6);
//			
//			System.out.println(dao.insert(bean));
//			System.out.println(dao.update(bean));
//			System.out.println("Delete Result: "+dao.delete(7));
			

			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	public Broadcast selectById(int broadcastId) {
		Broadcast bean = null;
		try {
			bean = (Broadcast) getSession().get(Broadcast.class, broadcastId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	public List<Broadcast> selectAll() {
		List<Broadcast> beans=null;
		try {
			beans = (List<Broadcast>)getSession().createQuery("from Broadcast").list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return beans;
		}

	}
	public int insert(Broadcast bean){
		Broadcast temp=(Broadcast) getSession().get(Broadcast.class, bean.getBroadcastId());
		if(temp==null){
			getSession().save(bean);
			return 1;
		}		
		return 0;
	}
	public int update(Broadcast bean){
		Broadcast temp=(Broadcast) getSession().get(Broadcast.class, bean.getBroadcastId());
		if(temp!=null){
			temp.setBroadcastDescription(bean.getBroadcastDescription());
			temp.setBroadcastId(bean.getBroadcastId());
			temp.setPicture(bean.getPicture());
			temp.setPostTime(bean.getPostTime());
			temp.setUserId(bean.getUserId());
			return 1;
		}		
		return 0;
	}
	public boolean delete(int broadcastId){
		Broadcast temp=(Broadcast) getSession().get(Broadcast.class, broadcastId);
		if(temp!=null){
			getSession().delete(temp);
			return true;
		}		
		return false;
	}

}
