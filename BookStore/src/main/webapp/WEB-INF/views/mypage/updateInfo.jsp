<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="../header.jsp" %>  
<%@ include file="sidemenu.jsp" %>
<div style="margin-top: 50px;">
	<form name="formm" id="updateInfo" action="member_update?id=${memberVO.id}" class="mypage" method="post" autocomplete="off">
		<div class="container">
		<div class="insert">
			<h2 style="text-align: center;">회원정보변경</h2>
			<table class="join">
				<tr>
					<td class="col1">이름</td>
					<td class="col2">${memberVO.name}</td>
				</tr>
				<tr>
					<td class="col1">아이디</td>
					<td class="col2">${memberVO.id}</td>
				</tr>
				<tr>
					<td class="col1">이메일</td>
					<td class="col2">${memberVO.email}</td>
				</tr>
				<tr>
					<td class="col1">비밀번호</td>
					<td class="col2"><input type="password" name="pwd" id="pwd" class="form-control" maxlength="16" style="height: 25px; padding: 5px;"value="${memberVO.pwd}">
						<p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~
								16자리</span>로 입력이 가능합니다.</p>
					</td>
				</tr>
				<tr>
					<td class="col1">비밀번호 확인</td>
					<td class="col2"><input type="password" name="pwdCheck" id="pwdCheck" class="form-control" maxlength="16" style="height: 25px; padding: 5px;"value="${memberVO.pwd}"></td>
				</tr>
				<tr>
					<td class="col1">phone</td>
					<td class="col2">
					<input type="text" name="phone" id="phone" class="form-control" maxlength="13" style="height: 25px; padding: 5px;" value="${memberVO.phone}"
						onKeyup="inputPhoneNumber(this)" >
						<p>※휴대폰번호는 <span class="num">"-"를 제외한 숫자만 </span>입력해주세요.</p>
					</td>
				</tr>
				<tr>
					<td class="col1">주소</td>
					<td class="col2">
					<input type="text" name="zipnum" id="zipnum" size="10" class="form-control"placeholder="우편번호" style="height: 25px; padding: 5px;" value="${memberVO.zipnum}">
					<input type="button" value="주소 찾기" class="dup" 
						onclick="execPostCode();"><i class="fa fa-search"></i><br>
					<input type="text" name="addr" id="addr" class="form-control" size="40" placeholder="도로명 주소" style="margin-top:10px; height: 25px; padding: 5px;" value="${memberVO.addr}"><br>
					</td>
				</tr>
			</table>
		</div>
		<div class="create">
			<input class="but4" type="submit" value="정보수정""> 
			<input class="but3" type="button" value="취소" onclick="location.href='member_view'">
		</div>
	</div>
    </form>  
</div>
<%@ include file="../footer.jsp" %>    
