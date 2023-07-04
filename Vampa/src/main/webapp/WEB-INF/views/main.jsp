<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/main.css" >
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
			    <button class="dropbtn">국내 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<c:forEach items="${cate1}" var="cate"> 
			    		<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
			    	</c:forEach>	      		      		      
			    </div>			
			</div>
			<div class="dropdown">
			    <button class="dropbtn">국외 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<c:forEach items="${cate2}" var="cate"> 
			    		<a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a>
			    	</c:forEach>     		      		      
			    </div>			
			</div>
		</div>
		<div class="content_area">
			
				<div id="carouselCon">
					<div class="carousel-box">
					  <div class="carousel-inner">
					      <img src="resources/img/1.jpg" class="d-block w-100" alt="...">
					      <img src="resources/img/2.jpg" class="d-block w-100" alt="...">
					      <img src="resources/img/3.jpg" class="d-block w-100" alt="...">
					  </div>
					</div>
				    <button class="main_prev" type="button"><i class="fa-solid fa-chevron-left"></i></button>
	   			    <button class="main_next" type="button"><i class="fa-solid fa-chevron-right"></i></button>
				</div>
			 
			
		</div>
		
	<%@include file="footer.jsp"%>
	

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
	
 	$(document).ready(function(){
 		
 		
	}); 
		
		const prev = document.querySelector('.main_prev');
		const next = document.querySelector('.main_next');
		const carousel = document.querySelector('.carousel-inner');
		
		
		let index = 1;
		
		prev.addEventListener("click", function(){
			
			if(index == 3){
				$('.carousel-inner').css('transform', 'translateX(-768px)');
				index = 2;
			} else if(index == 2){
				$('.carousel-inner').css('transform', 'translateX(-0px)');
				index = 1;
			} else if(index == 1) {
				$('.carousel-inner').css('transform', 'translateX(-1536px)');
				index = 3;
			}
		});
		
		
		next.addEventListener("click", function(){
			if(index == 1){
				$('.carousel-inner').css('transform', 'translateX(-768px)');
				index = 2;
			} else if(index == 2){
				$('.carousel-inner').css('transform', 'translateX(-1536px)');
				index = 3;
			} else if(index == 3){
				$('.carousel-inner').css('transform', 'translateX(-0px)');
				index = 1;
			}
		});
		

</script>

</body>
</html>