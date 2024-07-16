package com.yhs.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.yhs.project.dto.NoticeVO;
import com.yhs.project.notice.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService ns;

	// 공지사항 목록 조회
	@GetMapping(value="notice_list")
	public String noticeList(HttpSession session, Model model) {
		System.out.println("공지사항 목록 조회");
		List<NoticeVO> noticeList = ns.listNotice("관리자");
		model.addAttribute("noticeList", noticeList);

		return "service/noticeList";
	}

	// 공지사항 상세보기
	@GetMapping(value="notice_view")
	public String qnaView(NoticeVO nv, HttpSession session, Model model) {
		System.out.println("공지사항 상세보기");
		NoticeVO notice = ns.getNotice(nv.getNseq());
		model.addAttribute("noticeVO", notice);
		return "service/noticeView";
	}
	
}
