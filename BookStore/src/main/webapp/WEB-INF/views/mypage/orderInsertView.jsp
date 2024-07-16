<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../header.jsp"%>
<article style="margin-bottom: 50px; margin-top: 150px;">
    <form name="formm" id="cart_list" class="orderingList" method="post">
    <h1>주문정보</h1>
    <c:forEach items="${orderInsertList}" var="ov" end="0">
		<fieldset class="deliveryInfo">
			<legend>배송 정보</legend>
			<span>받는 사람 : ${ov.name}</span><br><br>
			<span>주 소 : [${ov.zipnum}] ${ov.addr}</span><br><br>
			<span>휴대폰 번호 : ${ov.phone}</span><br><br>
		</fieldset>
		<input type="button" value="배송정보수정" class="btn"
				onclick="update_order_info_form('${ov.id}')">
	</c:forEach>
      <table style="border-collapse: collapse;">
        <tr class="cartTitle" >
          <th>이미지</th>
          <th style="width: 400px;">도서명</th>
          <th style="padding-right: 20px;">수 량</th>
          <th>가 격</th>   
        </tr>
        <c:forEach items="${orderInsertList}" var="ov">
        <tr class="cartInfo">
        	<td><img src="images/book/${ov.image}"></td>      
          <td style="width: 400px;">
          	<a href="book_view?bseq=${ov.bseq}" target="_blank">
              <h3>${ov.title}</h3>              
          	</a>
          </td>
          <td><input type="hidden" name="oseq" id="oseq" value="${ov.oseq}">
          	<input  type="text" name="quantity" id="quantity" size="2" value="${ov.quantity}" readonly="readonly" style="cursor: default;">
			<span class="plusBtn"><img src="images/plusBtn.jpg" class="img1"></span>
          	<span class="minusBtn"><img src="images/minusBtn.jpg" class="img2"></span>
          	<input type="button" class="updateQuantity" value="수량변경">          
          </td>
          <td>${ov.price*ov.quantity} 원</td>      
        </tr>
        </c:forEach>
        <tr class="cartTotal">
          <th width="200px;"><a onclick="cancel_order()" style="color: yellow; cursor: pointer;">
          		<h3>주문취소 하기</h3></a></th>    
          <th colspan="1" style="text-align: right;"> 총 금액 : ${totalPrice} 원</th>
          <th colspan="2" style="padding-right: 15px;">
          	<a onclick="go_order_insert()" style="color: white; cursor: pointer;">
          		<h3>주문완료 하기</h3></a>
          </th>  
        </tr> 
      </table> 
    </form>
  </article>
<%@ include file="../footer.jsp"%>
<script>
//수량 버튼 조작
$(document).on("click", '.plusBtn', function(e){
	var quantity = $(this).parent("td").find("#quantity").val();
	$(this).parent("td").find("#quantity").val(++quantity);
});
$(document).on("click", '.minusBtn', function(e){
	var quantity = $(this).parent("td").find("#quantity").val();
	console.log(quantity);
	if(quantity>1){
		$(this).parent("td").find("#quantity").val(--quantity);
	}
	console.log(quantity);
});
$(document).on("click", ".updateQuantity", function(){
	var oseq = $(this).parent("td").find("#oseq").val();
	var quantity = $(this).parent("td").find("#quantity").val();
	$("#quantity").val(quantity);
	$("#oseq").val(oseq);
	$("#cart_list").attr("action", "updateQuantityOrderInfo?oseq="+oseq).submit();
});
</script>