package tw.com.softleader.e5e5.service;

import static org.junit.Assert.assertEquals;

import org.hibernate.Session;
import org.junit.Test;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.dao.UserOwnerDAOHibernate;
import tw.com.softleader.e5e5.entity.UserOwner;

public class UsersDAOHibernateTest {
	

	@Test
	public void testUserOwner(){
	try {
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	session.beginTransaction();
	
	UserOwnerDAOHibernate dao = new UserOwnerDAOHibernate(session);
	UserOwner bean = new UserOwner();
	bean.setuOwnerId(1);
	bean.setUserId(1);
	bean.setUserId(3);
	int temp = dao.update(bean);
	assertEquals(1, temp);
	session.getTransaction().commit();
		} 
	finally {
	HibernateUtil.closeSessionFactory();
		}
	}
}
