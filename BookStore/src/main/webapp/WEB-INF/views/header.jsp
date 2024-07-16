<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ page isELIgnored="false"%>

<%@ include file="css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookStore</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script src="js/index.js" type="text/javascript"></script>
<script src="js/findIdAndPwd.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
	<header>
		<div id="logo">
			<a href="index.html"> <img src="images/logo.png">
			</a>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<div id="go-login">
					<a href="login_form">로그인</a> | <a href="contract">회원가입</a>
				</div>
				<div class="search3">
					<form id="searchForm" method="get">
						<select id="searchOption" class="form-control" name="searchOption">
							<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
							<option value="all"
								<c:out value="${searchOption == 'all'?'selected':''}"/>>전체</option>
							<option value="title"
								<c:out value="${searchOption == 'title'?'selected':''}"/>>제목</option>
							<option value="author"
								<c:out value="${searchOption == 'author'?'selected':''}"/>>저자</option>
							<option value="pub"
								<c:out value="${searchOption == 'pub'?'selected':''}"/>>출판사</option>
						</select> <input type="text" id="keyword" name="keyword"
							class="form-control" placeholder="검색어를 입력하세요" autocomplete="off"
							value="${criteria.keyword}" />
						<button type="button" id="btnSearch" onclick="search()">검색</button>
					</form>
				</div>
				<nav>
					<ul>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid red; padding: 5px;">
								<a href="book_list_cate1?cate1=d">국내도서</a>
							</div>
							<div class="dd-content">
								<a href="book_list_cate2?cate1=d&cate2=1">여행</a> <a
									href="book_list_cate2?cate1=d&cate2=2">IT 모바일</a> <a
									href="book_list_cate2?cate1=d&cate2=3">자격증</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid orange; padding: 5px;">
								<a href="book_list_cate1?cate1=f">외국도서</a>
							</div>
							<div class="dd-content">
								<a href="book_list_cate2?cate1=f&cate2=1">어린이 유아</a> <a
									href="book_list_cate2?cate1=f&cate2=2">인문 사회</a> <a
									href="book_list_cate2?cate1=f&cate2=3">자연 과학</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid blue; padding: 5px;">
								<a href="bestSeller">Bestseller</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid purple; padding: 5px;">
								<a href="#" style="cursor: default;">service</a>
							</div>
							<div class="dd-content">
								<a href="notice_list">공지사항</a> <a href="qna_list">QnA</a>
							</div>
						</li>
					</ul>
				</nav>
			</c:when>
			<c:when test="${loginUser.type=='1'}">
				<div id="go-login">${sessionScope.loginUser.id}님
					환영합니다. &nbsp;&nbsp;&nbsp; <a href="logout">로그아웃</a> | <a
						href="member_view">마이페이지</a>
				</div>
				<div class="search3">
					<form id="searchForm" method="get">
						<select id="searchOption" class="form-control" name="searchOption">
							<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
							<option value="all"
								<c:out value="${searchOption == 'all'?'selected':''}"/>>전체</option>
							<option value="title"
								<c:out value="${searchOption == 'title'?'selected':''}"/>>제목</option>
							<option value="author"
								<c:out value="${searchOption == 'author'?'selected':''}"/>>저자</option>
							<option value="pub"
								<c:out value="${searchOption == 'pub'?'selected':''}"/>>출판사</option>
						</select> <input type="text" id="keyword" name="keyword"
							class="form-control" placeholder="검색어를 입력하세요" autocomplete="off"
							value="${criteria.keyword}" />
						<button type="button" id="btnSearch" onclick="search()">검색</button>
					</form>
				</div>
				<nav>
					<ul>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid red; padding: 5px;">
								<a href="book_list_cate1?cate1=d">국내도서</a>
							</div>
							<div class="dd-content">
								<a href="book_list_cate2?cate1=d&cate2=1">여행</a> <a
									href="book_list_cate2?cate1=d&cate2=2">IT 모바일</a> <a
									href="book_list_cate2?cate1=d&cate2=3">자격증</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid orange; padding: 5px;">
								<a href="book_list_cate1?cate1=f">외국도서</a>
							</div>
							<div class="dd-content">
								<a href="book_list_cate2?cate1=f&cate2=1">어린이 유아</a> <a
									href="book_list_cate2?cate1=f&cate2=2">인문 사회</a> <a
									href="book_list_cate2?cate1=f&cate2=3">자연과학</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid blue; padding: 5px;">
								<a href="bestSeller">Bestseller</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid purple; padding: 5px;">
								<a href="#" style="cursor: default;">service</a>
							</div>
							<div class="dd-content">
								<a href="notice_list">공지사항</a> <a href="qna_list">QnA</a>
							</div>
						</li>
					</ul>
				</nav>
			</c:when>
			<c:otherwise>
				<div id="go-login">
					${sessionScope.loginUser.name}님 환영합니다. &nbsp;&nbsp;&nbsp; <a
						href="logout">로그아웃</a> | <a href="admin_member_list">회원관리</a>
				</div>
				<div class="search3">
					<form id="searchForm" method="get">
						<select id="searchOption" class="form-control" name="searchOption">
							<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
							<option value="all"
								<c:out value="${searchOption == 'all'?'selected':''}"/>>전체</option>
							<option value="title"
								<c:out value="${searchOption == 'title'?'selected':''}"/>>제목</option>
							<option value="author"
								<c:out value="${searchOption == 'author'?'selected':''}"/>>저자</option>
							<option value="pub"
								<c:out value="${searchOption == 'pub'?'selected':''}"/>>출판사</option>
						</select> <input type="text" id="keyword" name="keyword"
							class="form-control" placeholder="검색어를 입력하세요" autocomplete="off"
							value="${criteria.keyword}" />
						<button type="button" id="btnSearch" onclick="search()">검색</button>
					</form>
				</div>
				<nav>
					<ul>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid red; padding: 5px;">
								<a href="book_list_cate1?cate1=d">국내도서</a>
							</div>
							<div class="dd-content">
								<a href="book_list_cate2?cate1=d&cate2=1">여행</a> <a
									href="book_list_cate2?cate1=d&cate2=2">IT 모바일</a> <a
									href="book_list_cate2?cate1=d&cate2=3">자격증</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid orange; padding: 5px;">
								<a href="book_list_cate1?cate1=f">외국도서</a>
							</div>
							<div class="dd-content">
								<a href="book_list_cate2?cate1=f&cate2=1">어린이 유아</a> <a
									href="book_list_cate2?cate1=f&cate2=2">인문 사회</a> <a
									href="book_list_cate2?cate1=f&cate2=3">자연 과학</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid blue; padding: 5px;">
								<a href="bestSeller">Bestseller</a>
							</div>
						</li>
						<li class="dd">
							<div class="dd-menu"
								style="border-top: 2px solid purple; padding: 5px;">
								<a href="#" style="cursor: default;">service</a>
							</div>
							<div class="dd-content">
								<a href="admin_notice_list">공지사항</a> <a href="admin_member_qna">QnA</a>
							</div>
						</li>
					</ul>
				</nav>
			</c:otherwise>
		</c:choose>
	</header>



	<!-- 본문시작 -->