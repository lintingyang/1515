package tw.com.softleader.e5e5.entity;
// Generated 2015/11/27 �U�� 07:40:05 by Hibernate Tools 4.3.1.Final

import java.util.Arrays;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Chat")
public class Chat implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int chatId;
	private String msg;
	private byte[] picture;
	private Date sendTime;
	private Integer userId;

	public Chat() {
	}

	public Chat(int chatId) {
		this.chatId = chatId;
	}

	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", msg=" + msg + ", picture=" + Arrays.toString(picture) + ", sendTime="
				+ sendTime + ", userId=" + userId + "]";
	}

	public Chat(int chatId, String msg, byte[] picture, Date sendTime, Integer userId) {
		this.chatId = chatId;
		this.msg = msg;
		this.picture = picture;
		this.sendTime = sendTime;
		this.userId = userId;
	}

	public int getChatId() {
		return this.chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public byte[] getPicture() {
		return this.picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public Date getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
