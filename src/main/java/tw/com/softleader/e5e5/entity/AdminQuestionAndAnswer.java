package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * AdminQuestionAndAnswer generated by hbm2java
 */
@Entity
@Table(name = "admin_question_and_answer", schema = "dbo", catalog = "EEIT82DB")
public class AdminQuestionAndAnswer implements java.io.Serializable {

	@Override
	public String toString() {
		return "AdminQuestionAndAnswer [id=" + id +  ", answer=" + answer + ", question=" + question
				+ ", createdDate=" +createdDate+ "]";
	}

	private int id;
	private Admin admin;
	private String answer;
	private String question;
	private User user;
	private Date createdDate;
	private String title;


	public AdminQuestionAndAnswer() {
	}

	public AdminQuestionAndAnswer(int id) {
		this.id = id;
	}

	public AdminQuestionAndAnswer(int id, Admin admin, String answer, String question, User user, Date createdDate) {
		this.id = id;
		this.admin = admin;
		this.answer = answer;
		this.question = question;
		this.user = user;
		this.createdDate = createdDate;
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
	@JoinColumn(name = "admin_id")
	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@Column(name = "answer", length = 100)
	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Column(name = "question", length = 100)
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "created_date")
	public Date getCreatedDate() {
		return createdDate;
	}
	
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@Column(name = "title",length = 25)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
