package com.netcruz.iims.vo;

public class UserIpVo {

	int id;
	String host_ip;
	String host_name;
	String reg_date;
	String user_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHost_ip() {
		return host_ip;
	}
	public void setHost_ip(String host_ip) {
		this.host_ip = host_ip;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "UserIpVo [id=" + id + ", host_ip=" + host_ip + ", host_name="
				+ host_name + ", reg_date=" + reg_date + ", user_id=" + user_id
				+ "]";
	}
	
	
}
