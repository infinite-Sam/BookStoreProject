package com.yhs.project.book;

import java.util.List;

//import com.yhs.project.dto.BookReviewVO;
import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.utils.Criteria;

public interface BookService {

	// 댓글
//	public List<BookReviewVO> listReview(int pseq);	
//	public void insertReview(BookReviewVO vo);
//	public void updateReview(BookReviewVO vo);
//	public void deleteReview(int p_reseq);
//	public int countReviewList(int pseq);
	
	BookVO getBook(int bseq);
	public int countBookListCate1(String cate1);
	List<BookVO> getListWithPagingCate1(Criteria cri, String cate1);
	public int countBookListCate2(String cate1, String cate2);
	List<BookVO> getListWithPagingCate2(Criteria cri, String cate1, String cate2);
	void insertBook(BookVO bv);
	void updateBook(BookVO bv);
	void deleteBook(int bseq);
	//  게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<BookVO> searchList(Criteria cri);
	public int countSearch(Criteria cri);
	// 댓글 목록
	public List<ReplyVO> listReply(int bseq);
	// 댓글 개수
	public int countReply(int bseq);
	//댓글 평점
	public double avgReply(int bseq);
	// 댓글 개수 업데이트
	public void updateReplyCount(int bseq);
	// 댓글 평점 업데이트
	public void updateReplyRating(int bseq);
	// 베스트셀러 목록
	public List<BookVO> bestSeller();
	// 메인베스트셀러 목록
		public List<BookVO> bookCateB();
	// 국내도서 목록
	public List<BookVO> bookCateD();
	// 외국도서 목록
	public List<BookVO> bookCateF();
}