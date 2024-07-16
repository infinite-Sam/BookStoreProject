<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../css.jsp" %>
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <script src="js/index.js" type="text/javascript"></script>

<body style="overflow-x:hidden; overflow-y:hidden;">
	<div class="findInfo">
		<ul class="navInfo nav-info">
			<li class="navInfo-item"><a class="navInfo-link active"
				aria-current="page" href="findId">ID찾기</a></li>
			<li class="navInfo-item"><a class="navInfo-link" href="findPwd">PW찾기</a></li>
		</ul>
	
		<form id="findId" method="get" autocomplete="off">
		<h1>아이디 찾기</h1><br>
	  	<p style="font-weight: bold">아이디는 가입할때 입력한 이름과 이메일,전화번호를 입력하여 찾을수 있습니다.</p>
	  	<br>
		<div class="inputInfo">
			<label> Name</label><br>
			<input type="text" name="name" id="name" class="form-control" value="" size="40">
		</div>	
		<div class="inputInfo">
			<label> Email</label><br>
			<input type="text" name="email" id="email" class="form-control" value="" size="40">
		</div>
		<div class="inputInfo">
			<label> Phone</label><br>
			<input type="text" name="phone" id="phone" class="form-control" value="" size="40"
				maxlength="13" onKeyup="inputPhoneNumber(this)">
		</div>
		<div>
			<input type="button" value="아이디 찾기" onclick="findMemberId()" 
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">	
			<input type="button" value="로그인화면으로 돌아가기" onclick="idok()"
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
		</div>
		</form>
	</div>
</body>
 
