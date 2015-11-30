package tw.com.softleader.e5e5.dao;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.Chat;

public class ChatDAOHibernate{
	private Session session;
	public ChatDAOHibernate(Session session) {
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
			ChatDAOHibernate dao = new ChatDAOHibernate(session);
			Chat bean = new Chat();
//			bean = dao.selectById(1);
//			System.out.println(bean);
//			List<Chat> beans= dao.selectAll();
//			System.out.println(beans);
			
			bean.setMsg("大家早安啦");
			bean.setPicture(null);
			bean.setSendTime(new Date());
			bean.setUserId(6);
			bean.setChatId(8);
			
			
//			System.out.println(dao.insert(bean));
//			System.out.println(dao.update(bean));
			System.out.println("Delete Result: "+dao.delete(8));
			

			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	public Chat selectById(int chatId) {
		Chat bean = null;
		try {
			bean = (Chat) getSession().get(Chat.class, chatId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	public List<Chat> selectAll() {
		List<Chat> beans=null;
		try {
			beans = (List<Chat>)getSession().createQuery("from Chat").list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return beans;
		}
	}
	public int insert(Chat bean){
		Chat temp=(Chat) getSession().get(Chat.class, bean.getChatId());
		if(temp==null){
			getSession().save(bean);
			return 1;
		}		
		return 0;
	}
	public int update(Chat bean){
		Chat temp=(Chat) getSession().get(Chat.class, bean.getChatId());
		if(temp!=null){
			temp.setChatId(bean.getChatId());
			temp.setMsg(bean.getMsg());
			temp.setPicture(bean.getPicture());
			temp.setSendTime(bean.getSendTime());
			temp.setUserId(bean.getUserId());
			return 1;
		}		
		return 0;
	}
	public boolean delete(int chatId){
		Chat temp=(Chat) getSession().get(Chat.class, chatId);
		if(temp!=null){
			getSession().delete(temp);
			return true;
		}		
		return false;
	}

}
