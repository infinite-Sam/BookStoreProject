<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sidemenu.jsp"%>

<form name="formm" class="bookView" id="book_detail" method="post" autocomplete="off">
	<h1>${bookVO.title}</h1>
	<hr>
	<div class="bookImage">
		<img src="images/book/${bookVO.image}">
	</div>
	<div class="bookInfo">
		<h2>${bookVO.title}</h2>
		<hr style="margin-bottom: 20px;">
		<p><label>저 자 : </label>&nbsp;&nbsp;${bookVO.author}</p>
		<p><label>출판사 : </label>&nbsp;&nbsp;${bookVO.pub}</p>
		<p><label>출간일 : </label> &nbsp;&nbsp;${bookVO.pub_date}</p>
		<p><label>가 격 : </label>&nbsp;&nbsp;<span style="font-size: 33px; color: blue;">${bookVO.price}</span>원</p>
		<p><label>리 뷰 : </label>
		<c:if test="${countReply!=0}">
			<c:if test="${avgReply==1}">
				<img src="images/1star.jpg">
			</c:if>
			<c:if test="${avgReply>1&&avgReply<2}">
				<img src="images/1.5star.jpg">
			</c:if>
			<c:if test="${avgReply==2}">
				<img src="images/2star.jpg">
			</c:if>
			<c:if test="${avgReply>2&&avgReply<3}">
				<img src="images/2.5star.jpg">
			</c:if>
			<c:if test="${avgReply==3}">
				<img src="images/3star.jpg">
			</c:if>
			<c:if test="${avgReply>3&&avgReply<4}">
				<img src="images/3.5star.jpg">
			</c:if>
			<c:if test="${avgReply==4}">
				<img src="images/4star.jpg">
			</c:if>
			<c:if test="${avgReply>4&&avgReply<5}">
				<img src="images/4.5star.jpg">
			</c:if>
			<c:if test="${avgReply==5}">
				<img src="images/5star.jpg">
			</c:if>
			<span style="color: black; font-size: 15px;">(${avgReply}/5.0 ${countReply}Reviews)</span>
		</c:if>
		<c:if test="${countReply==0}">
			<span style="color: black; font-size: 15px;">등록된 리뷰가 없습니다.</span>
		</c:if>
		</p>
		<br>
		<label style="font-size: 20px;"> 수 량 : </label>
          <input  type="text" name="quantity" id="quantity" size="2" value="1" readonly="readonly" style="cursor: default;">
          	<span class="plusBtn"><img src="images/plusBtn.jpg" class="img1"></span>
          	<span class="minusBtn"><img src="images/minusBtn.jpg" class="img2"></span>
          <input  type="hidden" name="bseq" value="${bookVO.bseq}">
          <input  type="hidden" name="image" value="${bookVO.image}">
          <input  type="hidden" name="title" value="${bookVO.title}">
          <input  type="hidden" name="price" value="${bookVO.price}">
          <input  type="hidden" name="name" value="${loginUser.name}">
          <input  type="hidden" name="zipnum" value="${loginUser.zipnum}">
          <input  type="hidden" name="addr" value="${loginUser.addr}">
          <input  type="hidden" name="phone" value="${loginUser.phone}">
        <div class="orderButtons">  
			<input type="button" value="장바구니" class="obtn"
				onclick="go_cart()" style="background-color: #0000a6;"> &nbsp;&nbsp;
			<input type="button" value="바로구매" class="obtn"
				onclick="go_order()" style="background-color: #005e5e;">
		</div>
	</div>
	<hr>
	<div class="bookContent">
			<span>${bookVO.info}</span><br><br><hr style="width:100%;">
		<a href="book_list_cate2?cate1=${bookVO.cate1}&cate2=${bookVO.cate2}">
			<input type="button" value="목록보기" class="btn">
		</a>
	<c:if test="${loginUser.type == '2'}">
		<input type="button" value="수정하기" class="btn"
			onclick="admin_book_update(${bookVO.bseq})"> 
		<input type="button" value="삭제하기" class="btn"
			onclick="admin_book_delete(${bookVO.bseq})">
	</c:if>
	</div>
	<!-- 댓글 -->
		<div class="review">
			<h1>Review</h1>
			<span style="font-weight: bold; font-size: 13px">
				리뷰는 구매하신분들만 작성할 수 있습니다.
			</span>
		<hr style="border: 2px solid black; margin-bottom: 10px;">
		<c:if test="${replyCount==0}">
		<ul><li style="margin-left: 170px;">
		<span style="font-size: 20px;">	
			등록된 리뷰가 없습니다.
		</span>
		</li></ul>
		</c:if>
		<c:forEach items="${listReply}" var="lr">
				<ul>
					<li>
						<span style="font-weight: bold; font-size: 23px;">${lr.id}</span>
					<c:if test="${lr.rating==1}">
						<img src="images/1star.jpg">
					</c:if>
					<c:if test="${lr.rating==2}">
						<img src="images/2star.jpg">
					</c:if>
					<c:if test="${lr.rating==3}">
						<img src="images/3star.jpg">
					</c:if>
					<c:if test="${lr.rating==4}">
						<img src="images/4star.jpg">
					</c:if>
					<c:if test="${lr.rating==5}">
						<img src="images/5star.jpg">
					</c:if>
					${lr.rating}/5.0
					<c:if test="${lr.id==loginUser.id}">
						<span style="color: blue; font-size: 18px; font-weight: bold; padding-left: 20px;">MyReview!</span>
						<a onclick="getReply(${lr.oseq})" style="cursor: pointer; font-size: 13px; color: green;">
							리뷰상세보기(수정/삭제)
						</a>
					</c:if>
					</li>
					<li style="font-size: 18px;">${lr.content}</li>
					<li style="font-size: 13px; font-weight: bold;">${lr.indate}</li>
				</ul>
				<hr style="margin-bottom: 10px; width:600px; color: black;">
		</c:forEach>
			<hr style="border: 2px solid black">
		</div>
</form>
<%@ include file="../footer.jsp"%>

<script>
//수량 버튼 조작
$(document).on("click", '.plusBtn', function(e){
	e.preventDefault();
	var quantity = $('#quantity').val();
	var num = parseInt(quantity,10);
	num++;
	$('#quantity').val(num);
});
$(document).on("click", '.minusBtn', function(e){
	e.preventDefault();
	var quantity = $('#quantity').val();
	var oseq = $('#oseq').val();
	$('#oseq').val(oseq);
	var num = parseInt(quantity,10);
	num--;
	if(num<=0){
	num =1;
	}
	$('#quantity').val(num);
});

</script>