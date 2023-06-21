<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<link rel="stylesheet" href="/resources/css/order.css" >
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
		
		<div class="content_area">
			<div class="content_subject"><span>장바구니</span></div>
			<div class="content_main">
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">${memberInfo.memberName} | ${memberInfo.memberMail}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAddress('1')" style="background-color: #3c3838;">상용자 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAddress('2')" >직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${memberInfo.memberName}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${memberInfo.memberAddr1} ${memberInfo.memberAddr2}<br>${memberInfo.memberAddr3}										
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address2_input" readonly="readonly"><br>
											<input class="address3_input" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
					</div>
					<!-- 상품 테이블 -->
					<div class="goods_subject_div">
						<ul>
							<li>이미지</li>
							<li>상품정보</li>
							<li>판매가</li>
						</ul>
					</div>
					<table class="goods_table">				
						<tbody>
							<c:forEach items="${orderList}" var="ol">
								<tr>
									<td class="goods_table_img_td">
										<!-- 이미지 <td>-->
									</td>
									<td class="goods_table_name_td">${ol.bookName}</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.salePrice}" pattern="#,### 원" /> | 수량 ${ol.bookCount}개
										<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
										<br>[<fmt:formatNumber value="${ol.totalPoint}" pattern="#,### 원" />P]
										<input type="hidden" class="individual_bookPrice_input" value="${ol.bookPrice}">
										<input type="hidden" class="individual_salePrice_input" value="${ol.salePrice}">
										<input type="hidden" class="individual_bookCount_input" value="${ol.bookCount}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.salePrice * ol.bookCount}">
										<input type="hidden" class="individual_point_input" value="${ol.point}">
										<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}">
										<input type="hidden" class="individual_bookId_input" value="${ol.bookId}">
									</td>
								</tr>							
							</c:forEach>
			
						</tbody>
					</table>
				</div>
				<div class="point_div">
					<div class="point_div_subject">포인트 사용</div>
					<table class="point_table">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>포인트 사용</th>
								<td>
									${memberInfo.point} | <input class="order_point_input" value="0">원 
									<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
									<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
		
	<%@include file="footer.jsp"%>
	
	<script>
	
		function showAddress(className){
			
			/*컨텐츠 동작*/
			/*모두 숨기기*/
			$(".addressInfo_input_div").css('display', 'none');
			
			/*컨텐츠 보이기*/
			$(".addressInfo_input_div_" + className).css('display', 'block');			
			
			/* 버튼 색상 변경 */
			/* 모든 색상 동일 */
			$(".address_btn").css("backgroundColor", '#555');
			/* 지정 색상 변경 */
			$(".address_btn_" + className).css('backgroundColor', '#3c3838');
			
		}
		
		
		function execution_daum_address(){
	 		console.log("동작");
		   new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 	// 추가해야할 코드
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                      addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	             	// 제거해야할 코드
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $(".address1_input").val(data.zonecode);
	                $(".address2_input").val(addr);				
	                // 커서를 상세주소 필드로 이동한다.
	                $(".address3_input").attr("readonly", false);
	                $(".address3_input").focus();	 
		        }
		    }).open();  	
		   }
		
		$('.order_point_input').on("propertychange change keyup paste input", function(){
			
			const maxPoint = parseInt('${memberInfo.point}');
			
			let inputValue = parseInt($(this).val());
			
			if(inputValue < 0) {
				$(this).val(0);
			} else if(inputValue > maxPoint){
				$(this).val(maxPoint);
			}
		});
		
		
		$('.order_point_input_btn').on("click", function(){
			
			const maxPoint = parseInt('${memberInfo.point}');
			
			let state = $(this).data("state");
			
			if(state == 'N'){
				$('.order_point_input').val(maxPoint);
				$('.order_point_input_btn_Y').css('display', "inline-block");
				$('.order_point_input_btn_N').css('display', "none");
			} else if (state == 'Y'){
				$('.order_point_input').val(0);
				$('.order_point_input_btn_Y').css('display', "none");
				$('.order_point_input_btn_N').css('display', "inline-block");
			}
			
		});
		
	</script>
</body>
</html>