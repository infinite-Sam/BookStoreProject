<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="sidemenu.jsp" %>

<form name="formm" class="noticeList" method="post">
	<h2>공지사항</h2>
	<table>
		<tr class = "titleline">
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
		</tr>
		<c:forEach items="${noticeList}" var="noticeVO">
			<tr style="text-align: center;">
				<td>${noticeVO.nseq}</td>
				<td><a href="admin_notice_view?nseq=${noticeVO.nseq}"> ${noticeVO.title} </a></td>
				<td>${noticeVO.indate}</td>
				<td>${noticeVO.name} </td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="공지사항등록" class="submit"
		onclick="location.href='admin_notice_write_form'">
</form>

<%@ include file="../../footer.jsp" %>
</html>