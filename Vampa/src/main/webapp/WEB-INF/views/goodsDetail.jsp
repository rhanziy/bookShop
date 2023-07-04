<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<script src="https://kit.fontawesome.com/734a7daae5.js" crossorigin="anonymous"></script>
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
							재고 : <span class="stock_span">${goodsInfo.bookStock}</span>권
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
				<div class="reply_subject">
					<h3>독서 후기</h3>
					<c:if test="${member != null }">
						<span class="reply_button_wrap">
							<button>후기 작성</button>
						</span>
					</c:if>
				</div>
				
				<div class="reply_content">
					<div class="reply_not_div">
						
					</div>
					<ul>
						
					</ul>
					<div class="reply_pageInfo_div">
						<ul class="pageMaker">
						
						</ul>
					</div>
				</div>
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
			
			if(bobj.data("bookid")){
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
			
			
			/* 리뷰 표출 작업 */
			const bookId = '${goodsInfo.bookId}';
			
			$.getJSON("/reply/list", {bookId : bookId}, function(obj){
				makeReplyContent(obj);
			});
			
		});
		
		
		/* 댓글 페이지 정보 */
		const cri = {
			bookId : '${goodsInfo.bookId}',
			pageNum : 1,
			amount : 10
		}
		
		let replyListInit = function(){
			$.getJSON("/reply/list", cri, function(obj){
				makeReplyContent(obj);
			});
			
		}
		
		$(document).on("click", '.pageMaker_btn a', function(e){
			e.preventDefault();
			let page = $(this).attr("href");
			cri.pageNum = page;
			
			replyListInit();
		});
		
		$(document).on("click", ".update_reply_btn", function(e){
			e.preventDefault();
			let replyId = $(this).attr("href");
			let popUrl = "/replyUpdate?replyId=" + replyId + "&bookId=" + '${goodsInfo.bookId}' + "&memberId=" + '${member.memberId}';
			let popOption = "width=490px, height=490px, top=300px, left=300px, scrollbars=yes"
		
			window.open(popUrl, "리뷰 수정", popOption);
		});
		
		$(document).on("click", ".delete_reply_btn", function(e){
			e.preventDefault();
			let replyId = $(this).attr("href");
			
			$.ajax({
				data : {
					replyId : replyId,
					bookId : '${goodsInfo.bookId}'
				},
				url : '/reply/delete',
				type : 'POST',
				success : function(result){
					replyListInit();
					alert('삭제가 완료되었습니다.');
				}
			});
		});
		
		/* 댓글(리뷰) 동적 생성 메서드 */
		function makeReplyContent(obj){
			
			if(obj.list.length === 0){
				$(".reply_not_div").css('display','block');
				$(".reply_not_div").html('<span>등록된 리뷰가 없습니다.</span>');
				$(".reply_content ul").html('');
				$(".pageMaker").html('');
			} else {
				
				$(".reply_not_div").css('display','none');
				
				const list = obj.list;
				const pf = obj.pageInfo;
				const userId = '${member.memberId}';
				

				let reply_list = '';
				
				$(list).each(function(i, obj){
					
					let rating = Math.floor(obj.rating);
					let star = '&#xf005';
 					
					reply_list += '<li>';
					reply_list += '<div class="comment_wrap">';
					reply_list += '<div class="reply_top">';
					
					// 아이디
					reply_list += '<span class="id_span">' + obj.memberId + '</span>';
					
					//날짜
					reply_list += '<span class="date_span">' + obj.regDate + '</span>';
					
					//평점
						reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ star.repeat(rating) +'</span></span>'; 
					
					if(obj.memberId === userId){
						reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
					}			  
					
					reply_list += '</div>'; //<div class="reply_top">
					reply_list += '<div class="reply_bottom">';
					reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
					reply_list += '</div>';//<div class="reply_bottom">
					reply_list += '</div>';//<div class="comment_wrap">
					reply_list += '</li>';
								  
				});
				
				
				$('.reply_content ul').html(reply_list);
				
				
				/* 페이지 버튼 */
				let reply_pageMaker = '';
				
				/* prev */
				if(pf.prev){
					let prev_num = pf.pageStart -1;
					reply_pageMaker += '<li class="pageMaker_btn prev">';
					reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
					reply_pageMaker += '</li>';	
				}
				/* number btn */
				for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
					reply_pageMaker += '<li class="pageMaker_btn ';
					if(pf.cri.pageNum === i){
						reply_pageMaker += 'active';
					}
					reply_pageMaker += '">';
					reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
					reply_pageMaker += '</li>';
				}
				/* next */
				if(pf.next){
					let next_num = pf.pageEnd +1;
					reply_pageMaker += '<li class="pageMaker_btn next">';
					reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
					reply_pageMaker += '</li>';	
				}			
				
				$(".pageMaker").html(reply_pageMaker);
				
			}
			
		}
		
		
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
			
			let stock = parseInt($('.stock_span').html());
			let bookCount = parseInt($('.quantity_input').val());
			
			console.log(quantity);
			console.log(bookCount);
			console.log(stock);
			
			
			if(stock <= 0){
				alert('재고가 부족합니다.');
				return;
			} else if(bookCount > stock){
				alert('재고가 부족합니다.');
				return;
			} 
			
			form.bookCount = bookCount;
			
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
			
			let stock = $('.stock_span').html();
			let bookCount = $('.quantity_input').val();
	
			if(stock <= 0){
				alert('재고가 부족합니다.');
				return;
			} else if(bookCount > stock){
				alert('재고가 부족합니다.');
				return;
			} 
		
			$('.order_form').find('input[name="orders[0].bookCount"]').val(bookCount);
			$('.order_form').submit();	
		});
		
		
		$('.reply_button_wrap').on('click',function(e){
			e.preventDefault();
			
			const memberId = '${member.memberId}';
			const bookId = '${goodsInfo.bookId}';

			$.ajax({
				data : {
					bookId: bookId,
					memberId : memberId
				},
				url : '/reply/check',
				type : 'POST',
				success : function(result){
					if(result == 1){
						alert("이미 등록된 리뷰가 존재합니다.");
					} else {

						let popUrl = '/replyEnroll/' + memberId + "?bookId=" + bookId;
						let popOption = "width=490px, height=490px, top=300px, left=300px, scrollbars=yes";
						
						window.open(popUrl, "리뷰 작성", popOption);
					
					}
				}
			});
			
		});
		
	</script>
</body>
</html>