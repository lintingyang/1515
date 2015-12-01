package tw.com.softleader.e5e5.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ReportVio generated by hbm2java
 */
@Entity
@Table(name = "reportVio", schema = "dbo", catalog = "EEIT82DB")
public class ReportVio implements java.io.Serializable {

	private int id;
	private String article;
	private Character isPassed;
	private Date time;
	private Integer reporterId;
	private Integer threadId;
	private Integer productId;
	private Integer adminId;

	public ReportVio() {
	}

	public ReportVio(int id) {
		this.id = id;
	}

	public ReportVio(int id, String article, Character isPassed, Date time, Integer reporterId,
			Integer threadId, Integer productId, Integer adminId) {
		this.id = id;
		this.article = article;
		this.isPassed = isPassed;
		this.time = time;
		this.reporterId = reporterId;
		this.threadId = threadId;
		this.productId = productId;
		this.adminId = adminId;
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

	@Column(name = "article", length = 200)
	public String getArticle() {
		return this.article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	@Column(name = "isPassed", length = 1)
	public Character getIsPassed() {
		return this.isPassed;
	}

	public void setIsPassed(Character isPassed) {
		this.isPassed = isPassed;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time", length = 23)
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "reporterId")
	public Integer getReporterId() {
		return this.reporterId;
	}

	public void setReporterId(Integer reporterId) {
		this.reporterId = reporterId;
	}

	@Column(name = "threadId")
	public Integer getThreadId() {
		return this.threadId;
	}

	public void setThreadId(Integer threadId) {
		this.threadId = threadId;
	}

	@Column(name = "productId")
	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@Column(name = "adminId")
	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	@Override
	public String toString() {
		return "[reportVio=" + id + " ," + article + ", " + isPassed + ", " + time + ", " +
				reporterId + "]";
	}
	
}
