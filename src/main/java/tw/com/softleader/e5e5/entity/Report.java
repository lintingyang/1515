package tw.com.softleader.e5e5.entity;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.common.entity.OurEntity;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Entity
@Table(name = "report", schema = "dbo", catalog = "EEIT82DB")
public class Report extends OurEntity implements java.io.Serializable {

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@JoinColumn(name = "role")
	private User role;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@JoinColumn(name="product_id", referencedColumnName = "id")
	private Product product;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@JoinColumn(name = "product_qiestions_id", referencedColumnName = "id")
	private QuestionAndAnswer productQuestions;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@JoinColumn(name = "reporter_id")
	private User reporterId;
	
	@Column(name = "article", length = 200)
	private String article;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "is_passed", length = 10)
	private TrueFalse isPassed;
	
	@Column(name = "report_time", length = 23)
	private LocalDateTime reportTime;
	
//	private Reply reply;
//	private Thread thread;

	@Override
	public String toString() {
		return "Report [article=" + article + ", reportTime=" + reportTime + "]";
	}

	public User getRole() {
		return role;
	}

	public void setRole(User role) {
		this.role = role;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public QuestionAndAnswer getProductQuestions() {
		return productQuestions;
	}

	public void setProductQuestions(QuestionAndAnswer productQuestions) {
		this.productQuestions = productQuestions;
	}

	public User getReporterId() {
		return reporterId;
	}

	public void setReporterId(User reporterId) {
		this.reporterId = reporterId;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public TrueFalse getIsPassed() {
		return isPassed;
	}

	public void setIsPassed(TrueFalse isPassed) {
		this.isPassed = isPassed;
	}

	public LocalDateTime getReportTime() {
		return reportTime;
	}

	public void setReportTime(LocalDateTime reportTime) {
		this.reportTime = reportTime;
	}

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
//	@JoinColumn(name = "reply_id")
//	public Reply getReply() {
//		return this.reply;
//	}
//
//
//	public void setReply(Reply reply) {
//		this.reply = reply;
//	}

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
//	@JoinColumn(name = "thread_id")
//	public Thread getThread() {
//		return this.thread;
//	}
//
//	public void setThread(Thread thread) {
//		this.thread = thread;
//	}
	
}
