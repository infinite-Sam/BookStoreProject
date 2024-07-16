package com.yhs.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.yhs.project.book.BookService;
import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.MemberVO;
import com.yhs.project.dto.AQnaVO;
import com.yhs.project.dto.NoticeVO;
import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.QnaVO;
import com.yhs.project.member.MemberService;
import com.yhs.project.notice.NoticeService;
import com.yhs.project.order.OrderService;
import com.yhs.project.qna.QnaService;
import com.yhs.project.utils.Criteria;
import com.yhs.project.utils.PageMaker;

@Controller
@SessionAttributes("adminUser")
public class AdminController {

	@Autowired 
	private BookService bs;
	@Autowired
	private OrderService os;
	@Autowired
	private NoticeService ns;
	@Autowired
	private QnaService qs;
	@Autowired
	private MemberService ms;

	// 관리자 회원관리
	@GetMapping(value="admin_member_list")
	public String memberList(MemberVO vo, Model model) {
		List<MemberVO> memberList = ms.listMember();
		model.addAttribute("memberList", memberList);
		return "admin/member/memberList";
	}
	
	// 관리자 회원삭제
	@RequestMapping(value = "admin_member_delete")
	public String memberDelete(MemberVO vo) {
		ms.deleteMember(vo.getId());
		return "redirect:admin_member_list";
	}
	
	// 자주묻는질문 상세보기
	@GetMapping(value="admin_aqna_view")
	public String aqnaView(AQnaVO vo, HttpSession session, Model model) {
		AQnaVO aqna = qs.getAQna(vo.getAqseq());
		model.addAttribute("aqnaVO", aqna);
		return "admin/service/aqnaView";
	}
	
	@GetMapping(value="admin_aqna_write_form")
	public String aqnaWriteView(HttpSession session) {
			return "admin/service/aqnaWrite";
	}
	
	@PostMapping(value="admin_aqna_write")
	public String aqnaWriteAction(AQnaVO vo, HttpSession session) {
			vo.setName("관리자");
			qs.insertAqna(vo);
			return "redirect:admin_member_qna";
	}
	
	// 자주묻는질문 수정 화면
	@GetMapping(value="admin_aqna_update_form")
	public String aqnaUpdateView(AQnaVO vo, HttpSession session, Model model) {
		AQnaVO aqna = qs.getAQna(vo.getAqseq());
		model.addAttribute("aqna", aqna);
		return "admin/service/aqnaUpdate";
	}
	
	// 자주묻는질문 수정 기능
	@PostMapping(value="admin_aqna_update")
	public String aqnaUpdateAction(AQnaVO vo, HttpSession session) {
			vo.setName("관리자");
			qs.updateAqna(vo);
			return "redirect:admin_aqna_view?aqseq="+vo.getAqseq(); // 작성완료후  공지사항 목록으로 이동
	}
	// 자주묻는질문 삭제 기능
	@RequestMapping(value = "admin_aqna_delete")
	public String aqnaDelete(AQnaVO vo) {
		qs.deleteAqna(vo.getAqseq());
		return "redirect:admin_member_qna";
	}
	
	// 회원질문 목록조회
	@RequestMapping(value="admin_member_qna")
	public String memberQnaList(QnaVO vo, Model model) {
		List<AQnaVO> aqnaList = qs.listAQna("관리자");
		model.addAttribute("aqnaList", aqnaList);
		
		List<QnaVO> memberQnaList = qs.listMemberQna();
		model.addAttribute("qnaList", memberQnaList);
		return "admin/member/qnaList";
	}
	
	// 질문 상세보기
	@GetMapping(value="admin_qna_view")
	public String qnaView(QnaVO vo, HttpSession session, Model model) {
		QnaVO qna = qs.getQna(vo.getQseq());
		model.addAttribute("qnaVO", qna);
		return "admin/member/qnaView";
	}
	
	@GetMapping(value="admin_qna_answer_form")
	public String qnaAnswerView(QnaVO vo, HttpSession session, Model model) {
			QnaVO qna = qs.getQna(vo.getQseq());
			model.addAttribute("qna", qna);
			return "admin/member/qnaAnswer";
	}
	
	@PostMapping(value="admin_qna_answer")
	public String qnaAnswerAction(QnaVO qv, Model model, HttpSession session) {
			qs.qnaAnswer(qv);
			model.addAttribute("qna", qs);
			return "redirect:admin_qna_view?qseq="+qv.getQseq();
	}
	
	// 공지사항 상세보기
	@GetMapping(value="admin_notice_view")
	public String qnaView(NoticeVO nv, HttpSession session, Model model) {
		NoticeVO notice = ns.getNotice(nv.getNseq());
		model.addAttribute("noticeVO", notice);
		return "admin/service/noticeView";
	}
	
