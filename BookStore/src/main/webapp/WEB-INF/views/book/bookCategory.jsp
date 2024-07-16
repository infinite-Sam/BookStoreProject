<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<%@ include file="sidemenu.jsp"%>
  
  	<c:set var="i" value="0" />
 	<c:set var="j" value="4" />
 	
 	<c:choose>
 	<c:when test="${bookVO.cate1 == 'd'&&bookVO.cate2 =='1'}">
		<h1 class="listh1">국내도서 > 여행</h1>
	</c:when>
	<c:when test="${bookVO.cate1 == 'd'&&bookVO.cate2 =='2'}">
		<h1 class="listh1">국내도서 > IT 모바일</h1>
	</c:when>
	<c:when test="${bookVO.cate1 == 'd'&&bookVO.cate2 =='3'}">
		<h1 class="listh1">국내도서 > 자격증</h1>
	</c:when>
 	<c:when test="${bookVO.cate1 == 'd'}">
		<h1 class="listh1">국내도서</h1>
	</c:when>
	
	<c:when test="${bookVO.cate1 == 'f'&&bookVO.cate2 =='1'}">
		<h1 class="listh1">외국도서 > 어린이 유아</h1>
	</c:when>
	<c:when test="${bookVO.cate1 == 'f'&&bookVO.cate2 =='2'}">
		<h1 class="listh1">외국도서 > 인문 사회</h1>
	</c:when>
	<c:when test="${bookVO.cate1 == 'f'&&bookVO.cate2 =='3'}">
		<h1 class="listh1">외국도서 > 자연 과학</h1>
	</c:when>
		<c:when test="${bookVO.cate1 == 'f'}">
		<h1 class="listh1">외국도서</h1>
	</c:when>
		<c:when test="${bookVO.cate1 == 'b'}">
		<h1 class="listh1">베스트셀러</h1>
	</c:when>
	</c:choose>
	<table class="list">
	<c:choose>
		<c:when test="${bookListSize<=0}">
			<tr>
      			<td width="100%" colspan="7" align="center" height="23">
       				 등록된 상품이 없습니다.
				</td>
			</tr>
    	</c:when>
    	<c:otherwise>
    	<c:forEach items="${bookList1}" var="book">
			<c:if test="{i%j == 0}">
				<tr>	
			</c:if>
					<td>
						<a href="book_view?bseq=${book.bseq}"> 
						<!-- <a href="admin_book_view?bseq=${bookVO.bseq}"> --> 
						<img src="images/book/${book.image}"></a>
					<div class="info">	
						<h2>
							<a href="book_view?bseq=${book.bseq}">
								${book.title}</a>
						</h2>
						<p><span>${book.author}</span></p>
						<p><span style="color: red; font-size: 20px;">${book.price}</span>원</p>
						<p><span>${book.pub}</span></p>
						<p><span>${book.rating}/5.0(${book.replyCount}Reviews)</span></p>
						<p>			
							<c:if test="${book.rating==1}">
								<img src="images/1star.jpg">
							</c:if>
							<c:if test="${book.rating>1&&book.rating<2}">
								<img src="images/1.5star.jpg">
							</c:if>
							<c:if test="${book.rating==2}">
								<img src="images/2star.jpg">
							</c:if>
							<c:if test="${book.rating>2&&book.rating<3}">
								<img src="images/2.5star.jpg">
							</c:if>
							<c:if test="${book.rating==3}">
								<img src="images/3star.jpg">
							</c:if>
							<c:if test="${book.rating>3&&book.rating<4}">
								<img src="images/3.5star.jpg">
							</c:if>
							<c:if test="${book.rating==4}">
								<img src="images/4star.jpg">
							</c:if>
							<c:if test="${book.rating>4&&book.rating<5}">
								<img src="images/4.5star.jpg">
							</c:if>
							<c:if test="${book.rating==5}">
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
		<c:forEach items="${bookList2}" var="bookVO">
			<c:if test="{i%j == 0}">
				<tr>	
			</c:if>
					<td>
						<a href="book_view?bseq=${bookVO.bseq}"> 
						<!-- <a href="admin_book_view?bseq=${bookVO.bseq}"> --> 
						<img src="images/book/${bookVO.image}"></a>
					<div class="info">	
						<h2 style="width:250px;">
							<a href="book_view?bseq=${bookVO.bseq}">
								${bookVO.title}</a>
						</h2>
						<p><span>${bookVO.author}</span></p>
						<p><span style="color: blue; font-size: 20px;">${bookVO.price}</span>원</p>
						<p><span>${bookVO.pub}</span></p>
						<p><span>${bookVO.rating}/5.0(${bookVO.replyCount}Reviews)</span></p>
						<p>			
							<c:if test="${bookVO.rating==1}">
								<img src="images/1star.jpg">
							</c:if>
							<c:if test="${bookVO.rating>1&&bookVO.rating<2}">
								<img src="images/1.5star.jpg">
							</c:if>
							<c:if test="${bookVO.rating==2}">
								<img src="images/2star.jpg">
							</c:if>
							<c:if test="${bookVO.rating>2&&bookVO.rating<3}">
								<img src="images/2.5star.jpg">
							</c:if>
							<c:if test="${bookVO.rating==3}">
								<img src="images/3star.jpg">
							</c:if>
							<c:if test="${bookVO.rating>3&&bookVO.rating<4}">
								<img src="images/3.5star.jpg">
							</c:if>
							<c:if test="${bookVO.rating==4}">
								<img src="images/4star.jpg">
							</c:if>
							<c:if test="${bookVO.rating>4&&bookVO.rating<5}">
								<img src="images/4.5star.jpg">
							</c:if>
							<c:if test="${bookVO.rating==5}">
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
		</c:otherwise>	
	</c:choose>
	</table>
		 <c:if test="${loginUser.type=='2'}">
			<div class="list_buttons">
				<input type="button" value="등록하기" class="btn"
					onclick="location.href='admin_book_write_form'">
			</div>
		</c:if>

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
<%@ include file="../page_area.jsp"%>
<%@ include file="../footer.jsp" %>    