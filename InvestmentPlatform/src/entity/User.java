package entity;

import java.sql.*;

public class User {
	
	private String username = "";
	private String password = "";
	private String usertype = "";
	private String company = "";
	private String barCode = "";
	private String address = "";
	private String realname = "";
	private String tel = "";
	private String asset = "";
	private String state = "";
	private Date registerdate = null;
	
	public User() {}
	
	public User(String username) {
		this.username = username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	public String getUsertype() {
		return usertype;
	}
	
	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}
	
	public String getBarCode() {
		return barCode;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getTel() {
		return tel;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
	
	public String getRealname() {
		return realname;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getCompany() {
		return company;
	}
	
	public void setAsset(String asset) {
		this.asset = asset;
	}
	
	public String getAsset() {
		return asset;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getState() {
		return state;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}
	
	public Date getRegisterdate() {
		return registerdate;
	}
}
