<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<div class="noticeWrap">
	<form name="formm" class="noticeDetail" method="post">
		<h1>공지사항</h1>
		<div class="noticeTitle">
			<h2> ${noticeVO.title}</h2>
			<p>
				${noticeVO.name}&nbsp; | &nbsp;
				${noticeVO.indate}
			<p>
		</div>
		<div class="noticeContent">${noticeVO.content}</div>
		<div id="buttons">
			<input type="button" value="목록보기" class="submit"
				onclick="location.href='admin_notice_list'"> 
			<input type="button" value="수정" class="submit"
				onclick="location.href='admin_notice_update_form?nseq=${noticeVO.nseq}'"> 
			<input type="button" value="삭제" class="submit"
				onclick="noticeDelete(${noticeVO.nseq})">
		</div>
	</form>
</div>
<%@ include file="../../footer.jsp"%>