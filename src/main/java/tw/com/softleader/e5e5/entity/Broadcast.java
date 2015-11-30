package tw.com.softleader.e5e5.entity;

import java.util.Arrays;
import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.Session;
import model.hibernate.HibernateUtil;


@Entity
@Table(name="Broadcast")
public class Broadcast implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int broadcastId;
	private Date postTime;
	private String broadcastDescription;
	private byte[] picture;
	private Integer userId;

	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			Broadcast bean = (Broadcast) session.load(Broadcast.class, 1);
			System.out.println(bean);

			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	public Broadcast() {
	}

	public Broadcast(int broadcastId) {
		this.broadcastId = broadcastId;
	}

	public Broadcast(int broadcastId, Date postTime, String broadcastDescription, byte[] picture, Integer userId) {
		this.broadcastId = broadcastId;
		this.postTime = postTime;
		this.broadcastDescription = broadcastDescription;
		this.picture = picture;
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Broadcast [broadcastId=" + broadcastId + ", postTime=" + postTime + ", broadcastDescription="
				+ broadcastDescription + ", picture=" + Arrays.toString(picture) + ", userId=" + userId + "]";
	}

	public int getBroadcastId() {
		return this.broadcastId;
	}

	public void setBroadcastId(int broadcastId) {
		this.broadcastId = broadcastId;
	}

	public Date getPostTime() {
		return this.postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public String getBroadcastDescription() {
		return this.broadcastDescription;
	}

	public void setBroadcastDescription(String broadcastDescription) {
		this.broadcastDescription = broadcastDescription;
	}

	public byte[] getPicture() {
		return this.picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
