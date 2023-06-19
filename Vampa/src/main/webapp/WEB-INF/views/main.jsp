<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/734a7daae5.js" crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="header.jsp"%>
		
		<div class="navi_bar_area">
			<div class="dropdown">
			    <button class="dropbtn">국내서적</button>
			    <div class="dropdown-content">
			    	<a href="/search?type=C&cateCode=202001">교양</a>
			    	<a href="#">테스트2</a>
			    	<a href="#">테스트3</a>
			    	<a href="#">테스트4</a>
			    	<a href="#">테스트5</a>
			    	<a href="#">테스트6</a>	      		      		      
			    </div>			
			</div>
			<div class="dropdown">
			    <button class="dropbtn">국외서적</button>
			    <div class="dropdown-content">
			    	<a href="#">테스트1</a>
			    	<a href="#">테스트2</a>
			    	<a href="#">테스트3</a>
			    	<a href="#">테스트4</a>
			    	<a href="#">테스트5</a>
			    	<a href="#">테스트6</a>	      		      		      
			    </div>			
			</div>
		</div>
		<div class="content_area">
			<h1>content area</h1>
		</div>
		
	<%@include file="footer.jsp"%>
	
</div>

<script>

	/* gnb_area 로그아웃 버튼 작동 */
	$("#gnb_logout_button").click(function(){
	
		$.ajax({
			type : "POST",
			url : "/member/logout.do",
			success : function(data){
				document.location.reload();
			}
		})
		
	});
	
	
/* 	$('.dropdown').mouseover(function(){
		$('.dropdown-content').css('display', 'block');
		console.log("over");
	});
	 */

</script>

</body>
</html>