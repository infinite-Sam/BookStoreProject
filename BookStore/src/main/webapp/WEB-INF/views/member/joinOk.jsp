<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>	 
	
	<div align="center" style="margin-top: 80px; min-height: 700px">
		<div class="stepLine">
	        <div title="이용약관" class="stepDot"></div>
	        <div title="정보입력" class="stepDot"></div>
	        <div title="가입완료" class="stepDot activeStep"></div>
      	</div>
          <!--가입완료 안내 화면 -->
    <div class="joinOk_content" style="margin-top: 100px;">
		<p style="font-size: 40px; font-weight: bold; color: maroon;">
			회원가입이 완료 되었습니다.
		</p><br><br><br><br><br><br>
		<p style="font-size: 25px; font-weight: bold; color: green;">
			이용해 주셔서 감사합니다. 로그인 후 이용해보세요!
		</p>
		</div>
<br><br><br><br><br><br>
		<div class="create">
			<a href="login_form"><input class="but4" type="button" value="로그인"></a>
			<a href="index"><input class="but3" type="button" value="메인화면"></a>
		</div>
	</div>
<%@ include file="../footer.jsp" %>  