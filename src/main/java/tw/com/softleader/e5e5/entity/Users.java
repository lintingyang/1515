package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;

@Entity
@Table(name="users")
public class Users {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer userId;
	private String userPwd;
	private String userName;
	private String userNickName;
	private String userAccount;
	private Integer userAge;
	private char userSex;
	private java.util.Date userBirthday;
	private String userAddress;
	private String userPhone;
	private String userCellPhone;
	private String userEmail;
	private java.sql.Blob userPicture;
	private String userSchoolEmail;
	private String userFocusItemList;
	private Integer userGameScore;
	private Integer onlineDateTime;
	
	

	@Override
	public String toString() {
		return "usersBean [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userNickName="
				+ userNickName + ", userAccount=" + userAccount + ", userAge=" + userAge + ", userSex=" + userSex
				+ ", userBirthday=" + userBirthday + ", userAddress=" + userAddress + ", userPhone=" + userPhone
				+ ", userCellPhone=" + userCellPhone + ", userEmail=" + userEmail + ", userPicture=" + userPicture
				+ ", userSchoolEmail=" + userSchoolEmail + ", userFocusItemList=" + userFocusItemList
				+ ", userGameScore=" + userGameScore + ", onlineDateTime=" + onlineDateTime + "]";
	}


	public static void main (String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			Users bean = (Users) session.load(Users.class, 1);
//			List<usersBean> beans = session.createQuery("from usersBean").list();
//			System.out.prIntegerln(beans);
			System.out.println(bean);
			
//			usersBean bean = new usersBean();
//			bean.setUserId(10);
//			session.delete(bean);
			
			
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public Integer getUserAge() {
		return userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public char getUserSex() {
		return userSex;
	}
	public void setUserSex(char userSex) {
		this.userSex = userSex;
	}
	public java.util.Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(java.util.Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserCellPhone() {
		return userCellPhone;
	}
	public void setUserCellPhone(String userCellPhone) {
		this.userCellPhone = userCellPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public java.sql.Blob getUserPicture() {
		return userPicture;
	}
	public void setUserPicture(java.sql.Blob userPicture) {
		this.userPicture = userPicture;
	}
	public String getUserSchoolEmail() {
		return userSchoolEmail;
	}
	public void setUserSchoolEmail(String userSchoolEmail) {
		this.userSchoolEmail = userSchoolEmail;
	}
	public String getUserFocusItemList() {
		return userFocusItemList;
	}
	public void setUserFocusItemList(String userFocusItemList) {
		this.userFocusItemList = userFocusItemList;
	}
	public Integer getUserGameScore() {
		return userGameScore;
	}
	public void setUserGameScore(Integer userGameScore) {
		this.userGameScore = userGameScore;
	}
	public Integer getonlineDateTime() {
		return onlineDateTime;
	}
	public void setonlineDateTime(Integer onlineDateTime) {
		this.onlineDateTime = onlineDateTime;
	}


	
	
}
