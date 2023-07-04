<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/734a7daae5.js" crossorigin="anonymous"></script>
   <style type="text/css">
  	/* 창 여분 없애기 */
  	body{
  		margin : 0;
  		padding: 0 ;
  		box-sizing:border-box;
  		overflow:hidden;
  	}
  	/* 전체 배경화면 색상 */
  	.wrapper_div{
		width:100%;
	    height: 100%;
  	}
 	/* 팝업창 제목 */
  	.subject_div{
	    width: 100%;
	    background-color: #404040;
	    color: white;
	    padding: 10px;
	    font-weight: bold;
  	}
  	
  	/* 컨텐츠, 버튼 영역 padding */
  	.input_wrap{
  		padding: 30px 20px;
  	}
  	.btn_wrap{
  		text-align: center;
  	}
  	
  	/* 버튼 영역 */
  	.cancel_btn{
  		margin-right:5px;
  	    display: inline-block;
	    width: 130px;
	    background-color: #404040;
	    padding-top: 10px;
	    height: 27px;
	    color: #fff;
	    font-size: 14px;
	    line-height: 18px;  	
  	}
  	.update_btn{
   	    display: inline-block;
	    width: 130px;
	    background-color: #808080;
	    padding-top: 10px;
	    height: 27px;
	    color: #fff;
	    font-size: 14px;
	    line-height: 18px;   	
  	}

	/* 책제목 영역 */
	.bookName_div h2{
		margin : 0;
	}
  	/* 평점 영역 */
  	.rating_div{
  		margin-top:10px;
  		padding-top: 10px;
  	}
  	.rating_div h4{
  		margin : 0;
  	}
  	select{
	    width: 120px;
	    height: 40px;
	  	margin: 15px 0;
	  	font-family: "Font Awesome 5 Free";
	    font-size: 15px;
	    font-weight: 600;  
	    letter-spacing:-2.5px;	
  	}
  	select option {
  	  font-size: 15px;
	  font-family: "Font Awesome 5 Free";
	  font-weight: 600;  
  	  color:#FFBC00;
  	  letter-spacing:-5px;
  }
  	/* 리뷰 작성 영역 */
  	.content_div{
  		padding: 10px 20px 0 0;
  	}
  	.content_div h4{
  		margin : 0;
  	}
  	textarea{
		width: 100%;
	    height: 100px;
	    border: 1px solid #dadada;
	    padding: 12px 8px 12px 8px;
	    font-size: 15px;
	    color: #a9a9a9;
	    resize: none;
	    margin-top: 10px;  	
  	}
  
  </style>
</head>
<body>
	<div class="wrapper_div">
		<div class="subject_div">
			리뷰 수정
		</div>
		<div class="input_wrap">			
			<div class="bookName_div">
				<h2>${bookInfo.bookName}</h2>
			</div>
			<div class="rating_div">
				<h4>평점</h4>
				<select name="rating">
					<option value="1">
						&#xf005
					</option>
					<option value="2">
						&#xf005 &#xf005
					</option>
					<option value="3">
						&#xf005 &#xf005 &#xf005
					</option>
					<option value="4">
						&#xf005 &#xf005 &#xf005 &#xf005
					</option>
					<option value="5">
						&#xf005 &#xf005 &#xf005 &#xf005 &#xf005
					</option>
				</select>
			</div>
			<div class="content_div">
				<h4>리뷰</h4>
				<textarea name="content">${replyInfo.content }</textarea>
			</div>
		</div>
		<div class="btn_wrap">
			<a class="cancel_btn">취소</a><a class="update_btn">수정</a>
		</div>
	</div>
	<script>
		
		$(document).ready(function(){
			
			let rating = '${replyInfo.rating}';
			
			$("option").each(function(i, obj){
				
				if(rating === $(obj).val()){
					$(obj).attr("selected", "selected");
				}
				
			});
				
		});

			
		$(".cancel_btn").on("click",function(){
			window.close();
		});	
			
		$(".update_btn").on("click",function(){
			
			const replyId = '${replyInfo.replyId}';
			const bookId = '${replyInfo.bookId}';
			const memberId = '${memberId}';
			const rating = $('select').val();
			const content = $("textarea").val();
			
			
			const data = {
					replyId : replyId,
					bookId : bookId,
					memberId : memberId,
					rating : rating,
					content : content
			}
			
			$.ajax({
				data : data,
				type : 'POST',
				url : '/reply/update',
				success : function(result){
					$(opener.location).attr("href", "javascript:replyListInit();");
					window.close();
				}
			});
			
		});
		
	</script>
</body>
</html>