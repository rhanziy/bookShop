<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/header.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/734a7daae5.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<!-- 로그인 하지 않았을 때 -->
				<c:if test = "${ member == null }">
					<li>
						<a href ="/member/login">로그인</a>
					</li>
					<li>
						<a href ="/member/join">회원가입</a>
					</li>
					<li>고객센터</li>
				</c:if>
				<!-- 로그인 했을 때 -->
				<c:if test="${member != null }">
					<!-- 관리자 계정 -->
					<c:if test="${ member.adminCk == 1 }">
						<li><a href="/admin/main">관리자 페이지</a>
					</c:if>
					<li>
						<a id="gnb_logout_button">로그아웃</a>
					</li>
					<li>마이홈</li>
					<li><a href="/cart/${member.memberId}">장바구니</a></li>
					<li>고객센터</li>
				</c:if>
			</ul>
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/main"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
			</div>
			<div class="search_area">
				<div class="search_wrap">
               		<form id="searchForm" action="/search" method="get">
               			<div class="search_input">
               				<select name="type">
               					<option value="T">책 제목</option>
               					<option value="A">작가</option>
               				</select>
               				<input type="text" name="keyword">
                   			<button class='btn search_btn'>
                   				<i class="fa fa-search" aria-hidden="true"></i>
                   			</button>                				
               			</div>
               		</form>
               	</div>
			</div>
			<div class="login_area">
				<!-- 로그인 했을 때 -->
				<c:if test ="${ member != null  }">
					<div class="login_success_area">
						<span><i class="fa-solid fa-user"></i> ${ member.memberName }</span>
						<span><i class="fa-solid fa-sack-dollar"></i><fmt:formatNumber value="${ member.money }" pattern="#,###.##" /></span>
						<span><i class="fa-solid fa-coins"></i> <fmt:formatNumber value="${ member.point }" pattern="#,###" /></span>
					</div>
				</c:if>
				
			</div>
			<div class="clearfix"></div>			
		</div>
		
</body>
</html>