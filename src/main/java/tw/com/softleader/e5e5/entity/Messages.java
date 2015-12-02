package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 07:16:55 by Hibernate Tools 4.3.1.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Messages generated by hbm2java
 */
@Entity
@Table(name = "messages", schema = "dbo", catalog = "EEIT82DB")
public class Messages implements java.io.Serializable {

	private int id;
	private User user;
	private Date time;
	private String senderId;
	private String receiverId;
	private Date readTime;
	private Date deliverTime;
	private String article;

	public Messages() {
	}

	public Messages(int id) {
		this.id = id;
	}

	public Messages(int id, User user, Date time, String senderId, String receiverId, Date readTime, Date deliverTime,
			String article) {
		this.id = id;
		this.user = user;
		this.time = time;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.readTime = readTime;
		this.deliverTime = deliverTime;
		this.article = article;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time", length = 23)
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "sender_id", length = 30)
	public String getSenderId() {
		return this.senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	@Column(name = "receiver_id", length = 30)
	public String getReceiverId() {
		return this.receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "read_time", length = 23)
	public Date getReadTime() {
		return this.readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "deliver_time", length = 23)
	public Date getDeliverTime() {
		return this.deliverTime;
	}

	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}

	@Column(name = "article")
	public String getArticle() {
		return this.article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

}
