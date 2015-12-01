package tw.com.softleader.e5e5.dao;

import static org.junit.Assert.assertEquals;

import org.hibernate.Session;
import org.junit.Test;

public class BroadcastDAOHibernateTest {

	@Test
	public void testSelectById() {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			BroadcastDAOHibernate dao = new BroadcastDAOHibernate(session);

			Broadcast result = new Broadcast();
			result.setBroadcastDescription("你知道安力嗎");
			Broadcast bean = dao.selectById(1);
			System.out.println(bean);
			assertEquals(result.getBroadcastDescription(), bean.getBroadcastDescription());
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	// @Test
	// public void testSelectAll() {

	// }

//	@Test
//	public void testInsert() {
//		try {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			session.beginTransaction();
//			BroadcastDAOHibernate dao = new BroadcastDAOHibernate(session);
//			Broadcast bean = new Broadcast();
//			bean.setBroadcastDescription("這是測試二號");
//			bean.setPostTime(new Date());
//			bean.setUserId(7);
//			int test = dao.insert(bean);
//			assertEquals(1, test);
//			session.getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//
//	}
//
//	@Test
//	public void testUpdate() {
//		try {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			session.beginTransaction();
//			BroadcastDAOHibernate dao = new BroadcastDAOHibernate(session);
//			Broadcast bean = new Broadcast();
//			bean.setBroadcastDescription("這是測試三號");
//			bean.setPostTime(new Date());
//			bean.setUserId(7);
//			bean.setBroadcastId(2);
//			int test = dao.update(bean);
//			assertEquals(1, test);
//			session.getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
//
//	@Test
//	public void testDelete() {
//		try {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			session.beginTransaction();
//			BroadcastDAOHibernate dao = new BroadcastDAOHibernate(session);
//			boolean test = dao.delete(1);
//			assertEquals(true, test);
//			session.getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
}
