package com.yhs.project.dto;

public class AQnaVO {
	private int aqseq; // 번호
	private String title; // 제목
	private String questions; // 질문
	private String answer; // 답변
	private String name; // 등록한사람(관리자)
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAqseq() {
		return aqseq;
	}
	public void setAqseq(int aqseq) {
		this.aqseq = aqseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQuestions() {
		return questions;
	}
	public void setQuestions(String questions) {
		this.questions = questions;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "AQnaVO [aqseq=" + aqseq + ", title=" + title + ", questions=" + questions + ", answer=" + answer
				+ ", name=" + name + "]";
	}
	
}
