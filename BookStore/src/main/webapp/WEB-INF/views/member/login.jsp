<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
  <!-- 헤더 부분 -->

<div class="wrap">	  
	 <div class="loginWrap">
	 <div id="loginimg"><img src="images/member/loginimg.jpg"></div>
	  
	 <form method="post" action="login" id="loginForm">

	    <h2><img src="images/member/login.jpg" width="50px" height="auto" style="position: relative; top: 15px;">Login</h2>
	    <div id="idForm">
	      <input type="text" id="id" name="id" value="${id}" placeholder="아이디" autocomplete="none" 
	      	onkeyup="this.value=this.value.replace(/[^a-z0-9]/g,'')">
	    </div>
	    <div id="passForm">
	      <input type="password" id="pw" name="pwd" placeholder="비밀번호">
	    </div>
	    
	    <input type="submit" id="loginBtn" value="Login">
	
	    <div id="findText">
	      <input type="button" style="padding: 0; background: none; border: none; cursor: pointer;" 
	      		value="아이디/비밀번호 찾기" class="submit" onclick="findInfoForm()">&nbsp; |
	      <a href="contract">사용자 등록</a>
	    </div>
	  </form>
	  <div id="loginInfo">
	    <hr style="margin-bottom: 20px;">
	    <p>※ 비밀번호는 영문자, 숫자, 특수문자를 조합하여 10자리 이상으로 구성하고 최소 3개월마다 변경하여 사용하시기 바랍니다.</p>
	    <p>※ 타인의 계정으로 무단 로그인할 경우 정보통신망이용 촉진 및 정보보호등에 관한법률 
	      <a href="https://law.go.kr/%EB%B2%95%EB%A0%B9/%EC%A0%95%EB%B3%B4%ED%86%B5%EC%8B%A0%EB%A7%9D%EC%9D%B4%EC%9A%A9%EC%B4%89%EC%A7%84%EB%B0%8F%EC%A0%95%EB%B3%B4%EB%B3%B4%ED%98%B8%EB%93%B1%EC%97%90%EA%B4%80%ED%95%9C%EB%B2%95%EB%A5%A0/%EC%A0%9C48%EC%A1%B0" style="color: red; font-weight: bold;">제 48조</a>, 
	      <a href="https://law.go.kr/%EB%B2%95%EB%A0%B9/%EC%A0%95%EB%B3%B4%ED%86%B5%EC%8B%A0%EB%A7%9D%EC%9D%B4%EC%9A%A9%EC%B4%89%EC%A7%84%EB%B0%8F%EC%A0%95%EB%B3%B4%EB%B3%B4%ED%98%B8%EB%93%B1%EC%97%90%EA%B4%80%ED%95%9C%EB%B2%95%EB%A5%A0/%EC%A0%9C72%EC%A1%B0" style="color: red; font-weight: bold;">제 72조</a>에 의거 형사처벌을 받을 수 있습니다.</p>
	    <br>
	    <p>※ 서비스 이용을 끝낸 후에는 개인정보보호를 위하여 꼭 로그아웃 해주시기 바랍니다.</p>
	  </div>
	 </div>
</div>
  <!-- 푸터 부분 -->
<%@ include file="../footer.jsp" %>     