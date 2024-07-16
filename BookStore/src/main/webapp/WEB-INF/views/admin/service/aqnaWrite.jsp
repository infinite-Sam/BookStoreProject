<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<div style="margin-bottom: 100px; min-height: 500px;">
<form name="formm" method="post" class="noticeWrite" action="admin_aqna_write" autocomplete="off">
	<h1>자주묻는질문 등록</h1><br><br>
	<table class="inputNotice">
		<tr>
			<td><label>제목</label></td>
			<td><input type="text" name="title" id="title" class="form-control" size="100"></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
			<td><label>Questions</label></td>
			<td><textarea rows="10" cols="101" name="questions" id="questions" class="form-control"></textarea></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
		<td><label>Answer</label></td>
		<td><textarea rows="10" cols="101" name="answer" id="answer" class="form-control"></textarea></td>
		</tr>	
	</table>
	<div id="buttons">
		<input type="submit" value="등록" class="submit" onclick="aqnaWrite()"> 
		<input type="reset" value="취소" class="cancel" onclick="location.href='admin_member_qna'">
	</div>
</form>
</div>
<%@ include file="../../footer.jsp" %>