package com.yhs.project.dto;

public class NoticeVO {
	private int nseq; // 공지번호
	private String title; // 제목
	private String content; // 내용
	private String name; // 등록한사람(관리자)
	private String indate; // 등록일
	
	public int getNseq() {
		return nseq;
	}
	public void setNseq(int nseq) {
		this.nseq = nseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "NoticeVO [content=" + content + ", indate=" + indate + ", name=" + name + ", nseq=" + nseq + ", title="
				+ title + "]";
	}
}
