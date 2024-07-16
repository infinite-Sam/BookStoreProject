package com.yhs.project.utils;


public class Criteria {
    private int pageNum; // 현재페이지
    private int amount; // 하나의 페이지에 보여질 게시글 수
    private String keyword; // 검색어
    private String searchOption; // 검색 조건
    
    public Criteria() { // 기본 생성자
        this(1,8);
    }
    
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", searchOption="
				+ searchOption + "]";
	}
}
