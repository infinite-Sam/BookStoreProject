<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sidemenu.jsp"%>
  
  	<c:set var="i" value="0" />
 	<c:set var="j" value="4" />
		<h1 class="listh1">베스트셀러</h1>
	<table class="list">
    	<c:forEach items="${bestSeller}" var="best">
			<c:if test="{i%j == 0}">
				<tr>	
			</c:if>
					<td>
						<a href="book_view?bseq=${best.bseq}"> 
						<!-- <a href="admin_book_view?bseq=${bookVO.bseq}"> --> 
						<img src="images/book/${best.image}"></a>
					<div class="info">	
						<h2>
							<a href="book_view?bseq=${best.bseq}">
								${book.title}</a>
						</h2>
						<p><span>${best.author}</span></p>
						<p><span style="color: red; font-size: 20px;">${best.price}</span>원</p>
						<p><span>${best.pub}</span></p>
						<p><span>${best.rating}/5.0(${best.replyCount}Reviews)</span></p>
						<p>			
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
						</p>
					</div>
					</td>
			<c:if test="${i%j == j-1}">
				</tr>
			</c:if>	
		<c:set var="i" value="${i+1}" />
		</c:forEach>
	</table>
	<div class="search">
		<form id="searchForm2" method="get">
			<select id="searchOption" class="form-control" name="searchOption">
				<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
	            <option value="all" <c:out value="${searchOption == 'all'?'selected':''}"/> >전체</option>
	            <option value="title" <c:out value="${searchOption == 'title'?'selected':''}"/> >제목</option>
	            <option value="author" <c:out value="${searchOption == 'author'?'selected':''}"/> >저자</option>
	            <option value="pub" <c:out value="${searchOption == 'pub'?'selected':''}"/> >출판사</option>
			</select>
			<input type="text" id="keyword2" name="keyword" class="form-control" placeholder="검색어를 입력하세요" autocomplete="off"
			 		value="${criteria.keyword}"/>
			<button type="button" id="btnSearch" onclick="search2()">검색</button>
		</form>
	</div>
<%@ include file="../footer.jsp" %>    