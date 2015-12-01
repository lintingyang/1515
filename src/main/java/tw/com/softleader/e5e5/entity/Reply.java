package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Replies")
public class Reply {
	@Id
	private Integer replyId;
	private java.util.Date dateCreated;
	private String title;
	private String reContent;
	private Integer rfloor;
	@ManyToOne
	@JoinColumn(name = "threadId")
	private Integer threadId;
	@ManyToOne
	@JoinColumn(name = "fPictureId")
	private Integer fPictureId;
}
