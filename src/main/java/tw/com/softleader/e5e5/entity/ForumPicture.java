package tw.com.softleader.e5e5.entity;
// default package
// Generated 2015/12/14 �U�� 08:58:01 by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * ForumPicture generated by hbm2java
 */
@Entity
@Table(name = "forum_picture", schema = "dbo", catalog = "EEIT82DB")
public class ForumPicture implements java.io.Serializable {

	private int id;
	private Reply reply;
	private Thread thread;
	private String picture;
	private Set<Reply> replies = new HashSet<Reply>(0);
	private Set<Thread> threads = new HashSet<Thread>(0);

	public ForumPicture() {
	}

	public ForumPicture(int id) {
		this.id = id;
	}

	public ForumPicture(int id, Reply reply, Thread thread, String picture, Set<Reply> replies, Set<Thread> threads) {
		this.id = id;
		this.reply = reply;
		this.thread = thread;
		this.picture = picture;
		this.replies = replies;
		this.threads = threads;
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
	@JoinColumn(name = "reply_id")
	public Reply getReply() {
		return this.reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "thread_id")
	public Thread getThread() {
		return this.thread;
	}

	public void setThread(Thread thread) {
		this.thread = thread;
	}

	@Column(name = "picture")
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "forumPicture")
	public Set<Reply> getReplies() {
		return this.replies;
	}

	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "forumPicture")
	public Set<Thread> getThreads() {
		return this.threads;
	}

	public void setThreads(Set<Thread> threads) {
		this.threads = threads;
	}

}
