package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "product", schema = "dbo", catalog = "EEIT82DB")
public class Product implements java.io.Serializable {

	private int id;
	private Exchange exchange;
	private Product product;
	private ProductPicture productPicture;
	private User userByItemOwnerId;
	private User userByUserId;
	private String name;
	private String category;
	private byte[] video;
	private Date postTime;
	private Date deadline;
	private String location;
	private String tradeWay;
	private String wishItem;
	private Character postStatus;
	private Character tradeStatus;
	private Integer clickTimes;
	private Date tradeFinishedTime;
	private String grade;
	private Date gradeTime;
	private Set<Product> products = new HashSet<Product>(0);
	private Set<QuestionAndAnswer> questionAndAnswers = new HashSet<QuestionAndAnswer>(0);
	private Set<Report> reports = new HashSet<Report>(0);
	private Set<Exchange> exchangesForProductAId = new HashSet<Exchange>(0);
	private Set<Exchange> exchangesForProductBId = new HashSet<Exchange>(0);

	public Product() {
	}

	public Product(int id) {
		this.id = id;
	}

	public Product(int id, Exchange exchange, Product product, ProductPicture productPicture, User userByItemOwnerId,
			User userByUserId, String name, String category, byte[] video, Date postTime, Date deadline,
			String location, String tradeWay, String wishItem, Character postStatus, Character tradeStatus,
			Integer clickTimes, Date tradeFinishedTime, String grade, Date gradeTime, Set<Product> products,
			Set<QuestionAndAnswer> questionAndAnswers, Set<Report> reports, Set<Exchange> exchangesForProductAId,
			Set<Exchange> exchangesForProductBId) {
		this.id = id;
		this.exchange = exchange;
		this.product = product;
		this.productPicture = productPicture;
		this.userByItemOwnerId = userByItemOwnerId;
		this.userByUserId = userByUserId;
		this.name = name;
		this.category = category;
		this.video = video;
		this.postTime = postTime;
		this.deadline = deadline;
		this.location = location;
		this.tradeWay = tradeWay;
		this.wishItem = wishItem;
		this.postStatus = postStatus;
		this.tradeStatus = tradeStatus;
		this.clickTimes = clickTimes;
		this.tradeFinishedTime = tradeFinishedTime;
		this.grade = grade;
		this.gradeTime = gradeTime;
		this.products = products;
		this.questionAndAnswers = questionAndAnswers;
		this.reports = reports;
		this.exchangesForProductAId = exchangesForProductAId;
		this.exchangesForProductBId = exchangesForProductBId;
	}
	
	
	@Override
	public String toString() {
		return "[id=" + id + ", name=" + name + ", category=" + category + ", productPicture=" + productPicture
				+ ", video=" + video + ", userByUserId" + userByUserId + ", postTime=" + postTime + ", deadline="
				+ deadline + ", location=" + location + ", tradeWay=" + tradeWay + ", wishItem=" + wishItem
				+ ", postStatus=" + postStatus + ", tradeStatus=" + tradeStatus + ", clickTimes=" + clickTimes
				+ ", exchange=" + exchange + ", product=" + product + ", userByItemOwnerId=" + userByItemOwnerId
				+ ", tradeFinishedTime=" + tradeFinishedTime + ", grade=" + grade + ", gradeTime=" + gradeTime + "]";
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
	@JoinColumn(name = "exchange_id")
	public Exchange getExchange() {
		return this.exchange;
	}

	public void setExchange(Exchange exchange) {
		this.exchange = exchange;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "item_id")
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "picture_id")
	public ProductPicture getProductPicture() {
		return this.productPicture;
	}

	public void setProductPicture(ProductPicture productPicture) {
		this.productPicture = productPicture;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "item_owner_id")
	public User getUserByItemOwnerId() {
		return this.userByItemOwnerId;
	}

	public void setUserByItemOwnerId(User userByItemOwnerId) {
		this.userByItemOwnerId = userByItemOwnerId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUserByUserId() {
		return this.userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	@Column(name = "name", length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "category", length = 20)
	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "video")
	public byte[] getVideo() {
		return this.video;
	}

	public void setVideo(byte[] video) {
		this.video = video;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "post_time", length = 23)
	public Date getPostTime() {
		return this.postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "deadline", length = 23)
	public Date getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	@Column(name = "location", length = 50)
	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "trade_way", length = 20)
	public String getTradeWay() {
		return this.tradeWay;
	}

	public void setTradeWay(String tradeWay) {
		this.tradeWay = tradeWay;
	}

	@Column(name = "wish_item", length = 200)
	public String getWishItem() {
		return this.wishItem;
	}

	public void setWishItem(String wishItem) {
		this.wishItem = wishItem;
	}

	@Column(name = "post_status", length = 1)
	public Character getPostStatus() {
		return this.postStatus;
	}

	public void setPostStatus(Character postStatus) {
		this.postStatus = postStatus;
	}

	@Column(name = "trade_status", length = 1)
	public Character getTradeStatus() {
		return this.tradeStatus;
	}

	public void setTradeStatus(Character tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	@Column(name = "click_times")
	public Integer getClickTimes() {
		return this.clickTimes;
	}

	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "trade_finished_time", length = 23)
	public Date getTradeFinishedTime() {
		return this.tradeFinishedTime;
	}

	public void setTradeFinishedTime(Date tradeFinishedTime) {
		this.tradeFinishedTime = tradeFinishedTime;
	}

	@Column(name = "grade", length = 5)
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "grade_time", length = 23)
	public Date getGradeTime() {
		return this.gradeTime;
	}

	public void setGradeTime(Date gradeTime) {
		this.gradeTime = gradeTime;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<QuestionAndAnswer> getQuestionAndAnswers() {
		return this.questionAndAnswers;
	}

	public void setQuestionAndAnswers(Set<QuestionAndAnswer> questionAndAnswers) {
		this.questionAndAnswers = questionAndAnswers;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Report> getReports() {
		return this.reports;
	}

	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productByProductAId")
	public Set<Exchange> getExchangesForProductAId() {
		return this.exchangesForProductAId;
	}

	public void setExchangesForProductAId(Set<Exchange> exchangesForProductAId) {
		this.exchangesForProductAId = exchangesForProductAId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productByProductBId")
	public Set<Exchange> getExchangesForProductBId() {
		return this.exchangesForProductBId;
	}

	public void setExchangesForProductBId(Set<Exchange> exchangesForProductBId) {
		this.exchangesForProductBId = exchangesForProductBId;
	}

}
