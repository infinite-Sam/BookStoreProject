package com.yhs.project.dto;

public class QnaVO {
	private int qseq; // 질문번호
	private String title; // 제목
	private String content; // 내용
	private String reply; // 답변
	private String id; // 등록한사람(회원)
	private String rep; // 답변여부
	private String indate; // 등록일
	
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "QnaVO [qseq=" + qseq + ", title=" + title + ", content=" + content + ", reply=" + reply + ", id=" + id
				+ ", rep=" + rep + ", indate=" + indate + "]";
	}
}
