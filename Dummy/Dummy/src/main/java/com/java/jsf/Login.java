package com.java.jsf;

public class Login {

	private int authId;
	private String uhid;
	private String userName;
	private String passWord;
	private String email;
	public int getAuthId() {
		return authId;
	}
	public void setAuthId(int authId) {
		this.authId = authId;
	}
	public String getUhid() {
		return uhid;
	}
	public void setUhid(String uhid) {
		this.uhid = uhid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Login [authId=" + authId + ", uhid=" + uhid + ", userName=" + userName + ", passWord=" + passWord
				+ ", email=" + email + "]";
	}
	public Login(int authId, String uhid, String userName, String passWord, String email) {
		super();
		this.authId = authId;
		this.uhid = uhid;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
	}
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
