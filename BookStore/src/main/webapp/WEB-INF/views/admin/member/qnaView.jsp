<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<form name="formm" class="qnaDetail" method="post" style="min-height: 500px;">
	<h2>QnA</h2>
	<table id="qna">
		<tr>
			<th width="100px">제목</th>
			<td>${qnaVO.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${qnaVO.id}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${qnaVO.indate}</td>
		</tr>
		<tr>
			<th height="300px;">질문내용</th>
			<td>${qnaVO.content}
		</tr>
		<tr>
			<th height="300px;">답변 내용</th>
			<td>${qnaVO.reply}
		</tr>
	</table>
	<div class="clear"></div>
	<div id="buttons">
		<input type="button" value="목록보기" class="submit"
			onclick="location.href='admin_member_qna'">
		<input type="button" value="답변하기" class="submit"
			onclick="location.href='admin_qna_answer_form?qseq=${qnaVO.qseq}'">
	</div>
</form>
<%@ include file="../../footer.jsp"%>