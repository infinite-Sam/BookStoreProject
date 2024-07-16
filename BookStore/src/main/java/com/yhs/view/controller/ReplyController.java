package com.yhs.view.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhs.project.dto.MemberVO;
import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.reply.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService rs;

	// 댓글 상세보기
	@GetMapping(value="getReply")
	public String getReply(OrderVO ov, ReplyVO rv, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
		OrderVO getOrder = rs.getOrder(ov.getOseq());
		model.addAttribute("getOrder", getOrder);
		ReplyVO reply = rs.getReply(rv.getOseq());
		model.addAttribute("getReply", reply);
		}
		return "book/getReply";
	}
	
	// 댓글 입력창 이동
	@GetMapping(value="insertReplyForm")
	public String insertReplyForm(OrderVO vo, HttpSession session, Model model) {
		OrderVO getOrder = rs.getOrder(vo.getOseq());
		model.addAttribute("getOrder", getOrder);
			return "book/insertReply";
	}
	// 댓글 입력
	@PostMapping(value="insertReply")
	public String insertReply(ReplyVO rv, HttpSession session) {
			rs.insertReply(rv);
			return "redirect:getReply?oseq="+rv.getOseq();
	}
	// 댓글 수정 화면
	@GetMapping(value="updateReplyForm")
	public String updateReplyForm(OrderVO ov, ReplyVO rv, HttpSession session, Model model) {
		OrderVO getOrder = rs.getOrder(ov.getOseq());
		model.addAttribute("getOrder", getOrder);
		ReplyVO reply = rs.getReply(rv.getOseq());
		model.addAttribute("updateReply", reply);
		return "book/updateReply";
	}
	// 댓글 수정
	@PostMapping(value="updateReply")
	public String updateReply(OrderVO ov, ReplyVO rv, HttpSession session) {
			rv.setOseq(rv.getOseq());
			rs.updateReply(rv);
			return "redirect:getReply?oseq="+rv.getOseq(); // 작성완료후 댓글 상세보기로 이동
	}
	// 댓글 삭제 기능
	@RequestMapping(value = "deleteReply")
	public String deleteReply(ReplyVO rv, HttpServletRequest request) {
		rs.deleteReply(rv.getRseq());
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:"+ referer; // 이전 페이지로 리다이렉트
	}
	
}
