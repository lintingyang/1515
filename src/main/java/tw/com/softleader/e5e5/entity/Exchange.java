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
import javax.transaction.Transactional;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.entity.enums.Grade;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Entity
@Table(name = "exchange", schema = "dbo", catalog = "EEIT82DB")
public class Exchange implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productA_id", referencedColumnName = "id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private Product productAId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productB_id", referencedColumnName = "id")
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	private Product productBId;
	
	@Column(name = "exchange_time", length = 23)
	private LocalDateTime exchangeTime;
	
	@Column(name = "trade_finished_time", length = 23)
	private LocalDateTime tradeFinishedTime;
	
	@Column(name = "grade_time", length = 23)
	private LocalDateTime gradeTime;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "grade", length = 10)
	private Grade grade;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "tradeStatus", length = 10)
	private TrueFalse tradeStatus;

	public Exchange() {
	}

	public Exchange(int id) {
		this.id = id;
	}
	
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProductAId() {
		return productAId;
	}

	public void setProductAId(Product productAId) {
		this.productAId = productAId;
	}

	public Product getProductBId() {
		return productBId;
	}

	public void setProductBId(Product productBId) {
		this.productBId = productBId;
	}

	public LocalDateTime getExchangeTime() {
		return this.exchangeTime;
	}

	public void setExchangeTime(LocalDateTime exchangeTime) {
		this.exchangeTime = exchangeTime;
	}
	
	
	public LocalDateTime getTradeFinishedTime() {
		return tradeFinishedTime;
	}

	public void setTradeFinishedTime(LocalDateTime tradeFinishedTime) {
		this.tradeFinishedTime = tradeFinishedTime;
	}

	
	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	
	public LocalDateTime getGradeTime() {
		return gradeTime;
	}

	public void setGradeTime(LocalDateTime gradeTime) {
		this.gradeTime = gradeTime;
	}

	
	public TrueFalse getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(TrueFalse tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

}
