package com.yhs.project.dto;


public class OrderVO {
	private int oseq; // 주문번호
	private String id; // 주문한사람id
	private String indate; // 주문일
	private String name; // 주문한 사람 이름
	private String zipnum; // 우편번호
	private String addr; // 주소
	private String phone; // 폰번호
	private String image; // 주문도서 이미지
	private int bseq; // 주문도서 번호
	private String title; // 제목
	private int quantity; // 수량
	private int price; // 가격
	private String result; // 주문결과
	
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZipnum() {
		return zipnum;
	}
	public void setZipnum(String zipnum) {
		this.zipnum = zipnum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "OrderVO [oseq=" + oseq + ", id=" + id + ", indate=" + indate + ", name=" + name + ", zipnum=" + zipnum
				+ ", addr=" + addr + ", phone=" + phone + ", image=" + image + ", bseq=" + bseq + ", title=" + title
				+ ", quantity=" + quantity + ", price=" + price + ", result=" + result + "]";
	}
	
}
