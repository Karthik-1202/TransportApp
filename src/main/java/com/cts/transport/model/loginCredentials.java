package com.cts.transport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login_credentials")
public class loginCredentials {
	@Id
	@Column(name="user_id")
	private String userId;
	@Column(name="password")
	private String password;
	@Column(name="job_role")
	private String jobRole;
	
	
	public loginCredentials() {
		super();
		
	}
	
	public loginCredentials(String userId, String password, String jobRole) {
		super();
		this.userId = userId;
		this.password = password;
		this.jobRole = jobRole;
	
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getJobRole() {
		return jobRole;
	}
	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}
	

}
