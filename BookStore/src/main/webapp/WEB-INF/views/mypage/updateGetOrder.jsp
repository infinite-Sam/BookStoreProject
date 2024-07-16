<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../header.jsp" %>  
	<%@ include file="sidemenu.jsp" %>  
<!DOCTYPE html>
<div class="findInfo" style="min-height: 500px; margin-top: 100px;float: none;">
    <form name="formm" id="updateGetOrder" class="orderingList" method="post" autocomplete="off">
    <h2 style="text-align: center;">배송정보수정</h2>
		<div class="container">
		<div class="insert">
			<table class="join">
				<tr>
					<td class="col1">받는사람</td>
					<td class="col2">
						<input type="text" name="name" id="name" class="form-control" style="height: 25px; padding: 5px;" value="${updateGetOrder.name}">
					</td>
				</tr>
				<tr>
					<td class="col1">전화번호</td>
					<td class="col2">
					<input type="text" name="phone" id="phone" class="form-control" maxlength="13" style="height: 25px; padding: 5px;" value="${updateGetOrder.phone}"
						onKeyup="inputPhoneNumber(this)" >
						<p>※휴대폰번호는 <span class="num">"-"를 제외한 숫자만 </span>입력해주세요.</p>
					</td>
				</tr>
				<tr>
					<td class="col1">주소</td>
					<td class="col2">
					<input type="text" name="zipnum" id="zipnum" size="10" class="form-control"placeholder="우편번호" style="height: 25px; padding: 5px;" value="${updateGetOrder.zipnum}">
					<input type="button" value="주소 찾기" class="dup" 
						onclick="execPostCode();"><i class="fa fa-search"></i><br>
					<input type="text" name="addr" id="addr" class="form-control" size="40" placeholder="도로명 주소" style="margin-top:10px; height: 25px; padding: 5px;" value="${updateGetOrder.addr}"><br>
					</td>
				</tr>
			</table>
		</div>
		<div class="updateGetOrderBtn">
			<input class="but4" type="submit" value="배송정보수정" onclick="updateGetOrder('${updateGetOrder.oseq}')"> 
			<input class="but3" type="button" value=취소 onclick="location.href='order_list'">
		</div>
	</div>
    </form>
</div>
  <%@ include file="../footer.jsp" %>  