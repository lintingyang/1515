package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.transaction.Transactional;

/**
 * Board generated by hbm2java
 */
@Entity
@Table(name = "board", schema = "dbo", catalog = "EEIT82DB")
public class Board implements java.io.Serializable {

	private int id;
	private BoardCategoria boardCategoria;
	// private BoardCategory boardCategory;
	private Date createdDate;
	private String name;
	private String description;
	private Integer hit;
	private Integer threadCount;
	private Integer replyCount;
	private Character isCream;
	private Character isHide;
	private String picture;
	private Set<UserOwner> userOwners = new HashSet<UserOwner>(0);
	private Set<Thread> threads = new HashSet<Thread>(0);

	public Board() {
	}

	@Column(name = "is_hide", length = 1)
	public Character getIsHide() {
		return isHide;
	}

	public void setIsHide(Character isHide) {
		this.isHide = isHide;
	}

	public Board(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Board(int id, BoardCategoria boardCategoria, Date createdDate, String name,
			String description, Integer threadCount, Integer replyCount, Character isCream, String picture,
			Set<UserOwner> userOwners, Set<Thread> threads) {
		this.id = id;
		this.boardCategoria = boardCategoria;
		// this.boardCategory = boardCategory;
		this.createdDate = createdDate;
		this.name = name;
		this.description = description;
		this.threadCount = threadCount;
		this.replyCount = replyCount;
		this.isCream = isCream;
		this.picture = picture;
		this.userOwners = userOwners;
		this.threads = threads;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	@Transactional
	public BoardCategoria getBoardCategoria() {
		return this.boardCategoria;
	}

	public void setBoardCategoria(BoardCategoria boardCategoria) {
		this.boardCategoria = boardCategoria;
	}

	// @ManyToOne(fetch = FetchType.LAZY)
	// @JoinColumn(name = "category_id", insertable = false, updatable = false)
	// public BoardCategory getBoardCategory() {
	// return this.boardCategory;
	// }
	//
	// public void setBoardCategory(BoardCategory boardCategory) {
	// this.boardCategory = boardCategory;
	// }


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", length = 23)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description", length = 50)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "thread_count")
	public Integer getThreadCount() {
		return this.threadCount;
	}

	public void setThreadCount(Integer threadCount) {
		this.threadCount = threadCount;
	}

	@Column(name = "reply_count")
	public Integer getReplyCount() {
		return this.replyCount;
	}

	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}

	@Column(name = "is_cream", length = 1)
	public Character getIsCream() {
		return this.isCream;
	}

	public void setIsCream(Character isCream) {
		this.isCream = isCream;
	}

	@Column(name = "picture")
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	// 刪Board刪版主們
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "board", cascade = { CascadeType.REMOVE })
	@Transactional
	public Set<UserOwner> getUserOwners() {
		return this.userOwners;
	}

	public void setUserOwners(Set<UserOwner> userOwners) {
		this.userOwners = userOwners;
	}

	// 刪Board刪所有Threads
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "board", cascade = { CascadeType.REMOVE })
	public Set<Thread> getThreads() {
		return this.threads;
	}

	public void setThreads(Set<Thread> threads) {
		this.threads = threads;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", createdDate=" + createdDate + ", name=" + name + ", description=" + description
				+ ", threadCount=" + threadCount + ", replyCount=" + replyCount + ", isCream=" + isCream + ", picture="
				+ picture + "]";
	}

}
