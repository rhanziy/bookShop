<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/cart.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
 <script src="https://kit.fontawesome.com/734a7daae5.js" crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="header.jsp"%>
		<div class="content_area">
				<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section">
				
			</div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>
						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_bookPrice_input" value="${ci.bookPrice}">
									<input type="hidden" class="individual_salePrice_input" value="${ci.salePrice}">
									<input type="hidden" class="individual_bookCount_input" value="${ci.bookCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.salePrice * ci.bookCount}">
									<input type="hidden" class="individual_point_input" value="${ci.point}">
									<input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}">
									<input type="hidden" class="individual_bookId_input" value="${ci.bookId}">
								</td>
								<td class="td_width_2">
									<div class="image_wrap" data-bookid="${ci.imageList[0].bookId}" data-path="${ci.imageList[0].uploadPath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].fileName}">
										<img>
									</div>
								</td>
								<td class="td_width_3">${ci.bookName}</td>
								<td class="td_width_4 price_td">
									<del>정가 : <fmt:formatNumber value="${ci.bookPrice}" pattern="#,### 원" /></del><br>
									판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br>
									마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<button class="quantity_btn minus_btn">&lt;</button>
										<input type="text" value="${ci.bookCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">&gt;</button>
									</div>
									<a class="quantity_modify_btn" data-cartId="${ci.cartId}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.bookCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="delete_btn"  data-cartid="${ci.cartId}">
										<i class="fa-solid fa-trash-can"></i>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<ul>
						<li>총 상품 가격 <span class="totalPrice_span"></span></li>
						<li>배송비 <span class="delivery_price"></span></li>
						<li>총 주문 상품 수 <span class="totalKind_span"></span><span class="totalCount_span"></span></li>
					</ul>
					<div class="boundary_div">구분선</div>
					<ul>
						<li>총 결제 예상 금액 <span class="finalTotalPrice_span"></span></li>
						<li>총 적립 예상 마일리지 <span class="totalPoint_span"></span></li>
					</ul>
				</div>
			</div>
			
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			
			<!-- 수량 조정 form -->
			<form action="/cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="cartId" class="update_cartId">
				<input type="hidden" name="bookCount" class="update_bookCount">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
			
			<!-- 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="cartId" class="delete_cartId">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
			
			<!-- 주문 form -->
			<form action="/order/${member.memberId}" method="get" class="order_form">
				
			</form>
			
		</div>
	<%@include file="footer.jsp"%>
	
	<script>
	
		$(document).ready(function(){
			setTotalInfo()
			
			$('.image_wrap').each(function(i, obj){
				
				const bobj = $(obj);
				
				if(bobj.data("bookId")){
					
					const uploadPath = bobj.data("path");
					const uuid = bobj.data("uuid");
					const fileName = bobj.data("filename");
					
					const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
					
					$(this).find("img").attr("src", '/display?fileName=' + fileCallPath);
					
				} else {
					$(this).find("img").attr("src", '/resources/img/goodsNoImage.png');
				}
			});
			
			
		});
		
		
		$('.individual_cart_checkbox').on('change',function(){
			setTotalInfo($());
		});
		
		$('.all_check_input').on("click", function(){
			if($('.all_check_input').prop("checked")){
				$(".individual_cart_checkbox").prop("checked", true);
			} else {
				$(".individual_cart_checkbox").prop("checked", false);
			}
			
			setTotalInfo();
		});
		
		function setTotalInfo(){
	
			let totalPrice = 0;
			let totalCount = 0;
			let totalKind = 0;
			let totalPoint = 0;
			let deliveryPrice = 0;
			let finalTotalPrice = 0;
			
			$('.cart_info_td').each(function(i, e){
				
				if($(e).find(".individual_cart_checkbox").is(":checked") === true){
					
					totalPrice += parseInt($(e).find(".individual_totalPrice_input").val());
					totalCount += parseInt($(e).find(".individual_bookCount_input").val());
					totalKind += 1;
					totalPoint += parseInt($(e).find(".individual_totalPoint_input").val());
				}
			});
			
			
			
			/* 배송비 */
			if(totalPrice >= 30000){
				deliveryPrice = 0;
			} else if (totalPrice == 0){
				deliveryPrice = 0;
			} else {
				deliveryPrice = 3000;
			}
			
			/* 최종 가격 */
			finalTotalPrice = totalPrice + deliveryPrice;
			
			/*값 삽입*/
			$('.totalPrice_span').text(totalPrice.toLocaleString() + "원");
			$('.totalKind_span').text(totalKind + "종");
			$('.totalCount_span').text(totalCount + "권");
			$('.totalPoint_span').text(totalPoint.toLocaleString());
			$('.delivery_price').text(deliveryPrice + "원");
			$('.finalTotalPrice_span').text(finalTotalPrice.toLocaleString() + "원");
			
		}
		
		
		
		/* 수량 버튼 */
		$('.plus_btn').on('click', function(){
			
			let quantity = $(this).parent('div').find('input').val();
			$(this).parent('div').find('input').val(++quantity);
			
		});
		
		$('.minus_btn').on('click',function(){
			
			let quantity = $(this).parent('div').find('input').val();
			if(quantity > 1){
				$(this).parent('div').find('input').val(--quantity);
			}
		});
		
		
		$(".quantity_modify_btn").on('click', function(){
			
			
			let cartId = $(this).data('cartid');
			let bookCount = $(this).parent('td').find('input').val();
			
			$(".update_cartId").val(cartId);
			$(".update_bookCount").val(bookCount);
			$(".quantity_update_form").submit(); 
		});
		
		/* 장바구니 삭제 버튼 */
		$('.delete_btn').on('click', function(e){
			
			e.preventDefault();
			
			const cartId = $(this).data("cartid");
			
			$('.delete_cartId').val(cartId);
			$('.quantity_delete_form').submit();
		});
		
		
		$('.order_btn').on('click', function(){
			
			let form_contents = '';
			
			$('.cart_info_td').each(function(i, e){
				
				if($(e).find(".individual_cart_checkbox").is(":checked") === true){
					
					let bookId = $(e).find(".individual_bookId_input").val();
					let bookCount = $(e).find(".individual_bookCount_input").val();
					
					let bookId_input = "<input name='orders["+ i +"].bookId' type='hidden' value='"+ bookId +"' >";
					form_contents += bookId_input;
					
					let bookCount_input = "<input name='orders["+ i +"].bookCount' type='hidden' value='"+ bookCount +"' >";
					form_contents += bookCount_input;
					
					
				}
			});
			
			$(".order_form").html(form_contents);
			$(".order_form").submit();
			
		});
		
	</script>
</body>
</html>