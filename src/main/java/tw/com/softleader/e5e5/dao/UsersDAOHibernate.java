package tw.com.softleader.e5e5.dao;

import java.util.List;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;
import tw.com.softleader.e5e5.entity.Users;

public class UsersDAOHibernate{
	private Session session;
	
	public UsersDAOHibernate(Session session) {
		super();
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	
	public Users selectOne(int userId){
		
		return (Users) getSession().get(Users.class,userId );
	}
	
	public List<Users> selectAll(){
		
		return session.createQuery("from UsersBean").list();
	}
	
	public int update(int userId , String userPwd , String userName ,String userNickName , String userAccount, int userAge
			,char userSex,java.util.Date userBirthday,String userAddress,String userPhone,String userCellPhone
			,String userEmail,java.sql.Blob userPicture,String userSchoolEmail,String userFocusItemList,int userGameScore
			,int onlineDateTime){
		
		Users bean =(Users) getSession().get(Users.class, userId);
		if(bean!=null){
			bean.setUserPwd(userPwd);
			bean.setUserName(userName);
			bean.setUserNickName(userNickName);
			bean.setUserAccount(userAccount);
			bean.setUserAge(userAge);
			bean.setUserSex(userSex);
			bean.setUserBirthday(userBirthday);
			bean.setUserAddress(userAddress);
			bean.setUserPhone(userPhone);
			bean.setUserCellPhone(userCellPhone);
			bean.setUserEmail(userEmail);
			bean.setUserPicture(userPicture);
			bean.setUserSchoolEmail(userSchoolEmail);
			bean.setUserFocusItemList(userFocusItemList);
			bean.setUserGameScore(userGameScore);
			bean.setonlineDateTime(onlineDateTime);
			
			return 1;
		}
		return 0;
	}
	
	
	public int insert (Users bean){
		if(bean!=null){
			int temp = (Integer) getSession().save(bean);
			return temp;
		}
		return 0;
	}
	
	
	
	public boolean delete(int userId){
			Users bean = this.selectOne(userId);
			if(bean!=null){
				session.delete(bean);
				return true;
			}
			
			return false;
		}
	
	
	
	
	
	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			UsersDAOHibernate dao = new UsersDAOHibernate(session);
//			Users bean = dao.selectOne(1);
//			System.out.println(bean);
			Users bean = new Users();
			bean.setUserName("agasdgasga");
			int temp = dao.insert(bean);
			System.out.println(temp);
			
			
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	
	
	
	
	
}
