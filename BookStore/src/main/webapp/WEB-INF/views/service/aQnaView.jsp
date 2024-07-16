<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="aqnaWrap">
<form name="formm" class="aQnaDetail" method="post">
	<h1>자주묻는질문</h1>
	<h2>제목: ${aqnaVO.title}</h2>
	<h2>Questions</h2>
	<div class="questions">
		${aqnaVO.questions}
	</div>
	<h2>Answer</h2>
	<div class="answer">
		${aqnaVO.answer}
	</div>
	<div id="buttons">
		<input type="button" value="목록보기" class="submit"
			onclick="location.href='qna_list'">
		<c:if test="${loginUser.type=='2'}">
			<input type="button" value="수정하기" class="submit"
				onclick="location.href='admin_aqna_update_form?aqseq=${aqnaVO.aqseq}'">
			<input type="button" value="삭제하기" class="submit"
				onclick="aqnaDelete(${aqnaVO.aqseq})">
		</c:if>
	</div>
</form>
</div>
<%@ include file="../footer.jsp"%>