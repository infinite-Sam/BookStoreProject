package com.yhs.project.reply;

import java.util.List;

import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;

public interface ReplyService {
	// 댓글등록
	public void insertReply(ReplyVO rv);
	public OrderVO getOrder(int oseq);
	// 댓글 조회
	public ReplyVO getReply(int oseq);
	// 댓글 수정
	public void updateReply(ReplyVO rv);
	// 댓글삭제
	public void deleteReply(int rseq);
	
}
