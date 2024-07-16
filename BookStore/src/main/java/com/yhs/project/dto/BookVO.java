package com.yhs.project.dto;

public class BookVO {
    private int bseq; //책번호
    private String title; //제목
    private String author; //저자
    private String pub; //출판사
    private String pub_date; // 출간일
    private String info; // 책정보
    private String image; // 이미지
    private int price; // 가격
    private String cate1; // 대분류
    private String cate2; // 소분류
    private int replyCount; // 댓글 개수
    private double rating; // 댓글 평점
    
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPub() {
		return pub;
	}
	public void setPub(String pub) {
		this.pub = pub;
	}
	public String getPub_date() {
		return pub_date;
	}
	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "BookVO [bseq=" + bseq + ", title=" + title + ", author=" + author + ", pub=" + pub + ", pub_date="
				+ pub_date + ", info=" + info + ", image=" + image + ", price=" + price + ", cate1=" + cate1
				+ ", cate2=" + cate2 + ", replyCount=" + replyCount + ", rating=" + rating + "]";
	}
    
}
