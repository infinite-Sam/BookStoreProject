package com.yhs.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yhs.project.dto.BookVO;
import com.yhs.project.dto.MemberVO;
import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.order.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService os;
	
	@PostMapping(value="/cart_insert")
	public String cartInsert(OrderVO vo, Model model, HttpSession session, BookVO bv) {
		String url = "member/login";
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return url;
		} else {
			vo.setId(loginUser.getId());
			vo.setName(loginUser.getName());
			vo.setZipnum(loginUser.getZipnum());
			vo.setAddr(loginUser.getAddr());
			vo.setPhone(loginUser.getPhone());
			vo.setBseq(bv.getBseq());
			vo.setImage(bv.getImage());
			vo.setTitle(bv.getTitle());
			vo.setResult("2");
			os.insertCart(vo);
			
			return "redirect:cart_list";
		}
	}
	
	@RequestMapping(value="/cart_list")
	public String cartList(HttpSession session, Model model) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			url = "member/login";
		} else {
			List<OrderVO> cartList = os.listCart(loginUser.getId());
			
			int totalAmount = 0;
			for (OrderVO vo : cartList) {
				totalAmount += vo.getQuantity() * vo.getPrice();
			}
			model.addAttribute("cartList", cartList);
			model.addAttribute("totalPrice", totalAmount);
		}
		return "mypage/cartList";
	}
	
	@RequestMapping(value="/updateQuantity")
	public String udpateQuantity(OrderVO ov, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			ov.setOseq(ov.getOseq());
			os.updateQuantity(ov);
			return "redirect:cart_list";
		}
	}
	@RequestMapping(value="/updateQuantityOrderInfo")
	public String udpateQuantityOrderInfo(OrderVO ov, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			ov.setOseq(ov.getOseq());
			os.updateQuantity(ov);
			return "redirect:order_insert_view";
		}
	}
	
	@RequestMapping(value="/cart_order")
	public String cartToOrder(@RequestParam(value="oseq") int[] oseq,
			HttpSession session, OrderVO vo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		for (int i=0; i<oseq.length; i++) {
			vo.setId(loginUser.getId());
			os.updateCart(oseq[i]);
		}
		return "redirect:order_insert_view";
	}
	
	@RequestMapping(value="/cart_delete")
	public String cartDelete(OrderVO vo) {
			os.deleteCart(vo.getOseq());
		return "redirect:cart_list";
	}
	
	@RequestMapping(value="/order_insert")
	public String orderInsert(OrderVO vo, HttpSession session, Model model) {
		String url = "member/login";
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return url;
		} else {
			vo.setId(loginUser.getId());
			os.insertOrder(vo);
			
			return "redirect:order_insert_view";
		}
	}
	
	// 주문완료전 주문정보 상세보기
	@RequestMapping(value = "/order_insert_view")
	public String orderViewWrite(OrderVO ov, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
			List<OrderVO> orderList = os.listOrderView(loginUser.getId());
			int totalAmount = 0;
			for (OrderVO vo : orderList) {
				totalAmount += vo.getQuantity() * vo.getPrice();
			}
			
			List<OrderVO> cartList = os.listCartView(ov.getOseq());
			int totalCart= 0;
			for (OrderVO vo : cartList) {
				totalCart += vo.getQuantity() * vo.getPrice();
			}
			model.addAttribute("cartInsertList", cartList);
			model.addAttribute("totalCart", totalCart);
			model.addAttribute("orderInsertList", orderList);
			model.addAttribute("totalPrice", totalAmount);
			return "mypage/orderInsertView";
		}
	}
	
	@RequestMapping(value="/update_order_info_form")
	public String updateOrderInfoForm(OrderVO ov, Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
		List<OrderVO> orderInfo = os.getOrderResult(loginUser.getId());
		model.addAttribute("orderInfo", orderInfo);
		return "mypage/deliveryInfo";
		}
	}
	
	// 주문정보창 정보변경
	@RequestMapping(value="/update_order_info")
	public String updateOrderInfo(HttpSession session, OrderVO ov) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			ov.setResult("1");
			ov.setId(loginUser.getId());
			os.updateOrderInfo(ov);
		}
		return "redirect:order_insert_view";
	}
	
	// 주문정보창 취소
	@RequestMapping(value="/delete_order")
	public String deleteOrder(HttpSession session, OrderVO vo) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			os.deleteOrder(loginUser.getId(), vo.getResult());
		}
		return "redirect:cart_list";
	}
	
	// 주문
	@RequestMapping(value="/update_order")
	public String updateOrder(HttpSession session, OrderVO vo) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			os.updateOrder(loginUser.getId(), vo.getResult());
		}
		return "redirect:order_list";
	}
	
	// 마이페이지 주문목록
	@RequestMapping(value="/order_list")
	public String orderList(HttpSession session, Model model) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			List<OrderVO> orderList = os.listOrder(loginUser.getId());
			
			int totalAmount = 0;
			for (OrderVO vo : orderList) {
				totalAmount += vo.getQuantity() * vo.getPrice();
			}
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("totalPrice", totalAmount);
		}
		return "mypage/orderList";
	}
	
	@GetMapping(value = "/order_view")
	public String orderView(OrderVO vo, HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
			OrderVO getOrder = os.getOrder(vo.getOseq());
			model.addAttribute("getOrder", getOrder);
			
			return "mypage/orderView";
	}
	@RequestMapping(value="/updateGetOrderForm")
	public String updateGetOrderForm(OrderVO ov, Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		} else {
		OrderVO order = os.getOrder(ov.getOseq());
		model.addAttribute("updateGetOrder", order);
		return "mypage/updateGetOrder";
		}
	}
	// 주문
	@RequestMapping(value="/updateGetOrder")
	public String updateGetOrder(HttpSession session, OrderVO vo) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			vo.setOseq(vo.getOseq());
			os.updateGetOrder(vo);
		}
		return "redirect:order_view?oseq="+vo.getOseq();
	}
	
	// 구매확정
	@RequestMapping(value="/order_check")
	public String orderCheck(HttpSession session, OrderVO ov) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			os.updateOrderCheck(ov.getOseq());
		}
		return "redirect:order_list";
	}
	
	// 구매취소
	@RequestMapping(value="/order_cancel")
	public String orderCancel(HttpSession session, OrderVO ov) {
		String url = null;
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "member/login";
		} else {
			os.updateOrderCancel(ov.getOseq());
		}
		return "redirect:order_list";
	}
}






