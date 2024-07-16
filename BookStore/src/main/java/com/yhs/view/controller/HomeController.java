package com.yhs.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yhs.project.book.BookService;
import com.yhs.project.dto.BookVO;

@Controller
public class HomeController {
	@Autowired
	private BookService bs;
	
	@GetMapping(value = "/index")
	public String home(Model model) {
		List<BookVO> bestSeller = bs.bookCateB();
		List<BookVO> bookCateD = bs.bookCateD();
		List<BookVO> bookCateF = bs.bookCateF();
		
		model.addAttribute("bestSeller", bestSeller);
		model.addAttribute("bookCateD", bookCateD);
		model.addAttribute("bookCateF", bookCateF);
		
		return "index"; // index.jsp 파일 출력
	}
}
