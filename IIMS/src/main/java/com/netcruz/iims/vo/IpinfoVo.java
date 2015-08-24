package com.netcruz.iims.vo;



public class IpinfoVo {
	private int id;
	private String category;
	private String network;
	private String ip;
	private int mask;
	private String usages;
	private String equipment;
	private String model;
	private String used;
	private String os;
	private String use_dept;
	private String user;
	private String use_term;
	private String per_date;
	private String mody_date;
	private String note;
	private String user_id;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getNetwork() {
		return network;
	}
	public void setNetwork(String network) {
		this.network = network;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getMask() {
		return mask;
	}
	public void setMask(int mask) {
		this.mask = mask;
	}
	public String getUsages() {
		return usages;
	}
	public void setUsages(String usages) {
		this.usages = usages;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getUse_dept() {
		return use_dept;
	}
	public void setUse_dept(String use_dept) {
		this.use_dept = use_dept;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getUse_term() {
		return use_term;
	}
	public void setUse_term(String use_term) {
		this.use_term = use_term;
	}
	public String getPer_date() {
		return per_date;
	}
	public void setPer_date(String per_date) {
		this.per_date = per_date;
	}
	
	public String getMody_date() {
		return mody_date;
	}
	public void setMody_date(String mody_date) {
		this.mody_date = mody_date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "IpinfoVo [id=" + id + ", category=" + category + ", network="
				+ network + ", ip=" + ip + ", mask=" + mask + ", usages="
				+ usages + ", equipment=" + equipment + ", model=" + model
				+ ", used=" + used + ", os=" + os + ", use_dept=" + use_dept
				+ ", user=" + user + ", use_term=" + use_term + ", per_date="
				+ per_date + ", mody_date=" + mody_date + ", note=" + note
				+ ", user_id=" + user_id + "]";
	}

	
	
}
