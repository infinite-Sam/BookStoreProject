<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<form name="frm" id="update_form" method="post"
	enctype="multipart/form-data" autocomplete="off">
	<h1>도서수정</h1>
	<table>
		<tr><td>제목</td></tr>
		<tr>
			<td>
				<input type="text" name="title" id="title" class="form-control" style="width:500px;" value="${bookVO.title}">
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>저자</td></tr>
		<tr>
			<td>
				<input type="text" name="author" id="author" class="form-control" style="width:500px;" value="${bookVO.author}">
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>출판사</td></tr>
		<tr>
			<td>
				<input type="text" name="pub" id="pub" class="form-control" style="width:500px;" value="${bookVO.pub}">
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>출판일</td></tr>
		<tr>
			<td>
				<input type="text" name="pub_date" id="pub_date" class="form-control" style="width:500px;" value="${bookVO.pub_date}">
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>책소개</td></tr>
		<tr>
			<td colspan="5">
				<textarea name="info" id="info" class="form-control" style="width: 500px; height: 200px;">${bookVO.info}</textarea>
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>가격</td></tr>
		<tr>
			<td width="343" colspan="6">
				<input type="text" name="price" id="price" class="form-control" value="${bookVO.price}">
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>이미지</td></tr>
		<tr>
			<td width="343" colspan="6">
				<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  --> 
				<input type="file" name="book_image" id="book_image">
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>대분류</td></tr>
		<tr>
			<td width="343" colspan="6">
		<select name="cate1" style="padding: 5px;">
      		<option value="none">선택</option>
			<option value="d">국내도서</option>
			<option value="f">외국도서</option>
	  	</select>
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr><td>소분류</td></tr>
		<tr>
			<td width="343" colspan="6">
		<select name="cate2" style="padding: 5px;">
      		<option value="none">선택</option>
			<option value="1">여행 / 어린이 유아</option>
			<option value="2">IT 모바일 / 인문 사회</option>
			<option value="3">자격증 / 자연 과학</option>
	  	</select>
			</td>
		</tr>
	</table>
	<div class=buttons>
		<input class="btn" type="button" value="완료" onclick="admin_book_update_save('${bookVO.bseq}')">
		<input class="btn" type="button" value="취소" onclick="location.href='book_view?bseq=${bookVO.bseq}'">
	</div>
</form>
<%@ include file="../../footer.jsp"%>
</body>
</html>