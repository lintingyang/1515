package tw.com.softleader.e5e5.entity;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "question_and_answer", schema = "dbo", catalog = "EEIT82DB")
public class QuestionAndAnswer implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id")
	private Product product;
	
	@Column(name = "answer", length = 200)
	private String answer;
	
	@Column(name = "edit_time", length = 23)
	private LocalDateTime editTime;
	
	@Column(name = "is_public", length = 1)
	private Character isPublic;
	
	@Column(name = "question", length = 200)
	private String question;

	public QuestionAndAnswer() {
	}

	@Override
	public String toString() {
		return "QuestionAndAnswer [id=" + id + ", answer=" + answer + ", editTime=" + editTime + ", isPublic="
				+ isPublic + ", question=" + question + "]";
	}


	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	
	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public LocalDateTime getEditTime() {
		return editTime;
	}

	public void setEditTime(LocalDateTime editTime) {
		this.editTime = editTime;
	}

	
	public Character getIsPublic() {
		return this.isPublic;
	}

	public void setIsPublic(Character isPublic) {
		this.isPublic = isPublic;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

}
