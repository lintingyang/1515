package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;

@Entity
@Table(name="admins")
public class Admins {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int adminId;
	String pwd;
	String name;
	String auth;
	 
	
	@Override
	public String toString() {
		return "admins [adminId=" + adminId + ", pwd=" + pwd + ", name=" + name + ", auth=" + auth + "]";
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public static void main(String[] args){
		try {
			Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			Admins admin = (Admins) session.load(Admins.class, 2);
			System.out.println(admin);
			
			
			session.getTransaction().commit();
		}finally{
			HibernateUtil.closeSessionFactory();
		}
		
		
	}
	
}
