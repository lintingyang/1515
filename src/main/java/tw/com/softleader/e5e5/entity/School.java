package tw.com.softleader.e5e5.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="School")
public class School implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int schoolId;
	private Character mailCheck;
	private String area;
	private String schoolName;
	private Integer userId;

	public School() {
	}

	public School(int schoolId) {
		this.schoolId = schoolId;
	}

	public School(int schoolId, Character mailCheck, String area, String schoolName, Integer userId) {
		this.schoolId = schoolId;
		this.mailCheck = mailCheck;
		this.area = area;
		this.schoolName = schoolName;
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "School [schoolId=" + schoolId + ", mailCheck=" + mailCheck + ", area=" + area + ", schoolName="
				+ schoolName + ", userId=" + userId + "]";
	}

	public int getSchoolId() {
		return this.schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public Character getMailCheck() {
		return this.mailCheck;
	}

	public void setMailCheck(Character mailCheck) {
		this.mailCheck = mailCheck;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getSchoolName() {
		return this.schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
