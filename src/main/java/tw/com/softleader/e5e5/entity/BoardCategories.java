package tw.com.softleader.e5e5.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class BoardCategories {

	@Override
	public String toString() {
		return categoryId+","+name+","+dateCreated;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categradlegoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.util.Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(java.util.Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer	categoryId;
	private String name;
	private java.util.Date dateCreated;
}
