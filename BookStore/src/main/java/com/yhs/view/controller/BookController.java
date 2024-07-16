package com.yhs.view.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yhs.project.book.BookService;
import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.reply.ReplyService;
import com.yhs.project.utils.Criteria;
import com.yhs.project.utils.PageMaker;

@Controller
public class BookController {
	
	@Autowired
	private BookService bs;
	
	// 도서 상세보기
	@GetMapping(value="/book_view")
	public String bookView(ReplyVO rv, BookVO bv, HttpSession session, Model model) throws Exception {
		System.out.println("도서 상세보기");
		List<ReplyVO> listReply = bs.listReply(bv.getBseq());
		model.addAttribute("listReply", listReply);
		model.addAttribute("replyCount", listReply.size());
		int countReply = bs.countReply(bv.getBseq());
		model.addAttribute("countReply", countReply);
		if(countReply != 0) {
			double avgRating = bs.avgReply(bv.getBseq());
			model.addAttribute("avgReply", avgRating);
		}
		bs.updateReplyCount(bv.getBseq());
		bs.updateReplyRating(bv.getBseq());
		BookVO book = bs.getBook(bv.getBseq());
		model.addAttribute("bookVO", book);
		return "book/bookView";
	}
	
	// 대분류별 도서 목록조회
	@GetMapping(value="/book_list_cate1")
	public String bookListPagingCate1(
			@RequestParam(value="cate1", defaultValue="") String cate1,
			Criteria cri, Model model, BookVO bv) {

			int total = bs.countBookListCate1(cate1);
			List<BookVO> bookList1 = bs.getListWithPagingCate1(cri, bv.getCate1());
			PageMaker pageMaker = new PageMaker(cri, total);

			model.addAttribute("bookListSize", bookList1.size());
			model.addAttribute("bookList1", bookList1);
			model.addAttribute("pageMaker", pageMaker);
		return "book/bookCategory";
	}
	
	// 소분류별 도서 (전체)목록조회
	@RequestMapping(value="/book_list_cate2")
	public String bookListCate2(
			@RequestParam(value="cate1", defaultValue="") String cate1,
			@RequestParam(value="cate2", defaultValue="") String cate2,
			Criteria cri, Model model, BookVO bv) {
		int total = bs.countBookListCate2(cate1, cate2);
		List<BookVO> bookList2 = bs.getListWithPagingCate2(cri, bv.getCate1(), bv.getCate2());
		PageMaker pageMaker = new PageMaker(cri, total);
		model.addAttribute("bookListSize", bookList2.size());
		model.addAttribute("bookList2", bookList2);
		model.addAttribute("pageMaker", pageMaker);
		
		return "book/bookCategory";
	}
	
	// 검색
	@RequestMapping(value="/search")
	public String searchList(Criteria cri, Model model, BookVO bv) {
		
		List<BookVO> searchList = bs.searchList(cri);
		int total = bs.countSearch(cri);
		
		PageMaker pageMaker = new PageMaker(cri, total);
		model.addAttribute("searchListSize", searchList.size());
		model.addAttribute("searchList", searchList);
		model.addAttribute("pageMaker",  pageMaker);
		
		return "book/searchList";
	}
	
	// 베스트셀러 목록
	@RequestMapping(value = "bestSeller")
	public String bestSeller(Model model) {
		List<BookVO> bestSeller = bs.bestSeller();
		
		model.addAttribute("bestSeller", bestSeller);
		return "book/bestSeller";
	}
	
}
