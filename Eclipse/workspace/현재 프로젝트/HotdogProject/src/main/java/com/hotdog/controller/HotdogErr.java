package com.hotdog.controller;

public class HotdogErr extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
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
	
	public HotdogErr(String title, String msg) {
		this.title = title;
		this.msg = msg;
	}
}
