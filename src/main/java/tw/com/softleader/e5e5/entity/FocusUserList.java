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
	private User UserAId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_b_id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private User UserBId;

	public FocusUserList() {
	}

	public FocusUserList(int id) {
		this.id = id;
	}

	public FocusUserList(int id, User userByUserAId, User userByUserBId) {
		this.id = id;
		this.UserAId = userByUserAId;
		this.UserBId = userByUserBId;
	}
	
	
	

	@Override
	public String toString() {
		return "FocusUserList [id=" + id + ", userByUserAId=" + UserAId.getId() + ", userByUserBId=" + UserBId.getId()
				+ "]";
	}

	public User getUserAId() {
		return UserAId;
	}

	public void setUserAId(User userAId) {
		UserAId = userAId;
	}

	public User getUserBId() {
		return UserBId;
	}

	public void setUserBId(User userBId) {
		UserBId = userBId;
	}





}
