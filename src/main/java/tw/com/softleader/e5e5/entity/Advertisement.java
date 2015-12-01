package tw.com.softleader.e5e5.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import model.hibernate.HibernateUtil;
@Entity
@Table(name="advertisement")
public class Advertisement {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="advertisementId")
	private int id;
	private String link;
	private String artical;
	private byte[] pic;
	
	
	@Override
	public String toString() {
		return "Advertisement [advertisementId=" + id + ", link=" + link + ", artical=" + artical
				+ ", pic=" + Arrays.toString(pic) + "]";
	}
	
	public int getAdvertisementId() {
		return id;
	}
	public void setAdvertisementId(int advertisementId) {
		this.id = advertisementId;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getArtical() {
		return artical;
	}
	public void setArtical(String artical) {
		this.artical = artical;
	}
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	
	public static void main(String[] args){
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			Advertisement bean = (Advertisement)session.get(Advertisement.class, 1);
			System.out.println(bean);
			session.getTransaction().commit();
		}finally{
			HibernateUtil.closeSessionFactory();
		}	
	}
	
	
}
