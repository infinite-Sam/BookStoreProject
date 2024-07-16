<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
<%@ include file="sidemenu.jsp" %>       
  <article>
      <form name="formm" method="post" id="cart_list" class="orderingList">
      <h2>주문내역</h2>
       <span style="font-size: 13px; margin-left: 270px;">
       		※ 배송정보수정 및 주문취소는 '주문완료(배송준비중)'상태일때만 가능합니다.<br>
       </span>
       <span style="font-size: 13px; margin-left: 285px;">
       		그 이후 배송정보수정 및 주문취소는 
       		<a href="qna_write_form" style="font-weight: bold; font-size: 17px; color: blue;">1대1문의</a>
       		<span style="color: red; font-weight: bold; font-size: 10px;">(주문번호를 적어주세요)</span>
       		를 통하여 가능하며, 추가 요금이 발생할 수 있습니다.<br>&nbsp;
       </span>
       <table style="border-collapse: collapse;">
       <tr class="cartTitle" >
       	<th>주문번호</th><th>이미지</th><th>상품명</th> <th>수 량</th>
       	<th>가 격</th> <th>주문일</th><th> 진행 상태 </th><th>&nbsp;</th>  
       </tr>
       <c:forEach items="${orderList}"  var="orderVO">
       <c:choose>
       <c:when test="${orderVO.result != '1' && orderVO.result != '2'}">
       <tr class="cartInfo">
       	<td>${orderVO.oseq}</td>
       	<td><img src="images/book/${orderVO.image}"></td>   
        <td>
            <a href="book_view?bseq=${orderVO.bseq}">
              <h3> ${orderVO.title} </h3>              
          </a>    
        </td>
        <td> ${orderVO.quantity} </td>
        <td> <fmt:formatNumber value="${orderVO.price*orderVO.quantity}" type="currency"/> </td>      
        <td>${orderVO.indate}</td>
        <c:choose>
       		<c:when test="${orderVO.result == '3'}">
       			<td>주문완료<br>(배송준비중)</td>
       			<td>
       			<input type="button" value="주문정보" class="btn2" onclick="getOrder('${orderVO.oseq}')"><br><br>
       			<input type="button" value="주문취소" class="btn2" 
       				onclick="order_cancel(${orderVO.oseq})">
       			</td>
       		</c:when>
       		<c:when test="${orderVO.result == '4'}">
       			<td>배송완료</td>
       			<td>
	       			<input type="button" value="주문정보" class="btn2" onclick="getOrder('${orderVO.oseq}')"><br><br>
	       			<input type="button" value="구매확정" class="btn2" 
	       				onclick="order_check(${orderVO.oseq})"><br><br>
       			</td>
       		</c:when>
       		<c:when test="${orderVO.result == '5'}">
       			<td>구매확정</td>
       			<td><input type="button" value="주문정보" class="btn2" onclick="getOrder('${orderVO.oseq}')"><br><br>
       				<input type="button" value="   리뷰   " class="btn2" onclick="getReply(${orderVO.oseq})"></td>
       		</c:when>
       		<c:when test="${orderVO.result == '0'}">
       			<td>취소완료</td>
       			<td><input type="button" value="주문정보" class="btn2" onclick="getOrder('${orderVO.oseq}')"></td>
       		</c:when>
       	</c:choose>
       
       </tr>
       </c:when>
       </c:choose>
       </c:forEach>
      </table>   
    </form>  
      <div style="text-align: center; margin-top: 50px;">
       <input type="button" value="쇼핑 하러가기" class="btn" onclick="location.href='index'" style="background-color: black; color: #d2ffd2; cursor: pointer; padding: 4px;">     
      </div>
  </article>
<%@ include file="../footer.jsp" %>