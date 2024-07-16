<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../css.jsp"%>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script src="js/index.js" type="text/javascript"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>.
<!DOCTYPE html>
<body style="overflow-x:hidden; overflow-y:hidden;">
<div class="reply">
   <form name="formm" id="getReply" method="post" autocomplete="off">
    <h2 style="text-align: center;">리뷰 상세보기</h2>
    <h3 style="text-align: center; margin-top: 50px;">주문정보</h3>
		<table style="border-collapse: collapse;">
        <tr class="bookTitle" >
          <th>이미지</th>
          <th style="width: 400px;">도서명</th>
          <th>가 격</th>  
          <th>수량</th> 
        </tr>
        <tr class="bookInfo">
        	<td><img src="images/book/${getOrder.image}"></td>      
          <td style="width: 400px;">
          	<a href="book_view?bseq=${getOrder.bseq}" target="_blank">
              <h3> ${getOrder.title}</h3>              
          	</a>
          </td>
          <td>${getOrder.price} 원</td>
          <td>${getOrder.quantity} 권</td>  
        </tr>
      </table>
		<h3 style="text-align: center; margin-top: 50px; margin-bottom: 30px;">리뷰</h3>
		<c:choose>
		<c:when test="${getReply.content == null}">
			<span style="margin-left: 280px; font-weight: bold; font-size: 15px;">등록된 리뷰가 없습니다.</span>
			<div class="updateGetOrderBtn">
				<input class="but4" type="button" value="리뷰작성" onclick="insertReplyForm(${getOrder.oseq})">
				<input class="but3" type="button" value="닫기" onclick="window.close()">
			</div>
		</c:when>
		<c:otherwise>
				<ul style="margin-left: 50px;">
					<li style="font-size: 15px;">
					<c:if test="${getReply.rating==1}">
						<img src="images/1star.jpg">
					</c:if>
					<c:if test="${getReply.rating==2}">
						<img src="images/2star.jpg">
					</c:if>
					<c:if test="${getReply.rating==3}">
						<img src="images/3star.jpg">
					</c:if>
					<c:if test="${getReply.rating==4}">
						<img src="images/4star.jpg">
					</c:if>
					<c:if test="${getReply.rating==5}">
						<img src="images/5star.jpg">
					</c:if>
					${getReply.rating}/5.0</li>
					<li style="font-size: 18px;">${getReply.content}</li>
					<li style="font-size: 13px; font-weight: bold;">${getReply.indate}</li>
				</ul>
			<div class="updateGetOrderBtn">
				<input class="but4" type="button" value="리뷰수정" onclick="updateReplyForm(${getReply.oseq})">
				<input class="but4" type="button" value="리뷰삭제" onclick="deleteReply(${getReply.rseq})">
				<input class="but3" type="button" value="닫기" onclick="window.close()">
			</div>
		</c:otherwise>
		</c:choose>		
    </form>
</div>
</body>
