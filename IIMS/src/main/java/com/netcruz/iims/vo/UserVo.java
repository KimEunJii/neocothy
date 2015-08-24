package com.netcruz.iims.vo;

public class UserVo {
	String user_id;
	String pw;
	String name;
	String role;
	
	public String getId() {
		return user_id;
	}
	public void setId(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return pw;
	}
	public void setPassword(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserVo [id=" + user_id + ", password=" + pw + ", name=" + name
				+ ", role=" + role + "]";
	}
	
	
	
	
}
