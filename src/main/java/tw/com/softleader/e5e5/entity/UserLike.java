package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.test.context.web.WebAppConfiguration;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.common.entity.OurEntity;

@Entity
@Table(name = "user_like", schema = "dbo", catalog = "EEIT82DB")
@WebAppConfiguration
public class UserLike  extends OurEntity implements java.io.Serializable{

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id",referencedColumnName="id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private User userId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Product_category_id",referencedColumnName="id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private ProductCategory productCategoryId;

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public ProductCategory getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(ProductCategory productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	
	
	
	
	
}
