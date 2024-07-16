<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../../header.jsp" %>  
<%@ include file="../member/sidemenu.jsp" %>       
  <article>
       <form name="formm" method="post" id="cart_list" class="orderingList">
       <h2>주문/배송내역</h2>
        <table style="border-collapse: collapse;">
       <tr class="orderTitle" style="font-size: 20px;">
       	<th>주문번호</th>
       	<th>이미지</th>
        <th style="width: 150px;">상품명</th> 
        <th>수 량</th><th>가 격</th> <th>주문일</th>
        <th style="width: 120px;">주문ID</th>
        <th>받는사람</th> <th>주소</th> 
        <th style="width: 120px;">연락처</th>
        <th style="width: 120px;">진행 상태 </th>
        <th></th>    
       </tr>
       <c:forEach items="${orderList}"  var="ol">
       <c:choose>
       <c:when test="${orderVO.result != '1' && orderVO.result != '2'}">
       <tr class="cartInfo">
       	<td style="width: 100px;">${ol.oseq}</td>  
       	<td style="width: 80px;">
       		<img src="images/book/${ol.image}">
       	</td>   
        <td style="width: 200px;">
            <a href="book_view?bseq=${ol.bseq}">
              <h3> ${ol.title} </h3>              
          </a>    
        </td>
        <td style="width: 70px;">
        	${ol.quantity} 
        </td>
        <td style="width: 70px;"> 
        	<fmt:formatNumber value="${ol.price*ol.quantity}" type="currency"/> 
        </td>      
        <td>${ol.indate}</td>
        <td style="width: 80px;">${ol.id}</td>
        <td> ${ol.name}</td>
        <td style="width: 400px;"> [${ol.zipnum}] ${ol.addr}</td>
        <td style="width: 150px;"> ${ol.phone}</td>
        
        <c:choose>
       		<c:when test="${ol.result == '3'}">
       			<td>주문완료<br>(배송준비중)</td>
       			<td>
       			<input type="button" value="배송완료" class="btn2" style="clear: both;"
       				onclick="admin_order_ok(${ol.oseq})">
       			</td>
       		</c:when>
       		<c:when test="${ol.result == '4'}">
       			<td>배송완료</td>
       			<td></td>
       		</c:when>
       		<c:when test="${ol.result == '5'}">
       			<td>구매확정</td>
       			<td></td>
       		</c:when>
       		<c:otherwise>
       			<td>취소완료</td>
       			<td></td>
       		</c:otherwise>
       	</c:choose>
       </tr>
       </c:when>
       </c:choose>
       </c:forEach>
      </table>   
    </form>  
  </article>
<%@ include file="../../footer.jsp" %>