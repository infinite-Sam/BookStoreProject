package com.yhs.project.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	// 댓글등록
	public void insertReply(ReplyVO rv) {
		sst.insert("ReplyDAO.insertReply", rv);
	}
	public OrderVO getOrder(int oseq) {
		return sst.selectOne("ReplyDAO.getOrder", oseq);
	}
	// 댓글 조회
	public ReplyVO getReply(int oseq) {
		return sst.selectOne("ReplyDAO.getReply", oseq);
	}
	// 댓글 수정
	public void updateReply(ReplyVO rv) {
		sst.update("ReplyDAO.updateReply", rv);
	}
	
	// 댓글삭제
	public void deleteReply(int rseq) {
		sst.delete("ReplyDAO.deleteReply", rseq);
	}
}
