package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.Administrator;

public class AdminsDAOHibernate{
	//main方法建立session
	private Session session;
	public Session getSession(){
		return session;
	}
	public AdminsDAOHibernate(Session session){
		this.session = session;
	}
	
	public List selectAll(){
		Query query = getSession().createQuery("from Administrator");
		List<Administrator> list = query.list();
		return list;
	}
	
	public Administrator select(int id){
		Administrator bean =(Administrator)getSession().get(Administrator.class, id);
		return bean;
	}
	public int update(String password,String auth,String name,int id){
		Administrator bean =(Administrator)getSession().get(Administrator.class, id);
		if(bean!=null){
			bean.setPwd(password);
			bean.setAuth(auth);
			bean.setName(name);
			return 1;
		}
		return 0;
	}
	
	public int insert(String pwd,String auth,String name){
		
		try {
			Administrator bean = new Administrator();
			bean.setAuth(auth);
			bean.setName(name);
			bean.setPwd(pwd);
			session.save(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	public int delete(int id){
		Administrator bean = (Administrator)getSession().get(Administrator.class,id);
		getSession().delete(bean);
		return 0;
	}
	
	
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			AdminsDAOHibernate dao = new AdminsDAOHibernate(session);
			
			//selectall
			List list = dao.selectAll();
			System.out.println(list);

//			//update
//			int i = dao.update("aaaa", "bbbb", "cccc", 4);
//			System.out.println(i);
//			//select
//			Admins adm = dao.select(4);
//			System.out.println(adm);
//			
//			//insert
//			int a = dao.insert("Lee", "master", "yeee");
//			System.out.println(a);
//			
//			//delete
//			int d = dao.delete(7);
//			System.out.println(d);
			session.getTransaction().commit();
			
		}finally{
			HibernateUtil.closeSessionFactory();
		}
	}
}
