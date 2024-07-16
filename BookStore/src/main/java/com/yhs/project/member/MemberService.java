package com.yhs.project.member;


import java.util.List;

//import com.yhs.project.dto.AddressVO;
import com.yhs.project.dto.MemberVO;

public interface MemberService {
	
	// 회원 로그인
	int loginID(MemberVO mv);
	
	// 회원 상세정보 조회
	MemberVO getMember(String id);
	
	// 회원아이디 존재여부 확인
	int confirmID(String id);
	
	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	// 이메일 중복 검사
	public int emailCheck(String memberEmail) throws Exception;

	/** 이메일 전송
    *  @param subject 제목
    *  @param text 내용
    *  @param from 보내는 메일 주소
    *  @param to 받는 메일 주소
    *  @param filePath 첨부 파일 경로: 첨부파일 없을시 null **/
	public boolean send(String subject, String text, String from, String to, String filePath);
	
	// 회원 추가
	void insertMember(MemberVO mv);
	
	// 사용자 이름과 이메일을 조건으로 사용자 정보 조회
	MemberVO getMemberId(MemberVO mv);
	
	// 비밀번호 찾기
	MemberVO getMemberPwd(MemberVO mv);
	
	// 회원정보변경
	void updateMember(MemberVO mv);
	
	// 회원 목록 조회
	List<MemberVO> listMember();
	
	void deleteMember(String id);
	
}
