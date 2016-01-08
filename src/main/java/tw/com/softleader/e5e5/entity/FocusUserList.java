package tw.com.softleader.e5e5.entity;
// Generated 2015/12/2 �U�� 09:36:37 by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.test.context.web.WebAppConfiguration;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.com.softleader.e5e5.common.entity.OurEntity;


@Entity
@Table(name = "focus_user_list", schema = "dbo", catalog = "EEIT82DB")
@WebAppConfiguration
public class FocusUserList extends OurEntity implements java.io.Serializable {

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_a_id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private User userAId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_b_id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private User userBId;

	public FocusUserList() {
	}

	public FocusUserList(int id) {
		this.id = id;
	}

	public FocusUserList(int id, User userByUserAId, User userByUserBId) {
		this.id = id;
		this.userAId = userByUserAId;
		this.userBId = userByUserBId;
	}
	
	
	

	@Override
	public String toString() {
		return "FocusUserList [id=" + id + ", userByUserAId=" + userAId.getId() + ", userByUserBId=" + userBId.getId()
				+ "]";
	}

	public User getUserAId() {
		return userAId;
	}

	public void setUserAId(User userAId) {
		this.userAId = userAId;
	}

	public User getUserBId() {
		return userBId;
	}

	public void setUserBId(User userBId) {
		this.userBId = userBId;
	}





}
