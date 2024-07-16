package com.yhs.project.dto;


public class CartVO {
	private int cseq;
	private String id;
	private String image;
	private int bseq;
	private String title;
	private int quantity;
	private int price;
	private int totalPrice;
	
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void initTotal() {
		this.totalPrice = this.quantity*this.price;
	}
	@Override
	public String toString() {
		return "CartVO [cseq=" + cseq + ", id=" + id + ", image=" + image + ", bseq=" + bseq + ", title=" + title
				+ ", quantity=" + quantity + ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}
	
}
