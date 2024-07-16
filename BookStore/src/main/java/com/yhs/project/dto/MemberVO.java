package com.yhs.project.dto;

public class MemberVO {

	private String id;
	private String pwd;
	private String name;
	private String email;
	private String zipnum;
	private String addr;
	private String phone;
	private String type;

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getZipnum() {
		return zipnum;
	}
	
	public void setZipnum(String zipnum) {
		this.zipnum = zipnum;
	}
	
	public String getAddress() {
		return addr;
	}
	
	public void setAddress(String address) {
		this.addr = address;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", zipnum=" + zipnum
				+ ", addr=" + addr + ", phone=" + phone + ", type=" + type + "]";
	}



}
