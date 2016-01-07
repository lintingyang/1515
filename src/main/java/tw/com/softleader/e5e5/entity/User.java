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

import org.springframework.test.context.web.WebAppConfiguration;

import tw.com.softleader.e5e5.entity.enums.Role;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;


import tw.com.softleader.e5e5.common.entity.OurEntity;

@Entity
@Table(name = "[user]")
@WebAppConfiguration
public class User extends OurEntity implements java.io.Serializable {

	@Column(name = "password", length = 20)
	private String password;
	
	@Column(name = "name", length = 30)
	private String name;
	
	@Column(name = "nickname", length = 30)
	private String nickname;
	
	@Column(name = "account", length = 25)
	private String account;
	
	@Column(name = "age")
	private Integer age;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "sex", length = 10)
	private Sex sex;
	
	@Column(name = "birthday", length = 23)
	private LocalDateTime birthday;
	
	@Column(name = "address", length = 50)
	private String address;
	
	@Column(name = "phone", length = 20)
	private String phone;
	
	@Column(name = "cellphone", length = 30)
	private String cellphone;
	
	@Column(name = "email", length = 50)
	private String email;
	
	@Column(name = "picture")
	private String picture;
	
	@Column(name = "school_email", length = 50)
	private String schoolEmail;

	@Column(name = "focus_item_list", length = 30)
	private String focusItemList;

	@Column(name = "ecoin")
	private Integer ecoin;

	@Column(name = "online_datetime")
	private Integer onlineDatetime;
	
	@Column(name="school_name")
	private String schoolName;
	
	@Column(name="subject")
	private String subject;

	@Enumerated(EnumType.STRING)
	@Column(name = "email_check", length = 10)
	private TrueFalse emailCheck;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "isolated", length = 10)
	private TrueFalse isolated;	
	
	@Enumerated(EnumType.STRING)
	@Column(name = "role", length = 10)
	private Role role;

	

	public User() {
	}

	public User(int id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", account="
				+ account + ", age=" + age + ", birthday=" + birthday + ", address=" + address
				+ ", phone=" + phone + ", cellphone=" + cellphone + ", email=" + email + ", picture=" + picture
				+ ", schoolEmail=" + schoolEmail + ", focusItemList=" + focusItemList + ", onlineDatetime=" + onlineDatetime +", schoolName=" +schoolName +"]";
	}

	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	

	public Sex getSex() {
		return this.sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public LocalDateTime getBirthday() {
		return this.birthday;
	}

	public void setBirthday(LocalDateTime birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCellphone() {
		return this.cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getSchoolEmail() {
		return this.schoolEmail;
	}

	public void setSchoolEmail(String schoolEmail) {
		this.schoolEmail = schoolEmail;
	}

	
	public String getFocusItemList() {
		return this.focusItemList;
	}

	public void setFocusItemList(String focusItemList) {
		this.focusItemList = focusItemList;
	}

	
	public Integer getEcoin() {
		return this.ecoin;
	}

	public void setEcoin(Integer ecoin) {
		this.ecoin = ecoin;
	}


	public Integer getOnlineDatetime() {
		return this.onlineDatetime;
	}

	public void setOnlineDatetime(Integer onlineDatetime) {
		this.onlineDatetime = onlineDatetime;
	}
	

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public TrueFalse getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(TrueFalse emailCheck) {
		this.emailCheck = emailCheck;
	}
	
	public TrueFalse getIsolated() {
		return isolated;
	}

	public void setIsolated(TrueFalse isolated) {
		this.isolated = isolated;
	}

}
