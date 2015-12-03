package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * ForumPicture generated by hbm2java
 */
@Entity
@Table(name = "forum_picture", schema = "dbo", catalog = "EEIT82DB")
public class ForumPicture implements java.io.Serializable {

	private int id;
	private String picture;
	private Set<Thread> threads = new HashSet<Thread>(0);
	private Set<Reply> replies = new HashSet<Reply>(0);

	public ForumPicture() {
	}

	public ForumPicture(int id) {
		this.id = id;
	}

	public ForumPicture(int id, String picture, Set<Thread> threads, Set<Reply> replies) {
		this.id = id;
		this.picture = picture;
		this.threads = threads;
		this.replies = replies;
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

	@Column(name = "picture")
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "forumPicture")
	public Set<Thread> getThreads() {
		return this.threads;
	}

	public void setThreads(Set<Thread> threads) {
		this.threads = threads;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "forumPicture")
	public Set<Reply> getReplies() {
		return this.replies;
	}

	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

}