<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../header.jsp" %>  
	<%@ include file="sidemenu.jsp" %>    
<!DOCTYPE html>
<article style="overflow-x:hidden; overflow-y:hidden;">
    <form name="formm" id="cart_list" class="orderingList" method="post">
    <h1>주문정보</h1>
		<fieldset class="deliveryInfo">
			<legend>배송 정보</legend>
			<span>받는 사람 : ${getOrder.name}</span><br><br>
			<span>주 소 : [${getOrder.zipnum}] ${getOrder.addr}</span><br><br>
			<span>휴대폰 번호 : ${getOrder.phone}</span><br><br>
		</fieldset>
	<c:if test="${getOrder.result=='3'}">
		<input type="button" value="배송정보수정" class="btn"
				onclick="updateGetOrderForm('${getOrder.oseq}')">
	</c:if>
      <table style="border-collapse: collapse;">
        <tr class="cartTitle" >
          <th>이미지</th>
          <th style="width: 400px;">도서명</th>
          <th style="padding-right: 20px;">수 량</th>
          <th>가 격</th>   
        </tr>
        <tr class="cartInfo">
        	<td><img src="images/book/${getOrder.image}"></td>      
          <td style="width: 400px;">
          	<a href="book_view?bseq=${getOrder.bseq}" target="_blank">
              <h3> ${getOrder.title}</h3>              
          	</a>
          </td>
          <td>${getOrder.quantity}권</td> 
          <td>${getOrder.price*getOrder.quantity} 원</td>      
        </tr>
      </table>
          <div class="create">
			<input class="but3" type="button" value="주문목록돌아가기" onclick="location.href='order_list'">
		</div> 
    </form>
  </article>
<%@ include file="../footer.jsp" %>  