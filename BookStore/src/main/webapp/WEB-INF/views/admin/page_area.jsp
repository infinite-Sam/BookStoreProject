<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${bookVO.cate1=='d'&&bookVO.cate2=='1'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=d&cate2=1&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate2?cate1=d&cate2=1&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=d&cate2=1&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
		<c:when test="${bookVO.cate1=='d'&&bookVO.cate2=='2'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=d&cate2=2&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate2?cate1=d&cate2=2&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=d&cate2=2&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
		<c:when test="${bookVO.cate1=='d'&&bookVO.cate2=='3'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=d&cate2=3&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate2?cate1=d&cate2=3&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=d&cate2=3&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
		<c:when test="${bookVO.cate1=='d'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate1?cate1=d&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate1?cate1=d&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate1?cate1=d&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
	
	
	<c:when test="${bookVO.cate1=='f'&&bookVO.cate2=='1'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=f&cate2=1&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate2?cate1=f&cate2=1&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=f&cate2=1&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
	<c:when test="${bookVO.cate1=='f'&&bookVO.cate2=='2'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=f&cate2=2&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate2?cate1=f&cate2=2&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=f&cate2=2&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
	<c:when test="${bookVO.cate1=='f'&&bookVO.cate2=='3'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=f&cate2=3&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate2?cate1=f&cate2=3&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate2?cate1=f&cate2=3&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
	<c:when test="${bookVO.cate1=='f'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate1?cate1=f&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate1?cate1=f&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate1?cate1=f&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
	
	<c:when test="${bookVO.cate1=='f'}">
	<div class=paging>
		<div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<div class="page_button">
				<a href="admin_book_list_cate1?cate1=f&&pageNum=${pageMaker.startPage-1}">이전</a>
			</div>
		</c:if>
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<a href="admin_book_list_cate1?cate1=f&&pageNum=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageMaker.next&&pageMaker.endPage >0}">
			<div class="page_button">
				<a href="admin_book_list_cate1?cate1=f&&pageNum=${pageMaker.endPage+1}">다음</a>
			</div>
		</c:if>	
		</div>
	</div>
	</c:when>
</c:choose>