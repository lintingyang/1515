package tw.com.softleader.e5e5.entity;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.common.entity.OurEntity;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Entity
@Table(name = "question_and_answer", schema = "dbo", catalog = "EEIT82DB")
public class QuestionAndAnswer extends OurEntity implements java.io.Serializable {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id")
	private Product product;
	
	@Column(name = "question", length = 200)
	private String question;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "questioner_id", referencedColumnName = "id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private User questionerId;
	
	@Column(name = "answer", length = 200)
	private String answer;
	
	@Column(name = "question_time")
	private LocalDateTime questionTime;
	
	@Column(name = "answer_time")
	private LocalDateTime answerTime;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_public")
	private TrueFalse isPublic;
	
	public QuestionAndAnswer() {
	}

	@Override
	public String toString() {
		return "QuestionAndAnswer [question=" + question + ", answer=" + answer + ", questionTime=" + questionTime
				+ ", answerTime=" + answerTime + ", isPublic=" + isPublic + "]";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	public User getQuestionerId() {
		return questionerId;
	}

	public void setQuestionerId(User questionerId) {
		this.questionerId = questionerId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public LocalDateTime getQuestionTime() {
		return questionTime;
	}

	public void setQuestionTime(LocalDateTime questionTime) {
		this.questionTime = questionTime;
	}

	public LocalDateTime getAnswerTime() {
		return answerTime;
	}

	public void setAnswerTime(LocalDateTime answerTime) {
		this.answerTime = answerTime;
	}

	public TrueFalse getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(TrueFalse isPublic) {
		this.isPublic = isPublic;
	}

//	public char getIsPublic() {
//		return isPublic;
//	}
//
//	public void setIsPublic(char isPublic) {
//		this.isPublic = isPublic;
//	}



}
