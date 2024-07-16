package com.yhs.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yhs.project.dto.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	// 회원 상세정보 조회
	public MemberVO getMember(String id) {
		
		System.out.println("회원 상세정보 조회");
		return sst.selectOne("MemberDAO.getMember", id);
	}
	
	// 아이디 중복 검사
	public int idCheck(String id) {
		return sst.selectOne("MemberDAO.idCheck", id);
	};
	
	// 이메일 중복 검사
	public int emailCheck(String email) {
		return sst.selectOne("MemberDAO.emailCheck", email);
	};
	
	// 회원 ID 존재 여부확인
	public int confirmID(String id) {
		
		System.out.println("회원 ID 인증");
		String pwd = sst.selectOne("MemberDAO.confirmID", id);
		
		if(pwd!=null) {
			return 1;
		} else {
			return -1;
		}
	}
	
	// 회원로그인
	public int loginID(MemberVO mv) {
		
		System.out.println("회원 로그인");
		
		int result = -1; // 기본 -1
		String pwd = null; // 입력한 비밀번호
		
		// 아이디를 조건으로 비밀번호를 가져옴
		pwd = sst.selectOne("MemberDAO.confirmID", mv.getId());

		// DB에서 조회한 pwd와 사용자가 입력한 pwd 비교
		if(pwd == null) { // 비밀번호를 입력하지 않았을때
			result = -1;
			System.out.println("아이디또는 비밀번호를 입력해 주세요.");
		} else if(pwd.equals(mv.getPwd())) { // PWD가 일치하는 경우
			result = 1;
			System.out.println("로그인 성공");
		} else { // 비밀번호가 일치하지 않는 경우
			result = 0;
			System.out.println("로그인 실패");
		}
		return result;
	}
	
	// 회원 추가
	public void insertMember(MemberVO mv) {
		System.out.println("회원 추가");
		sst.insert("MemberDAO.insertMember", mv);
	}
	
	public MemberVO getMemberId(MemberVO mv) {
		System.out.println("아이디찾기");
		return sst.selectOne("MemberDAO.getMemberId", mv);
	}
	
	public MemberVO getMemberPwd(MemberVO mv) {
		System.out.println("비밀번호 찾기");
		return sst.selectOne("MemberDAO.getMemberPwd", mv);
	}
	
	// 회원 정보 변경
	public void updateMember(MemberVO mv) {
		sst.update("MemberDAO.updateMember", mv);
	}
	
	public List<MemberVO> listMember() {
		return sst.selectList("MemberDAO.listMember");
	}
	
	public void deleteMember(String id) {
		sst.delete("MemberDAO.deleteMember", id);
	}
}
