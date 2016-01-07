package tw.com.softleader.e5e5.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import tw.com.softleader.e5e5.common.entity.OurEntity;

@Entity
@Table(name = "product_picture", schema = "dbo", catalog = "EEIT82DB")
public class ProductPicture extends OurEntity implements java.io.Serializable {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", referencedColumnName="id")
	private Product product;
	
	@Column(name = "picture")
	private String picture;


	public ProductPicture() {
	}


	@Override
	public String toString() {
		return "ProductPicture [id=" + id + ", picture=" + picture + "]";
	}


	
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
