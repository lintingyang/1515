package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class UserOwner {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer uOwnerId;
	private Integer userId;
	private Integer boardId;
	
	@Override
	public String toString() {
		return "UserOwner [uOwnerId=" + uOwnerId + ", userId=" + userId + ", boardId=" + boardId + "]";
	}
	public Integer getuOwnerId() {
		return uOwnerId;
	}
	public void setuOwnerId(Integer uOwnerId) {
		this.uOwnerId = uOwnerId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getBoardId() {
		return boardId;
	}
	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	
	
	
	
	
}
