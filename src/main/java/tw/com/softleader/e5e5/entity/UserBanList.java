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

/**
 * UserBanList generated by hbm2java
 */
@Entity
@Table(name = "user_ban_list", schema = "dbo", catalog = "EEIT82DB")
public class UserBanList implements java.io.Serializable {

	private int id;
	private User userByUserAId;
	private User userByUserBId;

	public UserBanList() {
	}

	public UserBanList(int id) {
		this.id = id;
	}

	public UserBanList(int id, User userByUserAId, User userByUserBId) {
		this.id = id;
		this.userByUserAId = userByUserAId;
		this.userByUserBId = userByUserBId;
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
	@JoinColumn(name = "user_a_id")
	public User getUserByUserAId() {
		return this.userByUserAId;
	}

	public void setUserByUserAId(User userByUserAId) {
		this.userByUserAId = userByUserAId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_b_id")
	public User getUserByUserBId() {
		return this.userByUserBId;
	}

	public void setUserByUserBId(User userByUserBId) {
		this.userByUserBId = userByUserBId;
	}

}
