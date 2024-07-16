package com.yhs.project.dto;

public class ReplyVO {
	private int rseq; // 댓글번호
	private int bseq; // 댓글작성한 책번호
	private int oseq; // 댓글작성한 주문번호
	private String id; // 댓글작성한 사람 id
	private String indate; // 작성일
	private String content; // 내용
	private double rating; // 점수
	
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "ReplyVO [rseq=" + rseq + ", bseq=" + bseq + ", oseq=" + oseq + ", id=" + id + ", indate=" + indate
				+ ", content=" + content + ", rating=" + rating + "]";
	}
}
