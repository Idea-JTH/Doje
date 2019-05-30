package com.hotdog.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class UserVO {
	
	@NotNull
	@Pattern(regexp="^[a-zA-Z0-9]{4,20}$")
	private String id;
	
	@NotNull
	@Pattern(regexp="^[a-zA-Z0-9]{4,20}$")
	private String password;
	
	@NotNull
	@Email
	private String email;
	
	@NotNull
	@Pattern(regexp="^[\\wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$")
	private String nickname;
	
	@Pattern(regexp="/^\\d{2,3}\\d{3,4}\\d{4}$/")
	private String phonenumber;
	
	
	//getter & settter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	public String getPhonenumber() {
		return phonenumber;
	}	
}
