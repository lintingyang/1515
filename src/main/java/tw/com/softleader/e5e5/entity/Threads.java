package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Threads {
	@Id
	private Integer threadId;
	private String title;
	private java.util.Date dateCreated;
	private String thContent;
	private Integer hit;
	private Integer replayCount;
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date dateLastReplied;
	private char isReadonly;
	private char topped;
	@ManyToOne
	@JoinColumn(name = "boardId" ,referencedColumnName = "boardId")
	private Integer boardId;
	@ManyToOne
	@JoinColumn(name = "userId")
	private Integer userId;
}
