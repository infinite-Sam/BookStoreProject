package com.yhs.project.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhs.project.book.BookService;
import com.yhs.project.dao.BookDAO;
import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.utils.Criteria;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bd;

	@Override
	public BookVO getBook(int bseq) {
		return bd.getBook(bseq);
	}
	
	@Override
	public int countBookListCate1(String cate1) {
		return bd.countBookListCate1(cate1);
	}

	@Override
	public List<BookVO> getListWithPagingCate1(Criteria cri, String cate1) {
		return bd.getListWithPagingCate1(cri, cate1);
	}
	
	@Override
	public int countBookListCate2(String cate1, String cate2) {
		return bd.countBookListCate2(cate1, cate2);
	}

	@Override
	public List<BookVO> getListWithPagingCate2(Criteria cri, String cate1, String cate2) {
		return bd.getListWithPagingCate2(cri, cate1, cate2);
	}
	
	@Override
	public void insertBook(BookVO bv) {
		bd.insertBook(bv);
	}

	@Override
	public void updateBook(BookVO bv) {
		bd.updateBook(bv);
	}

	@Override
	public void deleteBook(int bseq) {
		bd.deleteBook(bseq);
	}

	@Override
	public List<BookVO> searchList(Criteria cri) {
		return bd.searchList(cri);
	}

	@Override
	public int countSearch(Criteria cri) {
		return bd.countSearch(cri);
	}

	// 댓글목록
	@Override
	public List<ReplyVO> listReply(int bseq) {
		return bd.listReply(bseq);
	}
	// 댓글개수
	@Override
	public int countReply(int bseq) {
		return bd.countReply(bseq);
	}
	// 댓글평점
	@Override
	public double avgReply(int bseq) {
		return bd.avgReply(bseq);
	}
	// 댓글 개수 업데이트
	@Override
	public void updateReplyCount(int bseq) {
		bd.updateReplyCount(bseq);
	}
	// 댓글 평점 업데이트
	@Override
	public void updateReplyRating(int bseq) {
		bd.updateReplyRating(bseq);
	}
	// 베스트셀러 목록 조회
	@Override
	public List<BookVO> bestSeller() {
		return bd.bestSeller();
	}

	// 메인베스트셀러 목록
	@Override
	public List<BookVO> bookCateB() {
		return bd.bookCateB();
	}
	
	// 국내도서 목록
	@Override
	public List<BookVO> bookCateD() {
		return bd.bookCateD();
	}

	@Override
	public List<BookVO> bookCateF() {
		return bd.bookCateF();
	}
}
