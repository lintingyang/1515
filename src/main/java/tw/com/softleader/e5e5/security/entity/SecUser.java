package tw.com.softleader.e5e5.security.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import tw.com.softleader.e5e5.common.entity.GenericEntity;

@SuppressWarnings("serial")
@Table(name = "SEC_USER")
public class SecUser extends GenericEntity {
	
	@Column(name = "USERNAME")
	private String username;

	@Column(name = "PASSWORD")
	private String password;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
	@JoinTable(name = "USER_ROLE", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
	private Set<SecRole> roles;
	

	@Override
	public String toString() {
		return "SecUser [username=" + username + ", password=" + password + ", roles=" + roles + "]";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<SecRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<SecRole> roles) {
		this.roles = roles;
	}
	
	
	
}
