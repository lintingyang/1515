package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;

import model.hibernate.HibernateUtil;

@Entity
@Table(name="exchange")
public class Exchange {
	public Exchange(){
		
	}
	
public static void main(String[] args) {
		
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

//			DeptBean bean = new DeptBean();
//			bean.setDeptid(60);
//			bean.setDeptname("TestName");
//			session.save(bean);
			
			Exchange select = (Exchange) session.load(Exchange.class, 1);
			System.out.println(select);
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}

	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int exchangeId;
	private java.util.Date exgTime;
	private Integer productAId;
	private Integer productBId;
	
	
	public int getExchangeId() {
		return exchangeId;
	}
	public void setExchangeId(int exchangeId) {
		this.exchangeId = exchangeId;
	}
	public java.util.Date getExgTime() {
		return exgTime;
	}
	public void setExgTime(java.util.Date exgTime) {
		this.exgTime = exgTime;
	}
	public int getProductAId() {
		return productAId;
	}
	public void setProductAId(Integer productAId) {
		this.productAId = productAId;
	}
	public int getProductBId() {
		return productBId;
	}
	public void setProductBId(Integer productBId) {
		this.productBId = productBId;
	}
	
	@Override
	public String toString() {
		return "[Exchange:" + exchangeId + ", "+ exgTime + ", " + productAId 
				+ ", " + productBId + "]";
	}

	
}
