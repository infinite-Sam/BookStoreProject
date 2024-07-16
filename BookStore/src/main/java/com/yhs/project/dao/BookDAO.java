package com.yhs.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.utils.Criteria;

@Repository
public class BookDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public BookVO getBook(int bseq) {
		return sst.selectOne("BookDAO.getBook", bseq);
	}
	
	public int countBookListCate1(String cate1) {
		return sst.selectOne("BookDAO.countBookListCate1", cate1);
	}
	
	public List<BookVO> getListWithPagingCate1(Criteria cri, String cate1) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
		map.put("cate1", cate1);
		return sst.selectList("BookDAO.listWithPagingCate1", map);
	}
	
	public int countBookListCate2(String cate1, String cate2) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		return sst.selectOne("BookDAO.countBookListCate2", map);
	}
	
	public List<BookVO> getListWithPagingCate2(Criteria cri, String cate1, String cate2) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", cri);
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		return sst.selectList("BookDAO.listWithPagingCate2", map);
	}
	
	public void insertBook(BookVO bv) {
		
		sst.insert("BookDAO.insertBook", bv);
	}
	
	public void updateBook(BookVO pv) {
		
		sst.update("BookDAO.updateBook", pv);
	}
	
	public void deleteBook(int bseq) {
		sst.delete("BookDAO.deleteBook", bseq);
	}
	
	// 검색
	public List<BookVO> searchList(Criteria cri) {
		return sst.selectList("BookDAO.searchList", cri);
	};
	
	// 검색 목록 개수
	public int countSearch(Criteria cri) {
		return sst.selectOne("BookDAO.countSearch", cri);
	};
	
	// 댓글 목록
	public List<ReplyVO> listReply(int bseq){
		return sst.selectList("BookDAO.listReply", bseq);
	}
	// 댓글 개수
	public int countReply(int bseq){
		return sst.selectOne("BookDAO.countReply", bseq);
	}
	// 댓글평점
	public double avgReply(int bseq) {
		return sst.selectOne("BookDAO.avgReply", bseq);
	}
	
	// 댓글 수 업데이트
	public void updateReplyCount(int bseq) {
		sst.update("BookDAO.updateReplyCount", bseq);
	}
	
	// 댓글 평점 업데이트
		public void updateReplyRating(int bseq) {
			sst.update("BookDAO.updateReplyRating", bseq);
		}
	
	// 베스트셀러 목록
	public List<BookVO> bestSeller(){
		return sst.selectList("BookDAO.bestSeller");
	}
	// 베스트셀러 목록
	public List<BookVO> bookCateB(){
		return sst.selectList("BookDAO.bookCateB");
	}
	// 국내도서 목록
	public List<BookVO> bookCateD(){
		return sst.selectList("BookDAO.bookCateD");
	}
	// 외국도서 목록
	public List<BookVO> bookCateF(){
		return sst.selectList("BookDAO.bookCateF");
	}
}
