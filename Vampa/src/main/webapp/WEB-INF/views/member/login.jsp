<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous">
	</script>
	<link rel="stylesheet" href="/resources/css/member/login.css">
	
</head>
<body>

<div class="wrapper">
	
	<div class="wrap">
		<form id="login_form" method="post">
			<div class="logo_wrap">
				<a href="/main"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
			</div>
			<div class="login_wrap"> 
				<div class="id_wrap">
						<div class="input_box">
						<input type="text" class="id_input" name="memberId" placeholder="아이디">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="input_box">
						<input type="password" class="pw_iput" name="memberPw" placeholder="비밀번호">
					</div>
				</div>
				
				<c:if test ="${result == 0}">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				
				
				<div class="login_button_wrap">
					<div class="login_button">로그인</div>
					<div><a href ="/member/join">회원가입</a></div>
				</div>			
			</div>
		</form>
		
	</div>

</div>

<script>

	// 로그인 버튼 클릭 메서드
	$('.login_button').click(function(){
		
		// alert('로그인 버튼 작동');
		$('#login_form').attr("action", "/member/login.do");
		$('#login_form').submit();
	});

	</script>

</body>
</html>