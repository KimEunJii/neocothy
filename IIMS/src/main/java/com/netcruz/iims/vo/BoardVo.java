package com.netcruz.iims.vo;

public class BoardVo {
	private long no;
	private String title;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", title=" + title + "]" + "<br>";
	}

}
