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
@Table(name = "log_mail", schema = "dbo", catalog = "EEIT82DB")
public class LogMail extends OurEntity implements java.io.Serializable {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender_id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private User sender;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private User receiver;
		
	@Column(name = "title")
	private String title;
	
	@Column(name = "article")
	private String article;
	
	@Column(name = "draft_time")
	private LocalDateTime draftTime;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_draft")
	private TrueFalse isDraft;
	
	@Column(name = "send_time")
	private LocalDateTime sendTime;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_backup")
	private TrueFalse isBackup;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_trash")
	private TrueFalse isTrash;

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

	public LocalDateTime getDraftTime() {
		return draftTime;
	}

	public void setDraftTime(LocalDateTime draftTime) {
		this.draftTime = draftTime;
	}

	public TrueFalse getIsDraft() {
		return isDraft;
	}

	public void setIsDraft(TrueFalse isDraft) {
		this.isDraft = isDraft;
	}

	public LocalDateTime getSendTime() {
		return sendTime;
	}

	public void setSendTime(LocalDateTime sendTime) {
		this.sendTime = sendTime;
	}

	public TrueFalse getIsBackup() {
		return isBackup;
	}

	public void setIsBackup(TrueFalse isBackup) {
		this.isBackup = isBackup;
	}

	public TrueFalse getIsTrash() {
		return isTrash;
	}

	public void setIsTrash(TrueFalse isTrash) {
		this.isTrash = isTrash;
	}

	@Override
	public String toString() {
		return "LogMail [title=" + title + ", article=" + article + ", draftTime=" + draftTime + ", isDraft=" + isDraft
				+ ", sendTime=" + sendTime + ", isBackup=" + isBackup + ", isTrash=" + isTrash + "]";
	}
	
	
}
