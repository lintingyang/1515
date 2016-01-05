package tw.com.softleader.e5e5.entity;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import tw.com.softleader.e5e5.entity.enums.Role;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;


import tw.com.softleader.e5e5.common.entity.OurEntity;

@Entity
@Table(name = "[user]")
public class User extends OurEntity implements java.io.Serializable {

//	private int id;
	private String password;
	private String name;
	private String nickname;
	private String account;
	private Integer age;
//	private Sex sex;
	private LocalDateTime birthday;
	private String address;
	private String phone;
	private String cellphone;
	private String email;
	private String picture;
	private String schoolEmail;
	private String focusItemList;
	private Integer ecoin;
	private Integer onlineDatetime;
	private String schoolName;
//	private TrueFalse emailCheck;
//	private TrueFalse isolated;
//	private Role role;


	public User() {
	}

	public User(int id) {
		this.id = id;
	}


//	@Override
//	public String toString() {
//		return "User [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", account="
//				+ account + ", age=" + age + ", sex=" + sex + ", birthday=" + birthday + ", address=" + address
//				+ ", phone=" + phone + ", cellphone=" + cellphone + ", email=" + email + ", picture=" + picture
//				+ ", schoolEmail=" + schoolEmail + ", focusItemList=" + focusItemList + ", gameScore=" + gameScore
//				+ ", onlineDatetime=" + onlineDatetime +", schoolName=" +schoolName+", emailCheck=" + emailCheck + ", isolated"+ isolated +"]";
//	}

	
//
//	@Enumerated(EnumType.STRING)
//	@Column(name = "role", length = 10)
//	public Role getRole() {
//		return role;
//	}
//
//
//	public void setRole(Role role) {
//		this.role = role;
//	}
	
	@Column(name = "password", length = 20)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "name", length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "nickname", length = 30)
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "account", length = 25)
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	
//	@Enumerated(EnumType.STRING)
//	@Column(name = "sex", length = 10)
//	public Sex getSex() {
//		return this.sex;
//	}
//
//	public void setSex(Sex sex) {
//		this.sex = sex;
//	}

	@Column(name = "birthday", length = 23)
	public LocalDateTime getBirthday() {
		return this.birthday;
	}

	public void setBirthday(LocalDateTime birthday) {
		this.birthday = birthday;
	}

	@Column(name = "address", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone", length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "cellphone", length = 30)
	public String getCellphone() {
		return this.cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "picture")
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "school_email", length = 50)
	public String getSchoolEmail() {
		return this.schoolEmail;
	}

	public void setSchoolEmail(String schoolEmail) {
		this.schoolEmail = schoolEmail;
	}

	@Column(name = "focus_item_list", length = 30)
	public String getFocusItemList() {
		return this.focusItemList;
	}

	public void setFocusItemList(String focusItemList) {
		this.focusItemList = focusItemList;
	}

	@Column(name = "ecoin")
	public Integer getEcoin() {
		return this.ecoin;
	}

	public void setEcoin(Integer ecoin) {
		this.ecoin = ecoin;
	}

	@Column(name = "online_datetime")
	public Integer getOnlineDatetime() {
		return this.onlineDatetime;
	}

	public void setOnlineDatetime(Integer onlineDatetime) {
		this.onlineDatetime = onlineDatetime;
	}

	@Column(name="school_name")
	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
//	@Enumerated(EnumType.STRING)
//	@Column(name = "email_check", length = 10)
//	public TrueFalse getEmailCheck() {
//		return emailCheck;
//	}
//
//	public void setEmailCheck(TrueFalse emailCheck) {
//		this.emailCheck = emailCheck;
//	}
	
//	@Enumerated(EnumType.STRING)
//	@Column(name = "isolated", length = 10)
//	public TrueFalse getIsolated() {
//		return isolated;
//	}
//
//	public void setIsolated(TrueFalse isolated) {
//		this.isolated = isolated;
//	}

}
