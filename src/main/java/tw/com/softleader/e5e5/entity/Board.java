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
import javax.persistence.Table;

@Entity
@Table(name="Boards")
public class Board {
	@Id
	private Integer id;
	private java.util.Date dateCreated;
	private String boardName;
	private byte[] boardPic;
	private String bDescription;
	private Integer threadCount;
	private Integer replayCount;
	private char isCream;
	@ManyToOne
	@JoinColumn(name = "categoryId")
	private BoardCategory categoryId;
	@ManyToOne
	@JoinColumn(name = "lastThreadId")
	private Thread lastThreadId;
	@ManyToOne
	@JoinColumn(name = "lastReplayId")
	private Reply lastReplayId;

//	@ManyToMany(cascade = CascadeType.ALL)
//	@JoinTable(name = "userOwner", joinColumns = { @JoinColumn(name = "boardId") }, inverseJoinColumns = {
//			@JoinColumn(name = "userId") })
//	private Set<users> administrators = new HashSet<users>();

	public Integer getid() {
		return id;
	}

	public void setid(Integer id) {
		this.id = id;
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

	public BoardCategory getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(BoardCategory categoryId) {
		this.categoryId = categoryId;
	}

	public Thread getLastThreadId() {
		return lastThreadId;
	}

	public void setLastThreadId(Thread lastThreadId) {
		this.lastThreadId = lastThreadId;
	}

	public Reply getLastReplayId() {
		return lastReplayId;
	}

	public void setLastReplayId(Reply lastReplayId) {
		this.lastReplayId = lastReplayId;
	}

}
