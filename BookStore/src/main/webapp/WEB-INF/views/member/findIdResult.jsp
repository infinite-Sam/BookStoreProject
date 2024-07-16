<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="../css.jsp" %>
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <script src="js/index.js" type="text/javascript"></script>

<body style="overflow-x:hidden; overflow-y:hidden;">
  <form id="findResult" method=post name=formm>
  <h1>아이디 찾기 결과</h1>
    <div style="margin-top: 20px;">   
      <c:if test="${message == 1}">
       	<h2>찾은 ID는 ${id}입니다.</h2>
      </c:if>
      <c:if test="${message==-1}">
             입력한 사용자 정보를 확인해주세요!
      </c:if>
    </div>
    <c:if test="${message == -1}">
    	<input type="button" value="아이디 다시 찾기" onclick="location.href='findId'" 
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
		<input type="button" value="비밀번호 찾기" onclick="location.href='findPwd'" 
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
    	<input type="button" value="로그인화면으로 돌아가기" onclick="idok()"
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
    </c:if>
    <c:if test="${message == 1}">
    <input type="button" value="비밀번호 찾기" onclick="location.href='findPwd'" 
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
    <input type="button" value="로그인화면으로 돌아가기" onclick="idok()"
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
  	</c:if>
  </form>
</body>