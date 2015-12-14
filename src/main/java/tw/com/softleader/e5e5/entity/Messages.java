package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.transaction.Transactional;

/**
 * Messages generated by hbm2java
 */
@Entity
@Table(name = "messages", schema = "dbo", catalog = "EEIT82DB")
public class Messages implements java.io.Serializable {

	private int id;
	private User userByReceiverId;
	private User userBySenderId;
	private String article;
	private Date deliverTime;
	private Date readTime;
	private Date time;

	public Messages() {
	}

	public Messages(int id) {
		this.id = id;
	}

	public Messages(int id, User userByReceiverId, User userBySenderId, String article, Date deliverTime, Date readTime,
			Date time) {
		this.id = id;
		this.userByReceiverId = userByReceiverId;
		this.userBySenderId = userBySenderId;
		this.article = article;
		this.deliverTime = deliverTime;
		this.readTime = readTime;
		this.time = time;
	}


	@Override
	public String toString() {
		return "Messages [id=" + id + ", userByReceiverId=" + userByReceiverId + ", userBySenderId=" + userBySenderId
				+ ", article=" + article + ", deliverTime=" + deliverTime + ", readTime=" + readTime + ", time=" + time
				 + "]";
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_id")
	public User getUserByReceiverId() {
		return this.userByReceiverId;
	}

	public void setUserByReceiverId(User userByReceiverId) {
		this.userByReceiverId = userByReceiverId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender_id")
	public User getUserBySenderId() {
		return this.userBySenderId;
	}

	public void setUserBySenderId(User userBySenderId) {
		this.userBySenderId = userBySenderId;
	}

	@Column(name = "article")
	public String getArticle() {
		return this.article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "deliver_time", length = 23)
	public Date getDeliverTime() {
		return this.deliverTime;
	}

	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
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
	@Column(name = "time", length = 23)
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
