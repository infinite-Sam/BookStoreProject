<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%@ include file="sidemenu.jsp" %>
  <article style="margin-bottom: 20px">
    <form name="formm"  id="cart_list" method="post">
	<input type="hidden" name="id" value="${loginUser.id}">
    <h2>장바구니</h2>
    <c:choose>
    <c:when test= "${cl.size() == 0}">
      <h3 style="color: red;text-align: center;"> 장바구니가 비었습니다. </h3> 
    </c:when>
    <c:when test= "${cl.size() != 0}">
      <table style="border-collapse: collapse;">
        <tr class="cartTitle" >
          <th>이미지</th>
          <th style="width: 400px;">도서명</th>
          <th style="padding-right: 20px;">수 량</th>
          <th>가 격</th>   
          <th>선 택</th>
          <th>&nbsp;&nbsp;&nbsp;</th>
        </tr>
        
        <c:forEach items="${cartList}"  var="cl" varStatus="status">
        <tr>
        	<td><img src="images/book/${cl.image}"></td>      
          <td style="width: 400px;">
          <a href="book_view?bseq=${cl.bseq}" target="_blank">
              <h3> ${cl.title}</h3>              
          </a></td>
          <td>
          	<input type="hidden" name="oseq" id="oseq" value="${cl.oseq}">
          	<input  type="text" name="quantity" id="quantity" size="2" value="${cl.quantity}" readonly="readonly" style="cursor: default;">
          	<span class="plusBtn"><img src="images/plusBtn.jpg" class="img1"></span>
          	<span class="minusBtn"><img src="images/minusBtn.jpg" class="img2"></span>
          	<input type="button" class="updateQuantity" value="수량변경">
          </td>
          <td> 
            ${cl.price*cl.quantity} 원
          </td>      
          <td> 
          	<input type="checkbox" class="chkbox" name="oseq" value= "${cl.oseq}" checked="checked"> 
          </td>
          <td>
          <input type="button" value="삭제" class="btn" onclick="location.href='cart_delete?oseq='+${cl.oseq}">
        	</td>
        </tr>
        </c:forEach>
        <tr class="cartTotal">        
          <th colspan="4" style="text-align: right;"> 총 금액 : ${totalPrice} 원</th>
          <th colspan="2">
          	<a href="#" onclick="order_insert_by_cart()" style="color: white;">
          		<h3>주문하기</h3></a>
          </th>  
        </tr> 
      </table> 
    </c:when>  
    </c:choose>  
     
    <div class="clear"></div>
     
    <div class="buttons">
      <input type="button" value="쇼핑 하러가기" class="btn" onclick="location.href='index'">    
     </div>
    </form>
  </article>
<%@ include file="../footer.jsp" %>
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
	$("#cart_list").attr("action", "updateQuantity?oseq="+oseq).submit();
});
</script>