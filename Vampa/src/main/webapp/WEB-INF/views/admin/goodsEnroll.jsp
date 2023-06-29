<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../resources/css/admin/adminCmn.css">
	<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
	<link rel="stylesheet" href="../resources/css/footer.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	 
	 
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<style type="text/css">
	
		#result_card img{
			max-width: 100%;
		    height: auto;
		    display: block;
		    padding: 5px;
		    margin-top: 10px;
		    margin: auto;	
		}
		#result_card {
			position: relative;
		}
		
		.imgDeleteBtn{
		    display: block;
			position: absolute;
			top:0;
			right:5%;
		    width: 30px;
		    height: 30px;
		    background-color: #ef7d7d;
		    color: wheat;
		    font-weight: 900;
		    border-radius: 50%;
		    line-height: 26px;
		    text-align: center;
		    border: none;
		    cursor: pointer;	
		    z-index:999;
		}
		
	</style>
</head>
</head>
<body>
 
	<%@include file="./header.jsp"%>
	
         <div class="admin_content_wrap">
           <div class="admin_content_subject"><span>상품 등록</span></div>
           <div class="admin_content_main">
              	<form action="/admin/goodsEnroll" method="post" id="enrollForm" name="enrollForm">
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>책 제목</label>
              			</div>
              			<div class="form_section_content">
              				<input name="bookName">
              				<span class="ck_warn bookName_warn">책 이름을 입력해주세요.</span>
              			</div>
              		</div>
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>작가</label>
              			</div>
              			<div class="form_section_content">
              				<input id="authorName_input" readonly>
              				<input id="authorId_input" name="authorId" type="hidden">
              				<button class="authorId_btn">작가 선택</button>
              				<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
              			</div>
              		</div>            
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>출판일</label>
              			</div>
              			<div class="form_section_content">
              				<input name="publeYear" autocomplete="off" readonly>
              				<span class="ck_warn publeYear_warn">출판일을 선택해주세요.</span>
              			</div>
              		</div>            
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>출판사</label>
              			</div>
              			<div class="form_section_content">
              				<input name="publisher">
              				<span class="ck_warn publisher_warn">출판사를 입력해주세요.</span>
              			</div>
              		</div>             
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>책 카테고리</label>
              			</div>
              			<div class="form_section_content">
              				<div class="cate_wrap">
              					<span>대분류</span>
              					<select class="cate1">
              						<option selected value="none">선택</option>
              					</select>
              				</div>
              				<div class="cate_wrap">
              					<span>중분류</span>
              					<select class="cate2">
              						<option selected value="none">선택</option>
              					</select>
              				</div>
              				<div class="cate_wrap">
              					<span>소분류</span>
              					<select class="cate3" name="cateCode">
              						<option selected value="none">선택</option>
              					</select>
              				</div>
              				<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>
              			</div>
              		</div>          
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>상품 가격</label>
              			</div>
              			<div class="form_section_content">
              				<input name="bookPrice" value="0">
              				<span class="ck_warn bookPrice_warn">상품 가격을 입력해주세요.</span>
              			</div>
              		</div>               
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>상품 재고</label>
              			</div>
              			<div class="form_section_content">
              				<input name="bookStock" value="0">
              				<span class="ck_warn bookStock_warn">상품 재고를 입력해주세요.</span>
              			</div>
              		</div>          
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>상품 할인율</label>
              			</div>
              			<div class="form_section_content">
              				<input id="discount_interface" maxlength="2" value="0">
              				<input name="bookDiscount"  type="hidden" value="0">
              				<span class="step_val"> 할인가격 : <span class="span_discount"></span></span>
              				<span class="ck_warn bookDiscount_warn">1~99 숫자를 입력해주세요.</span>
              			</div>
              		</div>          		
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>책 소개</label>
              			</div>
              			<div class="form_section_content">
              				<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
	              			<span class="ck_warn bookIntro_warn">책 소개를 입력해주세요.</span>
              			</div>
              		</div>        		
              		<div class="form_section">
              			<div class="form_section_title">
              				<label>책 목차</label>
              			</div>
              			<div class="form_section_content">
              				<textarea name="bookContents" id="bookContents_textarea"></textarea>
              				<span class="ck_warn bookContents_warn">책 목차를 입력해주세요.</span>
              			</div>
              			<div class="form_section">
              				<div class="form_section_title">
								<label>상품 이미지</label>              				
              				</div>
              				<div class="form_section_content">
              					<input type="file"  id="fileItem" name="uploadFile" style="height:50px;" accept=".jpg, .png">
              					<!-- <input type="file" multiple> 이미지 여러개 -->
              					<div id="uploadResult">

          						</div>
              				</div>
              			</div>
              		</div>
           		</form>
       			<div class="btn_section">
           			<button id="cancelBtn" class="btn">취 소</button>
             		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
               	</div> 
              </div>  
         </div>

       <%@ include file = "../footer.jsp" %>

	<script>
		
		let enrollForm = $("#enrollForm");
		
		$('#cancelBtn').click(function(){
			
			location.href = "/admin/goodsManage"
			
		});
		
		
		$('#enrollBtn').on("click",function(e){
			e.preventDefault();
			
			
			let bookNameCk = false;
			let authorIdCk = false;
			let publeYearCk = false;
			let publisherCk = false;
			let cateCodeCk = false;
			let priceCk = false;
			let stockCk = false;
			let discountCk = false;
			let introCk = false;
			let contentsCk = false; 
			
			
			let bookName = $("input[name='bookName']").val();
 			let authorId = $("input[name='authorId']").val();
			let publeYear = $("input[name='publeYear']").val();
			let publisher = $("input[name='publisher']").val();
			let cateCode = $("select[name='cateCode']").val();
			let bookPrice = $("input[name='bookPrice']").val();
			let bookStock = $("input[name='bookStock']").val();
			let bookDiscount = $("#discount_interface").val();
			let bookIntro = $(".bit span").html();
			let bookContents = $(".bct span").html(); 
			
			
			if(bookName){
				$(".bookName_warn").css('display','none');
				bookNameCk = true;
			
			} else {
				$(".bookName_warn").css('display','block');
				bookNameCk = false;
			}
			
 			if(authorId){
				$(".authorId_warn").css('display','none');
				authorIdCk = true;
			} else {
				$(".authorId_warn").css('display','block');
				authorIdCk = false;
			}
			
			if(publeYear){
				$(".publeYear_warn").css('display','none');
				publeYearCk = true;
			} else {
				$(".publeYear_warn").css('display','block');
				publeYearCk = false;
			}	
			
			if(publisher){
				$(".publisher_warn").css('display','none');
				publisherCk = true;
			} else {
				$(".publisher_warn").css('display','block');
				publisherCk = false;
			}
			
			if(cateCode != 'none'){
				$(".cateCode_warn").css('display','none');
				cateCodeCk = true;
			} else {
				$(".cateCode_warn").css('display','block');
				cateCodeCk = false;
			}	
			
			if(bookPrice != 0){
				$(".bookPrice_warn").css('display','none');
				priceCk = true;
			} else {
				$(".bookPrice_warn").css('display','block');
				priceCk = false;
			}	
			
			if(bookStock != 0){
				$(".bookStock_warn").css('display','none');
				stockCk = true;
			} else {
				$(".bookStock_warn").css('display','block');
				stockCk = false;
			}		
			
			if(!isNaN(bookDiscount)){
				$(".bookDiscount_warn").css('display','none');
				discountCk = true;
			} else {
				$(".bookDiscount_warn").css('display','block');
				discountCk = false;
			}	
			
			if(bookIntro != '<br data-cke-filler="true">'){
				$(".bookIntro_warn").css('display','none');
				introCk = true;
			} else {
				$(".bookIntro_warn").css('display','block');
				introCk = false;
			}	
			
			if(bookContents != '<br data-cke-filler="true">'){
				$(".bookContents_warn").css('display','none');
				contentsCk = true;
			} else {
				$(".bookContents_warn").css('display','block');
				contentsCk = false;
			}		 
			
			
			if(bookNameCk){
				//alert('통과');
				enrollForm.submit();
			} else {
				return false;
			}
		});
		
		$('.authorId_btn').on('click', function(e){
			
			e.preventDefault();
			
			let popUrl = "/admin/authorPop";
			let popOption = "width=650px, height=550px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl, "작가 찾기", popOption);
			
			
		});
		
		
		
		/*datePicker*/
		const config = {
				dateFormat : 'yy-mm-dd',
				showOn : "button",
				buttonText : "날짜 선택",
				prevText: '이전 달',
			    nextText: '다음 달',
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    yearSuffix: '년',
			    changeMonth : true,
			    changeYear : true
		}
		
		$(function(){
			$('input[name="publeYear"]').datepicker(config);
		});

		
		
		/*위지윅 적용*/
		ClassicEditor
			.create(document.querySelector("#bookIntro_textarea"))
			.catch(err => console.error(err));
		
		ClassicEditor
			.create(document.querySelector("#bookContents_textarea"))
			.catch(err => console.error(err));
		

		/* 카테고리 배열 초기화 */
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
		
				
		function makeCateArry(arr, tier){
			cateList.forEach(function(e, i){
				if(e.tier === tier){
					
					obj = new Object();
					
					obj.cateName = e.cateName;
					obj.cateCode = e.cateCode;
					obj.cateParent = e.cateParent;
					
					arr.push(obj);
				}
			});
		}
		
		makeCateArry(cate1Array, 1);
		makeCateArry(cate2Array, 2);
		makeCateArry(cate3Array, 3);
		
	
		
		cate1Array.forEach(function(e){
			cateSelect1.append("<option value='"+ e.cateCode+"'>" + e.cateName + "</option>");
		});
		
		
		$(cateSelect1).on("change", function(){
			
			let selectVal1 = $(this).find("option:selected").val();
			
			cateSelect2.children().remove();
			cateSelect3.children().remove();
			
			cateSelect2.append("<option value='none'>선택</option>");
			cateSelect3.append("<option value='none'>선택</option>");
			
			cate2Array.forEach(function(e, i){
				if(selectVal1 === e.cateParent){
					cateSelect2.append("<option value='"+ e.cateCode +"'>"+ e.cateName +"</option>");
				}
				
			}); 
			
		});
		
		
		
		$(cateSelect2).on("change", function(){
			
			let selectVal2 = $(this).find("option:selected").val();
			
			cateSelect3.children().remove();
			
			cateSelect3.append("<option value='none'>선택</option>");
			
			cate3Array.forEach(function(e, i){
				if(selectVal2 === e.cateParent){
					cateSelect3.append("<option value='"+ e.cateCode +"'>"+ e.cateName +"</option>");
				}
				
			}); 
			
		});
		
		
		
		
		/* 할인율 input 설정 */
		
		function changeVal(){
			
			let userInput = $("#discount_interface");
			let discountInput = $('input[name="bookDiscount"]');
			
			let discountRate = userInput.val();
			let sendDiscountRate = discountRate / 100 ;
			let goodsPrice = $("input[name=bookPrice]").val();
			let discountPrice = Math.round(goodsPrice * (1-sendDiscountRate));
			
			if(!isNaN(discountRate)){
				
				discountInput.val(sendDiscountRate);
				$('.span_discount').html(discountPrice);
				
			}
		}

		$('input[name="bookPrice"]').on("propertychange change keyup paste input", changeVal);
		$("#discount_interface").on("propertychange change keyup paste input", changeVal);
		

		/* file업로드 관련 */
		
		$('input[type="file"]').on("change", function(){
			
			if($('.imgDeleteBtn').length > 0) {
				deleteFile();
			}
			
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
/* 			console.log("fileList : " + fileList);
			console.log("fileObj : " + fileObj);
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type);
 */			
 			if(!fileCheck(fileObj.name, fileObj.size)){
 				return false;
 			}
 
 			formData.append("uploadFile", fileObj);
 		
 		/* 여러개의 파일 업로드 시
 			fileList.forEach(function(e, i){
 				formData.append("uploadFile", e[i]);
 			});  
 		*/
 		
 			$.ajax({
 				url: '/admin/uploadAjaxAction', // 서버로 요청을 보낼 url
 				processData : false,	// 서버로 전송할 데이터를 queryString 형태로 변환할지 여부
 				contentType : false,	// 서버로 전송되는 데이터의 content-type
 				data : formData,		// 서버로 전송할 데이터
 				type : 'POST',			// 서버 요청 타입(GET, POST)
 				dataType : 'json',		// 서버로부터 반환받을 데이터 타입
 				success : function(result) {
 					showUploadImg(result);
 				},
 				error : function(result){
 					alert("이미지 파일이 아닙니다.");
 				}
 			});
 			
		});
		
	
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; // 1mb
		
		
		function fileCheck(fileName, fileSize){
			
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(!regex.test(fileName)){
				alert("해당 확장자의 파일은 업로드할 수 없습니다.");
				return;
			}
			
			return true;
		}
		
		
		/*이미지 출력*/
		function showUploadImg(uploadResultArr){
			
			if(!uploadResultArr || uploadResultArr.length == 0){
				return
			}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			let str = '';
			let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
			
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName="+ fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file = '"+ fileCallPath +"'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";
			
			uploadResult.append(str);
			
		}
		
		
		/* 이미지 삭제 버튼 */
		function deleteFile(){
			
			let targetFile = $('.imgDeleteBtn').data('file');
			
			let targetDiv = $('#result_card');
			
			$.ajax({
				url : "/admin/deleteFile",
				data : { fileName : targetFile },
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$('input[type="file"]').val("");
				},
				error : function(result){
					console.log(result);
					alert("파일을 삭제하지 못하였습니다.");
				}
			});
			
		}
		
		
		$('#uploadResult').on('click', '.imgDeleteBtn', function(){
			deleteFile();
		});
		
		
	</script>
 
</body>
</html>
