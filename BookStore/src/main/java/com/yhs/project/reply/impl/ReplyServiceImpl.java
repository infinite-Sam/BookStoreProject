package com.yhs.project.reply.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhs.project.dao.ReplyDAO;
import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.reply.ReplyService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO rd;

	// 댓글등록
	@Override
	public void insertReply(ReplyVO rv) {
		rd.insertReply(rv);
	}
	@Override
	public OrderVO getOrder(int oseq) {
		return rd.getOrder(oseq);
	}
	// 댓글조회
	@Override
	public ReplyVO getReply(int oseq) {
		return rd.getReply(oseq);
	}

	// 댓글수정
	@Override
	public void updateReply(ReplyVO rv) {
		rd.updateReply(rv);
	}

	// 댓글삭제
	@Override
	public void deleteReply(int rseq) {
		rd.deleteReply(rseq);
	}
}
