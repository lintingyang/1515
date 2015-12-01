package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.Advertisement;

public class AdvertisementDAOHibernate {
	private Session session;
	public Session getSession(){
		return session;
	}
	public AdvertisementDAOHibernate(Session session){
		this.session = session;
	}
	public List selectAll(){
		Query query = getSession().createQuery("from Advertisement");
		List<Advertisement> list = query.list();
		return list;
	}
	
	public Advertisement select(int id){
		Advertisement bean =(Advertisement)getSession().get(Advertisement.class, id);
		return bean;
	}
	
	
	public int update(String link,String artical,byte[] pic,int id){
		Advertisement bean =(Advertisement)getSession().get(Advertisement.class, id);
		if(bean!=null){
			bean.setLink(link);
			bean.setArtical(artical);
			bean.setPic(pic);
			return 1;
		}else{
			return 0;
		}
	}
	
	public int insert(String link,String artical,byte[] pic){
		
		try {
			Advertisement bean = new Advertisement();
			bean.setLink(link);
			bean.setArtical(artical);
			bean.setPic(pic);
			session.save(bean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public int delete(int id){
		try {
			Advertisement bean = (Advertisement)getSession().get(Advertisement.class,id);
			getSession().delete(bean);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
	
	
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			AdvertisementDAOHibernate dao = new AdvertisementDAOHibernate(session);

			//selectall
			List list = dao.selectAll();
			System.out.println(list);

			//update
			int i = dao.update("aaaa", "bbbb", null, 3);
			System.out.println(i);
//			//select
//			Advertisement adm = dao.select(1);
//			System.out.println(adm);
//			
//			//insert
//			int a = dao.insert("Lee", "master", null);
//			System.out.println(a);
//			
//			//delete
//			int d = dao.delete(3);
//			System.out.println(d);
//

			System.out.println(list);
			
			session.getTransaction().commit();
		}finally{
			HibernateUtil.closeSessionFactory();
		}
	}
}
