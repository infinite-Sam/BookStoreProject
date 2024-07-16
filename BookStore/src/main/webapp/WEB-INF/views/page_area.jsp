<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
<c:choose>
	<c:when test="${bookVO.cate1=='d'&&bookVO.cate2=='1'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=d&cate2=1&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link"
						href="book_list_cate2?cate1=d&cate2=1&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=d&cate2=1&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>

	<c:when test="${bookVO.cate1=='d'&&bookVO.cate2=='2'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=d&cate2=2&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link"
						href="book_list_cate2?cate1=d&cate2=2&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=d&cate2=2&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>

	<c:when test="${bookVO.cate1=='d'&&bookVO.cate2=='3'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=d&cate2=3&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link"
						href="book_list_cate2?cate1=d&cate2=3&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=d&cate2=3&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>

	<c:when test="${bookVO.cate1=='d'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate1?cate1=d&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link" href="book_list_cate1?cate1=d&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate1?cate1=d&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>


	<c:when test="${bookVO.cate1=='f'&&bookVO.cate2=='1'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=f&cate2=1&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link"
						href="book_list_cate2?cate1=f&cate2=1&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=f&cate2=1&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>

	<c:when test="${bookVO.cate1=='f'&&bookVO.cate2=='2'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=f&cate2=2&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link"
						href="book_list_cate2?cate1=f&cate2=2&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=f&cate2=2&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>

	<c:when test="${bookVO.cate1=='f'&&bookVO.cate2=='3'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=f&cate2=3&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link"
						href="book_list_cate2?cate1=f&cate2=3&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate2?cate1=f&cate2=3&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>

	<c:when test="${bookVO.cate1=='f'}">
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate1?cate1=f&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link" href="book_list_cate1?cate1=f&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="book_list_cate1?cate1=f&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:when>
	<c:when test="${bookVO.cate1=='b'}">
	
	</c:when>
	
	<c:otherwise>
		<div class=paging>
			<ul class="pagination">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="search?searchOption=${pageMaker.cri.searchOption}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.startPage-1}"><</a>
					</li>
				</c:if>
				<!-- 현재 페이지버튼 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a class="page-link" href="search?searchOption=${pageMaker.cri.searchOption}&keyword=${pageMaker.cri.keyword}&pageNum=${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="search?searchOption=${pageMaker.cri.searchOption}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.endPage+1}">></a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:otherwise>
</c:choose>



