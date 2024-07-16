<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../css.jsp" %>
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <script src="js/index.js" type="text/javascript"></script>

<body style="overflow-x:hidden; overflow-y:hidden;">
	<div class="findInfo">
		<ul class="navInfo nav-info">
			<li class="navInfo-item"><a class="navInfo-link"
				aria-current="page" href="findId">ID찾기</a></li>
			<li class="navInfo-item"><a class="navInfo-link active" href="findPwd">PW찾기</a></li>
		</ul>
	
		<form id="findPwd" method="get" autocomplete="off">
		<h1>비밀번호 찾기</h1><br>
	  	<p style="font-weight: bold">비밀번호는 가입할때 입력한 이름과 아이디, 이메일, 전화번호를 입력하고,
	  			<br> 이메일인증을 받은 후 찾을수 있습니다.</p>
	  	<br>
		<div class="inputInfo">
			<label> Name</label><br>
			<input type="text" name="name" id="name" class="form-control" value="" size="40">
		</div>	
		<div class="inputInfo">
			<label> ID</label><br>
			<input type="text" name="id" id="id" class="form-control" value="" size="40">
		</div>	
		<div class="inputInfo">
			<label> Email</label><br>
			<input type="text" name="email" id="email" class="form-control" value="" size="40">
			<span class="mailChkBut">인증코드전송</span>
			<input id="mailChkInput" class="form-control" disabled="disabled">
			<span class="mailcodeChk" name="mailcodeChk">인증코드확인</span>
			<p><span id="mailChkResult"></span></p>
		</div>
		<div class="inputInfo">
			<label> Phone</label><br>
			<input type="text" name="phone" id="phone" class="form-control" value="" size="40"
				maxlength="13" onKeyup="inputPhoneNumber(this)">
		</div>
		<div>
			<input type="button" value="비밀번호 찾기" onclick="findMemberPwd()" 
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">	
			<input type="button" value="로그인화면으로 돌아가기" onclick="idok()"
				style="padding:5px; margin-top: 13px; color:white; background-color: black; cursor: pointer;">
		</div>
		</form>
	</div>
</body>
<script>
  /* 인증번호 이메일 전송 */
  var code = ""; //이메일전송 인증번호 저장위한 코드
  $(document).on("click", ".mailChkBut", function(){
  	  var email = $("#email").val();  // 입력한 이메일
  	  var chkBox = $("#mailChkInput");  // 인증번호 입력란
  	  var chk = confirm("해당 이메일로 인증코드를 발송하시겠습니까?");
  	  if(chk){
  	    if(email == ''){
  	    	alert("이메일을 입력해주세요.");
  	    } else {
  	    $.ajax({
  	    	type:"GET",
  	    	url:"/mailCheck?email="+email,
  	    	cache : false,
  	      	success:function(data){
             chkBox.attr("disabled",false);
             code = data;
             console.log(data);
             console.log(email);
          	}
  	    }); // ajax종료
  	    alert("인증코드를 발송하였습니다.");
  	    }
  	  }
  });

  /* 인증번호 비교 */
  $(document).on("click", ".mailcodeChk", function(){
      var inputCode = $("#mailChkInput").val();        // 입력코드    
      var checkResult = $("#mailChkResult");    // 비교 결과     
      
      if(inputCode == code){                            // 일치할 경우
          checkResult.html("인증코드가 일치합니다.");
          checkResult.attr("class", "correct");        
      } else {                                            // 일치하지 않을 경우
          checkResult.html("인증코드를 다시 확인해주세요.");
          checkResult.attr("class", "incorrect");
      }    
  });
  </script>