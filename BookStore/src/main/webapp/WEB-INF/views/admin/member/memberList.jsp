<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>  
<%@ include file="sidemenu.jsp" %>
	<form name="formm" class="qnaList" method="post" style="margin-top: -10px;min-height: 600px">
	<h2 style="position: relative; margin-top: 30px;">회원관리</h2>
	<table id="andList">
		<tr class="titleline">
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>phone</th>
			<th>  </th>
		</tr>
		<c:forEach items="${memberList}" var="memberVO">
			<c:if test="${memberVO.type=='1'}">
			<tr style="text-align: center;">
				<td>${memberVO.name}</td>
				<td>${memberVO.id}</td>
				<td>${memberVO.pwd}</td>
				<td>${memberVO.email}</td>
				<td>${memberVO.phone}</td>
				<td><a href="admin_member_delete?id=${memberVO.id}">삭제</a></td>
			</tr>
			</c:if>
		</c:forEach>
	</table>
</form>
	
<%@ include file="../../footer.jsp" %>    