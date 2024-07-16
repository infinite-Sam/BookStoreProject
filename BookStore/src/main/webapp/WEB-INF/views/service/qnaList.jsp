<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<form name="formm" class="qnaList" method="post" style="min-height: 600px;">
	<c:if test="${empty sessionScope.loginUser}">
	<h2>자주묻는질문</h2>
	<table id="andList">
		<tr class = "titleline">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<c:forEach items="${aQnaList}" var="aqnaVO">
			<tr style="text-align: center;">
				<td>${aqnaVO.aqseq}</td>
				<td><a href="aqna_view?aqseq=${aqnaVO.aqseq}"> ${aqnaVO.title} </a></td>
				<td>${aqnaVO.name} </td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	
	<c:if test="${loginUser.type=='1'}">
		<h2>자주묻는질문</h2>
	<table id="andList">
		<tr class = "titleline">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<c:forEach items="${aQnaList}" var="aqnaVO">
			<tr style="text-align: center;">
				<td>${aqnaVO.aqseq}</td>
				<td><a href="aqna_view?aqseq=${aqnaVO.aqseq}"> ${aqnaVO.title} </a></td>
				<td>${aqnaVO.name} </td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${loginUser.type=='1'}">
	<h2 style="position: relative; margin-top: 30px;">문의내역</h2>
	<table id="andList">
		<tr class="titleline">
			<th><span style="margin-left: 170px;">제목</span></th>
			<th>등록일</th>
			<th>답변 여부</th>
		</tr>
		<c:forEach items="${qnaList}" var="qnaVO">
			<tr style="text-align: center;">
				<td><a href="qna_view?qseq=${qnaVO.qseq}"><span style="margin-left: 170px;">${qnaVO.title}</span></a></td>
				<td>${qnaVO.indate}</td>
				<td><c:choose>
						<c:when test="${qnaVO.rep==1}"> no </c:when>
						<c:when test="${qnaVO.rep==2}"> yes </c:when>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
		<input type="button" value="문의하기" class="submit"
		onclick="location.href='qna_write_form'">
	</c:if>
</form>
<%@ include file="../footer.jsp"%>