package tw.com.softleader.e5e5.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exchange")
public class Exchange {
	public Exchange(){
		
	}
	
//public static void main(String[] args) {
		
//		try {
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			session.beginTransaction();

//			DeptBean bean = new DeptBean();
//			bean.setDeptid(60);
//			bean.setDeptname("TestName");
//			session.save(bean);
			
//			Exchange select = (Exchange) session.load(Exchange.class, 1);
//			System.out.println(select);
//			
//			session.getTransaction().commit();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//
//	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="exchange")
	private java.util.Date time;
	
	@Column(name="productAId")
	private Integer productAId;
	
	@Column(name="productBId")
	private Integer productBId;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public java.util.Date getTime() {
		return time;
	}
	public void setTime(java.util.Date time) {
		this.time = time;
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
		return "[Exchange:" + id + ", "+ time + ", " + productAId 
				+ ", " + productBId + "]";
	}

	
}
