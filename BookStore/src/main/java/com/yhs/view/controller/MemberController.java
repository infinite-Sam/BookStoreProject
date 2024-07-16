package com.yhs.view.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSender;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.yhs.project.dto.MemberVO;
import com.yhs.project.member.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	// 이메일 인증
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private MemberService ms;
	
	// 로그인 화면 표시
	@GetMapping(value = "/login_form") 
	public String loginView() {
		
		System.out.println("로그인 화면 이동");
		return "member/login";
	}
	
	// 로그인 기능
	@PostMapping(value="/login")
	public String loginAction(MemberVO mv, Model model) {
		
		System.out.println("로그인 처리");
		
		MemberVO loginUser = null;
		
		int result = ms.loginID(mv);
		
		if(result == 1) { // 사용자 인증 성공
			loginUser = ms.getMember(mv.getId());
			model.addAttribute("loginUser", loginUser);
			return "redirect:index"; // 이전 페이지로 리다이렉트
		} else {
			
			return "member/login_fail";
		}
	}
	
	// 약관동의
	@GetMapping(value="/contract")
	   public String contractView() {

		System.out.println("약관동의");
		return "member/contract";
	}
	
	// 회원가입 화면 출력
	@PostMapping(value="/join_form")
	   public String joinView() {

		System.out.println("회원가입");
		return "member/join";
	}
	
	// 아이디 중복 검사
		@PostMapping(value = "/memberIdChk")
		@ResponseBody
		public String memberIdChkPOST(String id) throws Exception{
			int result = ms.idCheck(id);
			if(result != 0) {
				return "fail"; // 아이디 중복
			} else {
				return "success";
			}
		}
		
		// 이메일 중복 검사
		@PostMapping(value = "/memberEmailChk")
		@ResponseBody
		public String memberEmailChkPOST(String email) throws Exception{
			int result = ms.emailCheck(email);
			if(result != 0) {
				return "fail"; // 이메일 중복
			} else {
				return "success";
			}
		}
	
		// 회원가입
	@PostMapping(value="/join")
	   public String joinAction(MemberVO mv) {
		ms.insertMember(mv);
		return "member/joinOk";
	}

	// 로그아웃
	 @GetMapping(value = "/logout")
	 public String logout(SessionStatus status) {
		 System.out.println("로그아웃");
		 status.setComplete(); // 현재 세션을 종료
		 return "member/login";
	 }
	 
	 // id/pw 찾기 화면
	 @GetMapping(value = "/findId")
	 public String findIdView() {
		 return "member/findId";
	 }
	 @GetMapping(value = "/findPwd")
	 public String findPwdView() {
		 return "member/findPwd";
	 }	
	 
	 // id 찾기
	 @GetMapping(value = "/find_id")
	 public String findIdAction(MemberVO mv, Model model) {
		 MemberVO member = ms.getMemberId(mv);
		 if(member != null) { // 사용자 아이디가 존재한다면
			 model.addAttribute("message", "1");
			 model.addAttribute("id", member.getId());
		 } else {
			 model.addAttribute("message", "-1");
		 }
		 return "member/findIdResult";
	 }
	 
	 // 비밀번호 찾기
	 @GetMapping(value = "/find_pwd")
	 public String findPassword(MemberVO mv, Model model) {
		 System.out.println("비밀번호 찾기");
		 MemberVO member = ms.getMemberPwd(mv);
		 
		 if(member != null) { // 사용자 아이디가 존재한다면
			 model.addAttribute("message", "1");
			 model.addAttribute("id", member.getId());
			 model.addAttribute("pwd", member.getPwd());
		 } else {
			 model.addAttribute("message", "-1");
		 }
		 return "member/findPwdResult";
	 }
	 
	 // 회원정보 상세보기
	 @RequestMapping(value="/member_view")
	 public String memberView(MemberVO vo, HttpSession session, Model model) {
			
		 MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
		if (loginUser == null) {
			return "member/login";
		}
		 MemberVO member = ms.getMember(loginUser.getId());
		 model.addAttribute("member", member);
		 
		 return "mypage/mypage";
	 }
	 
	 // 회원정보 변경 폼
	 @RequestMapping(value="/member_update_form")
	 public String updateMemberForm(
			 MemberVO mv, Model model, HttpSession session) {
		
		 MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
		if (loginUser == null) {
			return "member/login";
		}
			MemberVO member = ms.getMember(loginUser.getId());
			model.addAttribute("memberVO", member);
			
		return "mypage/updateInfo";
	 }
	 
	 // 회원정보 변경
	 @RequestMapping(value = "/member_update", method = {RequestMethod.GET, RequestMethod.POST})
	 public String updateMember(MemberVO mv, Model model, HttpSession session) {
		 MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
		if (loginUser == null) {
			return "member/login";
		}
		mv.setId(loginUser.getId());
		 ms.updateMember(mv);
		 return "redirect:member_view";
	 }
	 
		// 회원탈퇴
		@RequestMapping(value = "/member_delete")
		public String memberDelete(MemberVO vo) {
			ms.deleteMember(vo.getId());
			return "redirect:logout";
		}
		
		    // 회원가입 이메일 인증
		    @GetMapping(value = "/mailCheck")
		    @ResponseBody
		    public String mailCheck(@RequestParam("email")String email) throws Exception{
		    	/* 인증번호(난수) 생성 */
		        Random random = new Random();
		        // 111111 ~ 999999 범위의 숫자를 얻기 위해서 nextInt(888888) + 111111를 사용
		        int checkNum = random.nextInt(888888) + 111111;
		        /* 이메일 양식 */
		        // applicationContext.xml에 삽입한 자신의 이메일 계정의 이메일 주소
		        String from = "gkstoa3326@gmail.com"; // 보내는 이
		        // 수신받을 이메일, 뷰로부터 받은 이메일 주소인 변수 email을 사용
		        String to = email; // 받는 이
		        // 보낼 이메일 제목
		        String title = "HBS 회원가입 이메일 인증코드 입니다.";
		        // 이메일 내용
		        String content = 
		                "HBS를 방문해주셔서 감사합니다." + "<br><br>" 
		                +  "인증코드는 " + checkNum + "입니다." + "<br>" 
		                +  "해당 인증코드를 인증번호 확인란에 기입하여 주세요.";
		        String num = "";
		        try {
					MimeMessage mail = mailSender.createMimeMessage();
					MimeMessageHelper mmh = new MimeMessageHelper(mail, true, "UTF-8");
					mmh.setFrom(from);
					mmh.setTo(to);
					mmh.setSubject(title);
					mmh.setText(content, true);
					mailSender.send(mail);
				} catch (Exception e) {
					e.printStackTrace();
				}
		        num = Integer.toString(checkNum);
			    return num;
		}     
}








