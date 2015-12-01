package tw.com.softleader.e5e5.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class boards {
	@Id
	private Integer boardId;
	private java.util.Date dateCreated;
	private String boardName;
	private byte[] boardPic;
	private String bDescription;
	private Integer threadCount;
	private Integer replayCount;
	private char isCream;
	@ManyToOne
	@JoinColumn(name = "categoryId")
	private boardCategories categoryId;
	@ManyToOne
	@JoinColumn(name = "lastThreadId")
	private threads lastThreadId;
	@ManyToOne
	@JoinColumn(name = "lastReplayId")
	private replies lastReplayId;

//	@ManyToMany(cascade = CascadeType.ALL)
//	@JoinTable(name = "userOwner", joinColumns = { @JoinColumn(name = "boardId") }, inverseJoinColumns = {
//			@JoinColumn(name = "userId") })
//	private Set<users> administrators = new HashSet<users>();

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public java.util.Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(java.util.Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public byte[] getBoardPic() {
		return boardPic;
	}

	public void setBoardPic(byte[] boardPic) {
		this.boardPic = boardPic;
	}

	public String getbDescription() {
		return bDescription;
	}

	public void setbDescription(String bDescription) {
		this.bDescription = bDescription;
	}

	public Integer getThreadCount() {
		return threadCount;
	}

	public void setThreadCount(Integer threadCount) {
		this.threadCount = threadCount;
	}

	public Integer getReplayCount() {
		return replayCount;
	}

	public void setReplayCount(Integer replayCount) {
		this.replayCount = replayCount;
	}

	public char getIsCream() {
		return isCream;
	}

	public void setIsCream(char isCream) {
		this.isCream = isCream;
	}

	public boardCategories getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(boardCategories categoryId) {
		this.categoryId = categoryId;
	}

	public threads getLastThreadId() {
		return lastThreadId;
	}

	public void setLastThreadId(threads lastThreadId) {
		this.lastThreadId = lastThreadId;
	}

	public replies getLastReplayId() {
		return lastReplayId;
	}

	public void setLastReplayId(replies lastReplayId) {
		this.lastReplayId = lastReplayId;
	}

}
