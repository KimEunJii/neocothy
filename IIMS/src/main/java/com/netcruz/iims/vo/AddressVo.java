package com.netcruz.iims.vo;

public class AddressVo {
	private int id;
	private String category;
	private String partner;
	private String pm;
	private String pm_phone;
	private String pm_email;
	private String task;
	private String equipment;
	private String engineer;
	private String engineer_phone;
	private String engineer_email;
	private String test_date;
	private String test_type;
	private String manager;
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
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getPm_phone() {
		return pm_phone;
	}
	public void setPm_phone(String pm_phone) {
		this.pm_phone = pm_phone;
	}
	public String getPm_email() {
		return pm_email;
	}
	public void setPm_email(String pm_email) {
		this.pm_email = pm_email;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getEngineer() {
		return engineer;
	}
	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}
	public String getEngineer_phone() {
		return engineer_phone;
	}
	public void setEngineer_phone(String engineer_phone) {
		this.engineer_phone = engineer_phone;
	}
	public String getEngineer_email() {
		return engineer_email;
	}
	public void setEngineer_email(String engineer_email) {
		this.engineer_email = engineer_email;
	}
	public String getTest_date() {
		return test_date;
	}
	public void setTest_date(String test_date) {
		this.test_date = test_date;
	}
	public String getTest_type() {
		return test_type;
	}
	public void setTest_type(String test_type) {
		this.test_type = test_type;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
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
		return "AddressVo [id=" + id + ", category=" + category + ", partner="
				+ partner + ", pm=" + pm + ", pm_phone=" + pm_phone
				+ ", pm_email=" + pm_email + ", task=" + task + ", equipment="
				+ equipment + ", engineer=" + engineer + ", engineer_phone="
				+ engineer_phone + ", engineer_email=" + engineer_email
				+ ", test_date=" + test_date + ", test_type=" + test_type
				+ ", manager=" + manager + ", note=" + note + ", user_id="
				+ user_id + "]";
	}
}
