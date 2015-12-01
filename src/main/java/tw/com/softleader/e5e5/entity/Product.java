package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	private String productName;
	private String category;
	private Integer pictureId;
	private byte[] video;
	private int userId;
	private java.util.Date postTime;
	private java.util.Date deadline;
	private String location;
	private String tradeWay;
	private String wishItem;
	private boolean postStatus;
	private boolean tradeStatus;
	private Integer clickTimes;
	private Integer exchangeId;
	private Integer itemId;
	private Integer itemOwnerId;
	private java.util.Date tradeFinishedTime;
	private String grade;
	private java.util.Date gradeTime;

	@Override
	public String toString() {
		return "{productId=" + productId + ",productName=" + productName + ",category=" + category + ",pictureId="
				+ pictureId + ",video=" + video + ",userId=" + userId + ",postTime=" + postTime + ",deadline="
				+ deadline + ",location=" + location + ",tradeWay=" + tradeWay + ",wishItem=" + wishItem
				+ ",postStatus=" + postStatus + ",tradeStatus=" + tradeStatus + ",clickTimes=" + clickTimes
				+ ",exchangeId=" + exchangeId + ",itemId=" + itemId + ",itemOwnerId=" + itemOwnerId
				+ ",tradeFinishedTime=" + tradeFinishedTime + ",grade=" + grade + ",gradeTime=" + gradeTime + "}";
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getPictureId() {
		return pictureId;
	}

	public void setPictureId(Integer pictureId) {
		this.pictureId = pictureId;
	}

	public byte[] getVideo() {
		return video;
	}

	public void setVideo(byte[] video) {
		this.video = video;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public java.util.Date getPostTime() {
		return postTime;
	}

	public void setPostTime(java.util.Date postTime) {
		this.postTime = postTime;
	}

	public java.util.Date getDeadline() {
		return deadline;
	}

	public void setDeadline(java.util.Date deadline) {
		this.deadline = deadline;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTradeWay() {
		return tradeWay;
	}

	public void setTradeWay(String tradeWay) {
		this.tradeWay = tradeWay;
	}

	public String getWishItem() {
		return wishItem;
	}

	public void setWishItem(String wishItem) {
		this.wishItem = wishItem;
	}

	public boolean getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(boolean postStatus) {
		this.postStatus = postStatus;
	}

	public boolean getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(boolean tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	public Integer getClickTimes() {
		return clickTimes;
	}

	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}

	public Integer getExchangeId() {
		return exchangeId;
	}

	public void setExchangeId(Integer exchangeId) {
		this.exchangeId = exchangeId;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Integer getItemOwnerId() {
		return itemOwnerId;
	}

	public void setItemOwnerId(Integer itemOwnerId) {
		this.itemOwnerId = itemOwnerId;
	}

	public java.util.Date getTradeFinishedTime() {
		return tradeFinishedTime;
	}

	public void setTradeFinishedTime(java.util.Date tradeFinishedTime) {
		this.tradeFinishedTime = tradeFinishedTime;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public java.util.Date getGradeTime() {
		return gradeTime;
	}

	public void setGradeTime(java.util.Date gradeTime) {
		this.gradeTime = gradeTime;
	}

}
