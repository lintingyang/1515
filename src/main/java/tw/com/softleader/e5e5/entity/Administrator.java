package tw.com.softleader.e5e5.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;

@Entity
@Table(name="admins")
public class Administrator {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="adminid")
	int Id;
	@Column(name="pwd")
	String password;
	String name;
	String auth;
	 
	
	@Override
	public String toString() {
		return "admins [adminId=" + Id + ", pwd=" + password + ", name=" + name + ", auth=" + auth + "]";
	}
	public int getAdminId() {
		return Id;
	}
	public void setAdminId(int adminId) {
		this.Id = adminId;
	}
	public String getPwd() {
		return password;
	}
	public void setPwd(String pwd) {
		this.password = pwd;
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
			
			Administrator admin = (Administrator) session.load(Administrator.class, 2);
			System.out.println(admin);
			
			
			session.getTransaction().commit();
		}finally{
			HibernateUtil.closeSessionFactory();
		}
		
		
	}
	
}
