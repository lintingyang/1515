package tw.com.softleader.e5e5.security.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.com.softleader.e5e5.common.entity.GenericEntity;

@Entity
@SuppressWarnings("serial")
@Table(name = "SEC_ROLE")
public class SecRole extends GenericEntity {

	@Column(name = "CODE")
	private String code;
	
	@Column(name = "NAME")
	private String name;

	@JsonIgnore
	@ManyToMany(mappedBy = "roles")
	private Set<SecUser> users;

	
	@Override
	public String toString() {
		return "SecRole [code=" + code + ", name=" + name + "]";
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<SecUser> getUsers() {
		return users;
	}

	public void setUsers(Set<SecUser> users) {
		this.users = users;
	}


	
	
	
}
