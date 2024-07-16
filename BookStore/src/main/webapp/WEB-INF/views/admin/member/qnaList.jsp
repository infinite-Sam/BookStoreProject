<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ include file="sidemenu.jsp" %>

<form name="formm" class="qnaList" method="post" style="margin-top: 50px; min-height: 500px;">
	<h2>자주묻는질문</h2>
	<table id="andList">
		<tr class = "titleline">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<c:forEach items="${aqnaList}" var="aqnaVO">
			<tr style="text-align: center;">
				<td>${aqnaVO.aqseq}</td>
				<td><a href="admin_aqna_view?aqseq=${aqnaVO.aqseq}"> ${aqnaVO.title} </a></td>
				<td>${aqnaVO.name} </td>
			</tr>
		</c:forEach>
	</table>
			<input type="button" value="등록하기" class="submit"
					onclick="location.href='admin_aqna_write_form'"
					style="margin-top: -50px;">
	
	<h2 style="position: relative; margin-top: 30px;">문의내역</h2>
	<table id="andList">
		<tr class="titleline">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>답변 여부</th>
		</tr>
		<c:forEach items="${qnaList}" var="qnaVO">
			<tr style="text-align: center;">
				<td>${qnaVO.qseq}</td>
				<td><a href="admin_qna_view?qseq=${qnaVO.qseq}"> ${qnaVO.title} </a></td>
				<td>${qnaVO.id} </td>
				<td>${qnaVO.indate}</td>
				<td><c:choose>
						<c:when test="${qnaVO.rep==1}"> no </c:when>
						<c:when test="${qnaVO.rep==2}"> yes </c:when>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
</form>

<%@ include file="../../footer.jsp"%>
</html>