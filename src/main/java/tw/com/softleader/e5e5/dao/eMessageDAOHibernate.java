package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.eMessage;

public class eMessageDAOHibernate{
	private Session session;
	
	public eMessageDAOHibernate(Session session) {
		super();
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	
	

	public eMessage selectOne(int msgId){
		
		return (eMessage) getSession().get(eMessage.class,msgId );
	}
	

	public List<eMessage> selectAll(){
		
		return session.createQuery("from eMessage").list();
	}
	
	

	public int update(eMessage bean){
		eMessage temp =(eMessage) getSession().get(eMessage.class, bean.getMsgId());
		if(temp!=null){
			temp.setMsgTime(bean.getMsgTime());
			temp.setUserId(bean.getUserId());
			temp.setMsgDeliverTime(bean.getMsgDeliverTime());
			temp.setMsgReceiverId(bean.getMsgReceiverId());
			temp.setMsgSenderID(bean.getMsgSenderID());
			temp.setMsgArticle(bean.getMsgArticle());
			temp.setMsgReadTime(bean.getMsgReadTime());
			return 1;
		}
		return 0;
	}
	

	public int insert (eMessage bean){
		if(bean!=null){
			int temp = (Integer) getSession().save(bean);
			return temp;
		}
		return 0;
	}
	
	
	

	public boolean delete(int msgId){
			eMessage bean = this.selectOne(msgId);
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
//			eMessageDAOHibernate dao = new eMessageDAOHibernate(session);
//			eMessage bean = dao.selectOne(1);
//			System.out.println(bean);
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
//	
	
	
	
	
	
}
