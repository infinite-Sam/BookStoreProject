<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  

<c:choose>
    <c:when test="${sessionScope.loginUser.type == '2'}">
		<div style="min-height: 650px;">
	<h1 style="margin: 150px 0px 30px 45%;">Admin</h1>
	<div class=submenu>
		<hr style="border: 1.5px solid black; width: 85%; text-align: center;">
		<br>
		<ul>
			<li><a href="admin_member_list">회원관리</a></li>
			<li><a href="admin_order_list">주문/배송내역</a></li>
			<li><a href="admin_member_qna">QnA</a></li>
			<li><a href="admin_notice_list">공지사항</a></li>
		</ul>
		</br>
		<hr style="border: 1.5px solid black; width: 85%; text-align: center;">
	</div>
	</div>
	</c:when>
	
	<c:otherwise>
	<!-- 슬라이드쇼 -->
	<div class="slideshow-container">
		<div class="mySlides fade">
	        <img src="images/slide1.jpg">
	        <div class="slide-text">남의 책을 많이 읽어라. <br>남이 고생하여 얻은 지식을 아주 쉽게 내 것으로 만들 수 있고, <br>그것으로 자기 발전을 이룰 수 있다.<br><br> - 소크라테스</div>
		</div>	 
		<div class="mySlides fade">
	        <img src="images/slide2.jpg">
	        <div class="slide-text">책을 많이 읽는다고 해서 영향력 있는 리더가 되지 않는다. <br>하지만 영향력 있는 리더들은 대부분 책벌레였다. <br>리더(Leader)는 리더(Reader)이다.</div>
		</div>	 
		<div class="mySlides fade">
	        <img src="images/slide3.jpg">
	        <div class="slide-text">좋은 책을 읽는다는 것은 <br>과거의 가장 훌륭한 사람들과 대화하는 것이다. <br><br>- 데카르트</div>
		</div>	 
		<div class="mySlides fade">
	        <img src="images/slide4.jpg">
	        <div class="slide-text">독서가 정신에 미치는 효과는 운동이 몸에 미치는 효과와 같다. <br><br> - 리처드 스틸</div>
		</div>	 
		<div class="mySlides fade">
	        <img src="images/slide5.jpg">
	        <div class="slide-text">당신은 결코 독서보다 더 좋은 방법을 찾을 수 없을 것이다. <br><br> - 워렌 버핏</div>
		</div>
	   		<a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      		<a class="next" onclick="moveSlides(1)">&#10095;</a>
	    <div style="text-align:center">
	      <span class="dot" onclick="currentSlide(0)">1</span>
	      <span class="dot" onclick="currentSlide(1)">2</span>
	      <span class="dot" onclick="currentSlide(2)">3</span>
	      <span class="dot" onclick="currentSlide(3)">4</span>
	      <span class="dot" onclick="currentSlide(4)">5</span>
	    </div>
	</div>

	<div class="place">
		<div class="part_name">Bestseller</div>
		<div class="plus_view"><a href="bestSeller">더보기 +</a></div>
	<c:forEach items="${bestSeller}" var="best">    
	    <div class="single_place">
           <img src="images/book/${best.image}">
           <div class="info">
               <h3>${best.title}</h3>
               <p>저자: ${best.author}<br>출판사: ${best.pub}<br>가격: ${best.price}원</p><br><br>
               <div class="place_review">
                   <span>${best.rating} (${best.replyCount} review)</span><br><br>
               	<div>
               		<c:if test="${best.rating==1}">
						<img src="images/1star.jpg">
					</c:if>
					<c:if test="${best.rating>1&&best.rating<2}">
						<img src="images/1.5star.jpg">
					</c:if>
					<c:if test="${best.rating==2}">
						<img src="images/2star.jpg">
					</c:if>
					<c:if test="${best.rating>2&&best.rating<3}">
						<img src="images/2.5star.jpg">
					</c:if>
					<c:if test="${best.rating==3}">
						<img src="images/3star.jpg">
					</c:if>
					<c:if test="${best.rating>3&&best.rating<4}">
						<img src="images/3.5star.jpg">
					</c:if>
					<c:if test="${best.rating==4}">
						<img src="images/4star.jpg">
					</c:if>
					<c:if test="${best.rating>4&&best.rating<5}">
						<img src="images/4.5star.jpg">
					</c:if>
					<c:if test="${best.rating==5}">
						<img src="images/5star.jpg">
					</c:if>
				</div>
               </div>
               <a href="book_view?bseq=${best.bseq}" class="place_btn">상세보기</a>
           </div>
	    </div>
	</c:forEach>
	</div>
	
	<div class="index_d">
		<div class="part_name">국내도서</div>
		<div class="plus_view"><a href="book_list_cate1?cate1=d">더보기 +</a></div>
	<c:forEach items="${bookCateD}" var="bcd">	
		<div class="single-d">
			<a href="book_view?bseq=${bcd.bseq}"><img src="images/book/${bcd.image}"></a>
			<div class=info>
				<h2 style="width: 260px;"><a href="book_view?bseq=${bcd.bseq}">${bcd.title}</a></h2>
				<span>${bcd.author}</span><br>
				<span>${bcd.price}원</span><br>
				<span>${bcd.pub}</span><br>
				<span class="main_rating">
					${bcd.rating}/5.0(${bcd.replyCount}Reviews)<br>
					<c:if test="${bcd.rating==1}">
						<img src="images/1star.jpg">
					</c:if>
					<c:if test="${bcd.rating>1&&bcd.rating<2}">
						<img src="images/1.5star.jpg">
					</c:if>
					<c:if test="${bcd.rating==2}">
						<img src="images/2star.jpg">
					</c:if>
					<c:if test="${bcd.rating>2&&bcd.rating<3}">
						<img src="images/2.5star.jpg">
					</c:if>
					<c:if test="${bcd.rating==3}">
						<img src="images/3star.jpg">
					</c:if>
					<c:if test="${bcd.rating>3&&bcd.rating<4}">
						<img src="images/3.5star.jpg">
					</c:if>
					<c:if test="${bcd.rating==4}">
						<img src="images/4star.jpg">
					</c:if>
					<c:if test="${bcd.rating>4&&bcd.rating<5}">
						<img src="images/4.5star.jpg">
					</c:if>
					<c:if test="${bcd.rating==5}">
						<img src="images/5star.jpg">
					</c:if>
				</span>
			</div>
		</div>
	</c:forEach>
	</div>
	
	<div class="index_f">
	<div class="part_name">외국도서</div>
		<div class="plus_view"><a href="book_list_cate1?cate1=f">더보기 +</a></div>
			<c:forEach items="${bookCateF}" var="bcf">	
		<div class="single-f">
			<a href="book_view?bseq=${bcf.bseq}"><img src="images/book/${bcf.image}"></a>
			<div class=info>
				<h2><a href="book_view?bseq=${bcf.bseq}">${bcf.title}</a></h2>
				<span>${bcf.author}</span><br>
				<span>${bcf.price}원</span><br>
				<span>${bcf.pub}</span><br>
				<span class="main_rating">
					${bcf.rating}/5.0(${bcf.replyCount}Reviews)<br>
					<c:if test="${bcf.rating==1}">
						<img src="images/1star.jpg">
					</c:if>
					<c:if test="${bcf.rating>1&&bcf.rating<2}">
						<img src="images/1.5star.jpg">
					</c:if>
					<c:if test="${bcf.rating==2}">
						<img src="images/2star.jpg">
					</c:if>
					<c:if test="${bcf.rating>2&&bcf.rating<3}">
						<img src="images/2.5star.jpg">
					</c:if>
					<c:if test="${bcf.rating==3}">
						<img src="images/3star.jpg">
					</c:if>
					<c:if test="${bcf.rating>3&&bcf.rating<4}">
						<img src="images/3.5star.jpg">
					</c:if>
					<c:if test="${bcf.rating==4}">
						<img src="images/4star.jpg">
					</c:if>
					<c:if test="${bcf.rating>4&&bcf.rating<5}">
						<img src="images/4.5star.jpg">
					</c:if>
					<c:if test="${bcf.rating==5}">
						<img src="images/5star.jpg">
					</c:if>
				</span>
			</div>
		</div>
	</c:forEach>
		</div>
	</c:otherwise>
</c:choose>
<%@ include file="footer.jsp" %>    
