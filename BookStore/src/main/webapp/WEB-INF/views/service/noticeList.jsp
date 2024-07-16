<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form name="formm" class="noticeList" method="post" style="margin-top: 150px;">
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
				<td><a href="notice_view?nseq=${noticeVO.nseq}"> ${noticeVO.title} </a></td>
				<td>${noticeVO.indate}</td>
				<td>${noticeVO.name} </td>
			</tr>
		</c:forEach>
	</table>
</form>

<%@ include file="../footer.jsp" %>