	// 공지사항 목록 조회
	@GetMapping(value="admin_notice_list")
	public String noticeList(HttpSession session, Model model) {
		List<NoticeVO> noticeList = ns.listNotice("관리자");
		model.addAttribute("noticeList", noticeList);

		return "admin/member/noticeList";
	}
	
	// 공지사항 작성 화면
	@GetMapping(value="admin_notice_write_form")
	public String noticeWriteView(HttpSession session) {
			return "admin/service/noticeWrite";	// 로그인이 되어있다면 notice작성 화면이동
	}
	
	// 공지사항 작성기능
	@PostMapping(value="admin_notice_write")
	public String noticeWriteAction(NoticeVO nv, HttpSession session) {
			nv.setName("관리자");
			ns.insertNotice(nv);
			return "redirect:admin_notice_list"; // 작성완료후  공지사항 목록으로 이동
	}
	
	// 공지사항 수정 화면
	@GetMapping(value="admin_notice_update_form")
	public String noticeUpdateView(NoticeVO nv, HttpSession session, Model model) {
		NoticeVO notice = ns.getNotice(nv.getNseq());
		model.addAttribute("notice", notice);
		return "admin/service/noticeUpdate";	// 로그인이 되어있다면 notice작성 화면이동
	}
	
	// 공지사항 수정 기능
	@PostMapping(value="admin_notice_update")
	public String noticeUpdateAction(NoticeVO nv, HttpSession session) {
			nv.setName("관리자");
			ns.updateNotice(nv);
			return "redirect:admin_notice_view?nseq="+nv.getNseq(); // 작성완료후  공지사항 목록으로 이동
	}
	
	// 공지사항 삭제 기능
	@RequestMapping(value = "admin_notice_delete")
	public String noticeDelete(NoticeVO nv) {
		ns.deleteNotice(nv.getNseq());
		return "redirect:admin_notice_list";
	}
	
	// 도서 등록 화면이동
	@RequestMapping(value="admin_book_write_form")
	public String adminBookWriteView(HttpSession session) {
			return "admin/book/bookWrite";
	}
	

	// 도서 등록
	@RequestMapping(value="admin_book_write")
	public String adminBookWrite(@RequestParam(value="book_image") MultipartFile uploadFile,
			BookVO bv, HttpSession session) {
			
			String fileName = "";
			if (!uploadFile.isEmpty()) {
				fileName = uploadFile.getOriginalFilename();
				bv.setImage(fileName);

				String image_path 
				= session.getServletContext().getRealPath("WEB-INF/resources/images/book");

				try {
					File file = new File(image_path+fileName);
					uploadFile.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}}
			bs.insertBook(bv);

			return "redirect:book_list_cate1?cate1="+bv.getCate1();
}

	// 도서 수정 화면
	@RequestMapping(value="admin_book_update_form")
	public String adminBookUpdateView(BookVO bv, Model model) {
		BookVO book = bs.getBook(bv.getBseq());

		model.addAttribute("bookVO", book);	

		return "admin/book/bookUpdate";
	}
	
	// 도서 수정
	@RequestMapping(value="admin_book_update")
	public String adminBookUpdate(
			@RequestParam(value="book_image") MultipartFile uploadFile,
			BookVO bv, HttpSession session) {
		
		String fileName = "";
		if (!uploadFile.isEmpty()) {
			fileName = uploadFile.getOriginalFilename();
			bv.setImage(fileName);

			String image_path 
			= session.getServletContext().getRealPath("WEB-INF/resources/images/book");

			try {
				File file = new File(image_path+fileName);
				uploadFile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}}
		bs.updateBook(bv);
		return "redirect:book_view?bseq="+bv.getBseq();
	}
	
	// 도서 삭제
	@RequestMapping(value = "admin_book_delete")
	public String adminBookDelete(BookVO bv, Model model) {
		bs.deleteBook(bv.getBseq());
		
		System.out.println("도서 삭제");
		return "redirect:index";
	}
	
	// 주문 상세보기
	@RequestMapping(value="/admin_order_list")
	public String adminOrderList(Model model) {
		List<OrderVO> orderList = os.adminOrderList();
		
		int totalAmount = 0;
		for (OrderVO vo : orderList) {
			totalAmount += vo.getQuantity() * vo.getPrice();
		}
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalPrice", totalAmount);
		return "admin/order/orderList";
	}
	
	// 배송완료처리
	@RequestMapping(value="/admin_order_ok")
	public String orderOk(OrderVO ov) {
			os.updateOrderOk(ov.getOseq());
		return "redirect:admin_order_list";
	}

}
