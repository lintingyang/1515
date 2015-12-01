package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.Exchange;

public class ExchangeDAOHibernate {

	private Session session;
	public ExchangeDAOHibernate(Session session) {
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	
//	public static void main(String[] args){
//		try {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			session.beginTransaction();
//			
//			ExchangeDAOHibernate dao = new ExchangeDAOHibernate(session);
//			ExchangeBean bean = dao.select(1);
//			System.out.println(" ****this is select = "+bean);
//			
//			List<ProductBean> list = dao.select();
//			System.out.println("*****this is select all =" + list);
			
//			Exchange bean = new Exchange();
//			bean.setExchangeId(1);
//			bean.setExgTime(new java.util.Date());
//			bean.setProductAId(2);
//			bean.setProductBId(6);
//			int i = dao.insert(bean);
//			System.out.println("*****this is insert"+ i);
//			
//			int update = dao.update(bean);
//			System.out.println("*****this is insert"+update);
//			
//			boolean delete = dao.delete(60);
//			System.out.println("*********this is delete = " + delete);
			
//			session.getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//		
//	}//end of main
	
	public Exchange select(int exchangeId) {
		return (Exchange) getSession().get(Exchange.class, exchangeId);
	}

	public List<Exchange> select() {
		List<Exchange> list = getSession().createQuery("from Exchange").list();
		return list;
	}

	public int insert(Exchange bean) {
		if(bean != null){
			int pk = (Integer) getSession().save(bean);
			return pk;
		}
		return 0;
	}

	public int update(Exchange bean) {
		Exchange sel = (Exchange) getSession().load(Exchange.class, bean.getExchangeId());
		if (sel != null){
			sel.setExgTime(bean.getExgTime());
			sel.setProductAId(bean.getProductAId());
			sel.setProductBId(bean.getProductBId());
			return 1;
		}
		return 0;
	}

	public boolean delete(int exchangeId) {
		Exchange bean = (Exchange) getSession().load(Exchange.class, exchangeId);
		if(bean != null){
			getSession().delete(bean);
			return true;
		}
		return false;
	}

}
