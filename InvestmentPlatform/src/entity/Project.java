package entity;

import java.sql.Date;

public class Project {
	
	private String projectname = "";
	private String username = "";
	private String village = "";
	private String address = "";
	private String realname = "";
	private String tel = "";
	private String state = "";
	private Date changeDate = null;

	public Project() {}

	public Project(String projectname) {
		this.projectname = projectname;
	}
	
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	
	public String getProjectname() {
		return projectname;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setVillage(String village) {
		this.village = village;
	}
	
	public String getVillage() {
		return village;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setRealname(String realname) {
		this.realname = realname;
	}
	
	public String getRealname() {
		return realname;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getState() {
		return state;
	}
	
	public void setDate(Date changeDate) {
		this.changeDate = changeDate;
	}
	
	public Date getDate() {
		return changeDate;
	}
}
