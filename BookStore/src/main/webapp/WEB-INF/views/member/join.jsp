<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<%@ include file="../header.jsp" %>

<div align="center" style="margin-top: 80px;">
	<div class="stepLine">
		<div title="이용약관" class="stepDot"></div>
		<div title="정보입력" class="stepDot activeStep"></div>
		<div title="가입완료" class="stepDot"></div>
	</div>
</div>
	<br>
	<br>
	<br>
<form method="post" id="join" action="join" name="formm" autocomplete="off">
	<div class="container">
		<div class="insert">
			<table class="join">
				<caption>
					<h2>회원가입</h2>
				</caption>
				<tr>
					<td class="col1">이름</td>
					<td class="col2"><input type="text" name="name" id="name" class="form-control" maxlength="5" style="height: 25px; padding: 5px;"></td>
				</tr>
				<tr>
					<td class="col1">아이디</td>
					<td class="col2">
						<input type="text" name="id" id="id" class="form-control" value="${id}" maxlength="10" style="height: 25px; padding: 5px;">
						<p><span class="idCheck1">사용 가능한 아이디입니다.</span></p>
						<p><span class="idCheck2">아이디가 이미 존재합니다.</span></p>
					</td>
				</tr>
				<tr>
					<td class="col1">비밀번호</td>
					<td class="col2"><input type="password" name="pwd" id="pwd" class="form-control" maxlength="16" style="height: 25px; padding: 5px;">
						<p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~
								16자리</span>로 입력이 가능합니다.</p>
					</td>
				</tr>
				<tr>
					<td class="col1">비밀번호 확인</td>
					<td class="col2"><input type="password" name="pwdCheck" id="pwdCheck" class="form-control" maxlength="16" style="height: 25px; padding: 5px;"></td>
				</tr>
				<tr>
					<td class="col1">이메일</td>
					<td class="col2">
					<input type="text" id="email" class="form-control" name="email" style="height: 25px; padding: 5px;">
					<span class="mailChkBut">인증코드전송</span>
						<p><span class="emailCheck2">이메일이 이미 존재합니다.</span></p>
						<p><span class="num"> ex) id@domain.com</span></p>
					<input id="mailChkInput" class="form-control" disabled="disabled" style="height: 25px; padding: 5px;">
					<span class="mailcodeChk" name="mailcodeChk">인증코드확인</span>
						<p><span id="mailChkResult"></span></p>
					</td>
				</tr>
				<tr>
					<td class="col1">phone</td>
					<td class="col2">
					<input type="text" name="phone" id="phone" class="form-control" maxlength="13" style="height: 25px; padding: 5px;"
						onKeyup="inputPhoneNumber(this)" >
						<p>※휴대폰번호는 <span class="num">"-"를 제외한 숫자만 </span>입력해주세요.</p>
					</td>
				</tr>
				<tr>
					<td class="col1">주소</td>
					<td class="col2">
					<input type="text" name="zipnum" id="zipnum" size="10" class="form-control"placeholder="우편번호" style="height: 25px; padding: 5px;">
					<input type="button" value="주소 찾기" class="dup" 
						onclick="execPostCode();"><i class="fa fa-search"></i><br>
					<input type="text" name="addr" id="addr" class="form-control" size="40" placeholder="도로명 주소" style="margin-top:10px; height: 25px; padding: 5px;"><br>
					</td>
				</tr>
			</table>
		</div>
		<div class="create">
			<input class="but4" type="button" value="회원가입"
				onclick="formCheck(this.form)"> 
			<input class="but3" type="button" value="가입취소" onclick="location.href='login_form'">
		</div>
	</div>
</form>
<%@ include file="../footer.jsp" %>
  <script>
	//아이디 중복검사
  $('#id').on("propertychange change keyup paste input", function(){
	  var id = $('#id').val();	// .idc에 입력되는 값
		var data = {id : id} // '컨트롤에 넘길 데이터 이름' : '데이터(.idc에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "memberIdChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.idCheck1').css("display","inline-block");
					$('.idCheck2').css("display", "none");				
				} else {
					$('.idCheck2').css("display","inline-block");
					$('.idCheck1').css("display", "none");				
				}
			}
		}); // ajax 종료	
  });
	//이메일 중복검사
  $('#email').on("propertychange change keyup paste input", function(){
	  var email = $('#email').val();	// .email에 입력되는 값
		var data = {email : email} // '컨트롤에 넘길 데이터 이름' : '데이터(.email에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "memberEmailChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.emailCheck2').css("display", "none");				
				} else {
					$('.emailCheck2').css("display","inline-block");
				}
			}
		}); // ajax 종료	
  });
	
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