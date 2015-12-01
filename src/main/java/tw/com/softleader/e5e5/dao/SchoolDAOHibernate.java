package tw.com.softleader.e5e5.dao;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.School;

public class SchoolDAOHibernate{
	private Session session;
	public SchoolDAOHibernate(Session session) {
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
			SchoolDAOHibernate dao = new SchoolDAOHibernate(session);
			School bean = new School();
//			bean = dao.selectById(2);
//			System.out.println(bean);
			
//			List<School> beans= dao.selectAll();
//			System.out.println(beans);
			
			bean.setArea("臺北市");
			bean.setMailCheck('T');
			bean.setSchoolName("國立政治大學");
			bean.setUserId(2);
			bean.setSchoolId(12);
			
			
//			System.out.println(dao.insert(bean));
//			System.out.println(dao.update(bean));
			System.out.println("Delete Result: "+dao.delete(12));
			

			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	public School selectById(int schoolId) {
		School bean = null;
		try {
			bean = (School) getSession().get(School.class, schoolId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	public List<School> selectAll() {
		List<School> beans=null;
		try {
			beans = (List<School>)getSession().createQuery("from School").list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return beans;
		}
	}
	public int insert(School bean){
		School temp=(School) getSession().get(School.class, bean.getSchoolId());
		if(temp==null){
			getSession().save(bean);
			return 1;
		}		
		return 0;
	}
	public int update(School bean){
		School temp=(School) getSession().get(School.class, bean.getSchoolId());
		if(temp!=null){
			temp.setSchoolId(bean.getSchoolId());
			temp.setArea(bean.getArea());
			temp.setMailCheck(bean.getMailCheck());
			temp.setSchoolName(bean.getSchoolName());
			temp.setUserId(bean.getUserId());
			return 1;
		}		
		return 0;
	}
	public boolean delete(int schoolId){
		School temp=(School) getSession().get(School.class, schoolId);
		if(temp!=null){
			getSession().delete(temp);
			return true;
		}		
		return false;
	}

}
