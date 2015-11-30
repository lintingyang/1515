package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
@Entity
public class eMessage {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer msgId;
	private java.util.Date msgTime;
	private Integer userId;
	private java.util.Date msgDeliverTime;
	private String msgReceiverId;
	private String msgSenderID;
	@Lob
	private String msgArticle;
	private java.util.Date msgReadTime;
	
	
	
	
	
	

	@Override
	public String toString() {
		return "eMessage [msgId=" + msgId + ", msgTime=" + msgTime + ", userId=" + userId + ", msgDeliverTime="
				+ msgDeliverTime + ", msgReceiverId=" + msgReceiverId + ", msgSenderID=" + msgSenderID + ", msgArticle="
				+ msgArticle + ", msgReadTime=" + msgReadTime + "]";
	}
	public String getMsgSenderID() {
		return msgSenderID;
	}
	public void setMsgSenderID(String msgSenderID) {
		this.msgSenderID = msgSenderID;
	}

	public Integer getMsgId() {
		return msgId;
	}
	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}
	public java.util.Date getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(java.util.Date msgTime) {
		this.msgTime = msgTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public java.util.Date getMsgDeliverTime() {
		return msgDeliverTime;
	}
	public void setMsgDeliverTime(java.util.Date msgDeliverTime) {
		this.msgDeliverTime = msgDeliverTime;
	}
	public String getMsgReceiverId() {
		return msgReceiverId;
	}
	public void setMsgReceiverId(String msgReceiverId) {
		this.msgReceiverId = msgReceiverId;
	}
	public String getMsgArticle() {
		return msgArticle;
	}
	public void setMsgArticle(String msgArticle) {
		this.msgArticle = msgArticle;
	}
	public java.util.Date getMsgReadTime() {
		return msgReadTime;
	}
	public void setMsgReadTime(java.util.Date msgReadTime) {
		this.msgReadTime = msgReadTime;
	}
	
	
	
}
