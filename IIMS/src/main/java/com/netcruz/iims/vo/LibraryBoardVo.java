package com.netcruz.iims.vo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class LibraryBoardVo {
	
	private int id;
	private String regDate;
	private String category;
	private String title;
	private String contents;
	private String note;
	private String userId;
	private String file;
	private CommonsMultipartFile fileData;
	
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	@Override
	public String toString() {
		return "LibraryBoardVo [id=" + id + ", regDate=" + regDate
				+ ", category=" + category + ", title=" + title + ", contents="
				+ contents + ", note=" + note + ", userId=" + userId
				+ ", file=" + file + ", fileData=" + fileData + "]";
	}
	
	
	
}
