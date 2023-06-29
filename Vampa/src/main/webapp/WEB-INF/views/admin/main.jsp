<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/adminCmn.css">
<link rel="stylesheet" href="../resources/css/footer.css">
 <style>
	 	.admin_content_wrap div{
	    margin-top: 280px;
	    text-align: center;
	    font-size: 50px;
	    font-weight: bolder;
	}
	 
 </style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
   <%@include file="./header.jsp" %>
       <div class="admin_content_wrap">
                 <div>관리자 페이지 입니다.</div>
       </div>
   <%@ include file = "../footer.jsp" %>
 
</body>
</html>