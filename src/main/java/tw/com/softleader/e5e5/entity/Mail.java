package tw.com.softleader.e5e5.entity;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.common.entity.OurEntity;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Entity
@Table(name = "mail", schema = "dbo", catalog = "EEIT82DB")
public class Mail extends OurEntity implements java.io.Serializable {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender_id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private User sender;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private User receiver;
	
	@Column(name = "send_time")
	private LocalDateTime sendTime;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "article")
	private String article;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_important")
	private TrueFalse isImportant;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_trash")
	private TrueFalse isTrash;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_read")
	private TrueFalse isRead;
	
	public Mail() {
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public LocalDateTime getSendTime() {
		return sendTime;
	}

	public void setSendTime(LocalDateTime sendTime) {
		this.sendTime = sendTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public TrueFalse getIsImportant() {
		return isImportant;
	}

	public void setIsImportant(TrueFalse isImportant) {
		this.isImportant = isImportant;
	}

	public TrueFalse getIsTrash() {
		return isTrash;
	}

	public void setIsTrash(TrueFalse isTrash) {
		this.isTrash = isTrash;
	}

	public TrueFalse getIsRead() {
		return isRead;
	}

	public void setIsRead(TrueFalse isRead) {
		this.isRead = isRead;
	}

	@Override
	public String toString() {
		return "Mail [sendTime=" + sendTime + ", title=" + title + ", article=" + article + ", isImportant="
				+ isImportant + ", isTrash=" + isTrash + ", isRead=" + isRead + "]";
	}
	
}
