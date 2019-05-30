package com.hotdog.vo;

public class Temp {
	String title;
	String msg;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public Temp(String title, String msg) {
		this.title = title;
		this.msg = msg;
	}
}
