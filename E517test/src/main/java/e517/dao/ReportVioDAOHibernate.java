package e517.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import e517.bean.ReportVio;
import e517.hibernate.HibernateUtil;

public class ReportVioDAOHibernate  {

	private Session session;
	public ReportVioDAOHibernate(Session session) {
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			ReportVioDAOHibernate dao = new ReportVioDAOHibernate(session);
			ReportVio bean = dao.select(1);
			System.out.println(" ****this is select = "+bean);
//			
//			List<ProductBean> list = dao.select();
//			System.out.println("*****this is select all =" + list);
			
//			ReportVio bean = new ReportVio();
//			bean.setReportVioId(1);
//			bean.setExgTime(new java.util.Date());
//			bean.setProductAId(2);
//			bean.setProductBId(6);
//			int i = dao.insert(bean);
//			System.out.println("*****this is insert"+ i);
			
//			int update = dao.update(bean);
//			System.out.println("*****this is insert"+update);
			
//			boolean delete = dao.delete(60);
//			System.out.println("*********this is delete = " + delete);
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
		
	}//end of main
	
	public ReportVio select(int ReportVioId) {
		return (ReportVio) getSession().get(ReportVio.class, ReportVioId);
	}

	public List<ReportVio> select() {
		List<ReportVio> list = getSession().createQuery("from ReportVio").list();
		return list;
	}

	public int insert(ReportVio bean) {
		if(bean != null){
			int pk = (Integer) getSession().save(bean);
			return pk;
		}
		return 0;
	}

	public int update(ReportVio bean) {
		ReportVio sel = (ReportVio) getSession().load(ReportVio.class, bean.getReportVioId());
		if (sel != null){
			sel.setArticle(bean.getArticle());
			sel.setIsPassed(bean.getIsPassed());
			sel.setRepoTime(bean.getRepoTime());
			sel.setReporterId(bean.getReporterId());
			sel.setThreadId(bean.getThreadId());
			sel.setProductId(bean.getProductId());
			sel.setAdminId(bean.getAdminId());
			return 1;
		}
		return 0;
	}

	public boolean delete(int ReportVioId) {
		ReportVio bean = (ReportVio) getSession().load(ReportVio.class, ReportVioId);
		if(bean != null){
			getSession().delete(bean);
			return true;
		}
		return false;
	}

}
