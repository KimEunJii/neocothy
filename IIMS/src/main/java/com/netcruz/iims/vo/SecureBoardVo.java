package com.netcruz.iims.vo;

public class SecureBoardVo {
	
	private int id;
	private String regDate;
	private String category;
	private String title;
	private String contents;
	private String note;
	private String userId;
	
	
	
	public SecureBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "SecureBoardVo [id=" + id + ", regDate=" + regDate
				+ ", category=" + category + ", title=" + title + ", contents="
				+ contents + ", note=" + note + ", userId=" + userId + "]";
	}
	
}
