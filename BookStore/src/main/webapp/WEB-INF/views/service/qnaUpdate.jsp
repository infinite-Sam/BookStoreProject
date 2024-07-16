<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div style="margin-bottom: 100px; min-height: 500px;">
<form name="formm" method="post" class="noticeWrite" action="qna_update?qseq=${qna.qseq}" autocomplete="off">
	<h1>1대1 문의 수정</h1><br><br>
	<table class="inputNotice">
		<tr>
			<td><label>제목</label></td>
			<td><input type="text" name="title" id="title" class="form-control" size="100" value="${qna.title}"></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
			<td><label>질문내용</label></td>
			<td><textarea rows="10" cols="101" name="content" id="content" class="form-control">${qna.content}</textarea></td>
		</tr>
	</table>
	<div id="buttons">
		<input type="submit" value="등록" class="submit" onclick="qnaUpdate()"> 
		<input type="reset" value="취소" class="cancel" onclick="location.href='qna_list'">
	</div>
</form>
</div>
<%@ include file="../footer.jsp"%>