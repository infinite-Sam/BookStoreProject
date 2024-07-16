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
    <form name="formm" id="updateReply" method="post" autocomplete="off">
    <h2 style="text-align: center;">리뷰 수정</h2>
		<table style="border-collapse: collapse;">
		<tr><td><h3>주문정보</h3></td></tr>
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
      <br><br>
      	<span style="margin-left: 30px; font-size: 15px; font-weight: bold;">점 수</span>  
      	<select name="rating">
      		<option value="none">선택</option>
			<option value="1.0">1.0 ★☆☆☆☆</option>
			<option value="2.0">2.0 ★★☆☆☆</option>
			<option value="3.0">3.0 ★★★☆☆</option>
			<option value="4.0">4.0 ★★★★☆</option>
			<option value="5.0">5.0 ★★★★★</option>
	  </select>
	  <textarea name="content" id="content" class="form-control" style="width: 700px; height: 200px;">${updateReply.content}</textarea>
		
		<div class="updateGetOrderBtn">
			<input class="but4" type="button" id="udpateReplyBtn" value="리뷰수정" onclick="updateReply(${updateReply.oseq})"> 
			<input class="but3" type="button" value="취소" onclick="history.go(-1)">
		</div>
    </form>
</div>
</body>