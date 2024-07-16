<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<div style="margin-bottom: 100px; min-height: 500px;">
<form name="frm" action="admin_aqna_update?aqseq=${aqna.aqseq}" class="noticeWrite" method="post">
<h1>자주묻는질문 수정</h1><br><br>
	<table class="inputNotice">
		<tr>
			<td><label>제목</label></td>
			<td><input type="text" name="title" id="title" class="form-control" size="100" value="${aqna.title}"></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
			<td><label>Questions</label></td>
			<td><textarea rows="10" cols="101" name="questions" id="questions" class="form-control">${aqna.questions}</textarea></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
		<td><label>Answer</label></td>
		<td><textarea rows="10" cols="101" name="answer" id="answer" class="form-control" id="content">${aqna.answer}</textarea></td>
		</tr>	
	</table>
	<div id="buttons">
		<input type="submit" value="등록" class="submit" onclick="aqnaUpdate()"> 
		<input type="reset" value="취소" class="cancel" onclick="location.href='admin_member_qna'">
	</div>
</form>
</div>
<%@ include file="../../footer.jsp"%>
