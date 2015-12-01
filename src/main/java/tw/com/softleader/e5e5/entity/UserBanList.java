package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserBanList {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer bUserID;
	private Integer buserA;
	private Integer buserB;
	public Integer getbUserID() {
		return bUserID;
	}
	public void setbUserID(Integer bUserID) {
		this.bUserID = bUserID;
	}
	public Integer getBuserA() {
		return buserA;
	}
	public void setBuserA(Integer buserA) {
		this.buserA = buserA;
	}
	public Integer getBuserB() {
		return buserB;
	}
	public void setBuserB(Integer buserB) {
		this.buserB = buserB;
	}
	
	@Override
	public String toString() {
		return "userBanList [bUserID=" + bUserID + ", buserA=" + buserA + ", buserB=" + buserB + "]";
	}
	
	
	
	
}
