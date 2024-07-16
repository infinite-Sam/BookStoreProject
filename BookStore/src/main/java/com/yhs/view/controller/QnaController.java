package com.yhs.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhs.project.dto.AQnaVO;
import com.yhs.project.dto.MemberVO;
import com.yhs.project.dto.QnaVO;
import com.yhs.project.qna.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qs;

	// 내 질문 목록 조회
	@GetMapping(value="qna_list")
	public String qnaList(HttpSession session, Model model) {
		System.out.println("qna목록 조회");
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) { // 로그인이 되어있지 않다면
			List<AQnaVO> aQnaList = qs.listAQna("관리자");
			model.addAttribute("aQnaList", aQnaList);
			return "service/qnaList";
		} else {
			List<QnaVO> qnaList = qs.listQna(loginUser.getId());
			model.addAttribute("qnaList", qnaList);

			List<AQnaVO> aQnaList = qs.listAQna("관리자");
			model.addAttribute("aQnaList", aQnaList);

			return "service/qnaList";
		}
	}

	// qna 작성 화면
	@GetMapping(value="qna_write_form")
	public String qnaWriteView(HttpSession session) {
		System.out.println("qna작성");
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			return "service/qnaWrite";	// 로그인이 되어있다면 qna작성 화면이동
		}
	}

	// qna 작성기능
	@PostMapping(value="qna_write")
	public String qnaWriteAction(QnaVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			qs.insertQna(vo);
			return "redirect:qna_list"; // 작성완료후  qna 목록으로 이동
		}
	}

	// qna상세보기
	@GetMapping(value="qna_view")
	public String qnaView(QnaVO vo, AQnaVO aqv, HttpSession session, Model model) {
		System.out.println("qna상세보기");
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			QnaVO qna = qs.getQna(vo.getQseq());
			AQnaVO aqna = qs.getAQna(aqv.getAqseq());
			model.addAttribute("qnaVO", qna);
			model.addAttribute("aqnaVO", aqna);
			return "service/qnaView";
		}
	}

	// 질문 수정 화면
	@GetMapping(value="qna_update_form")
	public String aqnaUpdateView(QnaVO vo, HttpSession session, Model model) {
		QnaVO qna = qs.getQna(vo.getQseq());
		model.addAttribute("qna", qna);
		return "service/qnaUpdate";
	}
	
	// 질문 수정 기능
	@PostMapping(value="qna_update")
	public String aqnaUpdateAction(QnaVO vo, HttpSession session) {
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			vo.setId(loginUser.getId());
			qs.updateQna(vo);
			return "redirect:qna_view?qseq="+vo.getQseq(); // 작성완료후  공지사항 목록으로 이동
	}
	// 질문 삭제 기능
	@RequestMapping(value = "qna_delete")
	public String aqnaDelete(QnaVO vo) {
		qs.deleteQna(vo.getQseq());
		return "redirect:qna_list";
	}
	
	// aqna상세보기
	@GetMapping(value="aqna_view")
	public String aQnaView(AQnaVO aqv, HttpSession session, Model model) {
		System.out.println("자주하는질문 상세보기");
		AQnaVO aqna = qs.getAQna(aqv.getAqseq());
		model.addAttribute("aqnaVO", aqna);
		return "service/aQnaView";
	}

}
