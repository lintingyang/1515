package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.common.entity.OurEntity;

/**
 * Messages generated by hbm2java
 */
@Entity
@Table(name = "messages", schema = "dbo", catalog = "EEIT82DB")
public class Messages extends OurEntity implements java.io.Serializable {
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private User userByReceiverId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender_id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private User userBySenderId;
	
	@Column(name = "article")
	private String article;
	
	@Column(name = "deliver_time", length = 23)
	private LocalDateTime deliverTime;
	
	@Column(name = "read_time", length = 23)
	private LocalDateTime readTime;

	@Override
	public String toString() {
		return "Messages [id=" + id + ", userByReceiverId=" + userByReceiverId.getId() + ", userBySenderId=" + userBySenderId.getId()
				+ ", article=" + article + ", deliverTime=" + deliverTime + ", readTime=" + readTime 
				 + "]";
	}

	public User getUserByReceiverId() {
		return this.userByReceiverId;
	}

	public void setUserByReceiverId(User userByReceiverId) {
		this.userByReceiverId = userByReceiverId;
	}

	public User getUserBySenderId() {
		return this.userBySenderId;
	}

	public void setUserBySenderId(User userBySenderId) {
		this.userBySenderId = userBySenderId;
	}

	public String getArticle() {
		return this.article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public LocalDateTime getDeliverTime() {
		return deliverTime;
	}

	public void setDeliverTime(LocalDateTime deliverTime) {
		this.deliverTime = deliverTime;
	}

	public LocalDateTime getReadTime() {
		return readTime;
	}

	public void setReadTime(LocalDateTime readTime) {
		this.readTime = readTime;
	}





}
