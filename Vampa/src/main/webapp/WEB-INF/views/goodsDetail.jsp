<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
</head>
<body>
	
	<%@include file="header.jsp"%>
	
		<div class="content_area">
			<div class="content_top">
				<div class="ct_left_area">
					<div class="image_wrap" data-bookid="${goodsInfo.imageList[0].bookId}" data-path="${goodsInfo.imageList[0].uploadPath}" data-uuid="${goodsInfo.imageList[0].uuid}" data-filename="${goodsInfo.imageList[0].fileName}">
						<img>
					</div>				
				</div>
				<div class="ct_right_area">
					<div class="title">
						<h1>
							${goodsInfo.bookName}
						</h1>
					</div>
					<div class="line">
					</div>
					<div class="author">
						 <span>
						 	${goodsInfo.authorName} 지음
						 </span>
						 <span>|</span>
						 <span>
						 	${goodsInfo.publisher}
						 </span>
						 <span>|</span>
						 <span class="publeyear">
						 	
						 </span>
					</div>
					<div class="line">
					</div>	
					<div class="price">
						<div class="sale_price">정가 : <fmt:formatNumber value="${goodsInfo.bookPrice}" pattern="#,### 원" /></div>
						<div class="discount_price">
							판매가 : <span class="discount_price_number"><fmt:formatNumber value="${goodsInfo.bookPrice - (goodsInfo.bookPrice*goodsInfo.bookDiscount)}" pattern="#,### 원" /></span> 
							[<fmt:formatNumber value="${goodsInfo.bookDiscount*100}" pattern="###" />% 
							<fmt:formatNumber value="${goodsInfo.bookPrice*goodsInfo.bookDiscount}" pattern="#,### 원" /> 할인]
						</div>	
						<div>
							적립 포인트 : <span class="point_span"></span>원
						</div>						
					</div>			
					<div class="line">
					</div>	
					<div class="button">						
						<div class="button_quantity">
							주문수량
							<span>
								<button class="minus_btn">&lt;</button>
									<input type="text" class="quantity_input" value="1">
								<button class="plus_btn">&gt;</button>
							</span>
						</div>
						<div class="button_set">
							<a class="btn_cart">장바구니 담기</a>
							<a class="btn_buy">바로구매</a>
						</div>
					</div>
				</div>
			</div>
			<div class="detail line">
			</div>				
			<div class="content_middle">
				<div class="book_intro">
					${goodsInfo.bookIntro}
				</div>
				<div class="book_content">
					${goodsInfo.bookContents }
				</div>
			</div>
			<div class="detail line">
			</div>				
			<div class="content_bottom">
				리뷰
			</div>
			
			
			<!-- 주문 form -->
			<form action="/order/${member.memberId }" method="get" class="order_form">
				<input type="hidden" name="orders[0].bookId" value="${goodsInfo.bookId }">
				<input type="hidden" name="orders[0].bookCount" value="">
			</form>
			
		</div>

	<%@include file="footer.jsp"%>
	
	<script>
		$(document).ready(function(){
			
			const bobj = $('.image_wrap');
			
			if(bobj.data("bookId")){
				const uploadPath = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("filename");
				
				const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
				
			} else {
				bobj.find("img").attr('src', '/resources/img/goodsNoImage.png');
			}
			
			
			const year = "${goodsInfo.publeYear}";
			
			let tempYear = year.substr(0,10);
			
			let yearArray = tempYear.split("-");
			let publeYear = yearArray[0] + "년 " + yearArray[1] + "월 " + yearArray[2] + "일";
			
			
			$(".publeyear").html(publeYear);
			
			
			let price = "{goodsInfo.bookPrice}";
			let salePrice = "${goodsInfo.bookPrice - (goodsInfo.bookPrice * goodsInfo.bookDiscount)}";
			
			function pointCalc(price, salePrice){
				
				let point = '';
				
				if(price == Math.floor(salePrice)){
					point = price * 0.05;
				} else {
					point = salePrice * 0.05;
				}
				
				point = Math.floor(point);
				$(".point_span").text(point);
			}
			
			pointCalc(price, salePrice);
			
			
			
			
		});
		
		
		let quantity = $(".quantity_input").val();
		
		$('.plus_btn').click(function(e){
			e.preventDefault();
			$(".quantity_input").val(++quantity);
		});
		
		$('.minus_btn').click(function(e){
			e.preventDefault();
			if(quantity > 1){
				$(".quantity_input").val(--quantity);
			}
		});
		
		const form = {
			
			memberId : '${member.memberId}',
			bookId : '${goodsInfo.bookId}',
			bookCount : '',
			
		}
		
		$('.btn_cart').click(function(e){
			
			form.bookCount = quantity;
			
			$.ajax({
				url : '/cart/add',
				type : 'POST',
				data : form,
				success : function(result){
					cartAlert(result);
				}
			})
			
		});
		
		function cartAlert(result){
			if(result == '0'){
				alert('장바구니에 추가할 수 없습니다.');
			} else if(result == '1'){
				alert('장바구니에 추가되었습니다.');
			} else if(result == '2'){
				alert('장바구니에 이미 담긴 상품입니다.');
			} else if(result == '5'){
				alert('로그인이 필요합니다.');
			}
		}
		
		
		$('.btn_buy').on('click',function(){
			let bookCount = $('.quantity_input').val();
			$('.order_form').find('input[name="orders[0].bookCount"]').val(bookCount);
			$('.order_form').submit();
		});
		
		
	</script>
</body>
</html>