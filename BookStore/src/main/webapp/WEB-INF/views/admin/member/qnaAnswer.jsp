<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<div style="margin-bottom: 100px; min-height: 500px;">
<form name="formm" method="post" class="noticeWrite" action="admin_qna_answer?qseq=${qna.qseq}" autocomplete="off">
	<h1>1대1 문의 답변</h1><br><br>
	<table class="inputNotice">
		<tr>
			<td><label>제목</label></td>
			<td><input type="text" readonly="readonly" class="form-control" value="${qna.title}"></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
			<td><label>질문</label></td>
			<td><textarea class="form-control" rows="5" cols="101" readonly="readonly">
				${qna.content}
			</textarea></td>
		</tr>
				<tr></tr><tr></tr><tr></tr>
		<tr>
			<td><label>답변</label></td>
			<td><textarea rows="10" cols="101" name="reply" id="reply" class="form-control"></textarea></td>
		</tr>
	</table>
	<div id="buttons">
		<input type="submit" value="등록" class="submit" onclick="qnaUpdate()"> 
		<input type="reset" value="취소" class="cancel" onclick="location.href='admin_member_qna'">
	</div>
</form>
</div>
<%@ include file="../../footer.jsp" %>