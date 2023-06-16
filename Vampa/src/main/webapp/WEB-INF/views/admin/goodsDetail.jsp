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
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">


<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
  
<style type="text/css">

	#result_card img {
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	
	
</style>
</head>
<body>
	<%@include file="./header.jsp" %>
       <div class="admin_content_wrap">
           <div class="admin_content_subject"><span>상품 상세</span></div>

           <div class="admin_content_main">

           		<div class="form_section">
           			<div class="form_section_title">
           				<label>책 제목</label>
           			</div>
           			<div class="form_section_content">
           				<input name="bookName" value="<c:out value="${goodsInfo.bookName}"/>" disabled>
           			</div>
           		</div>
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>등록 날짜</label>
           			</div>
           			<div class="form_section_content">
           				<input value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
           			</div>
           		</div>
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>최근 수정 날짜</label>
           			</div>
           			<div class="form_section_content">
           				<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
           			</div>
           		</div>                    		                    		
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>작가</label>
           			</div>
           			<div class="form_section_content">
           				<input id="authorName_input" readonly="readonly" value="${goodsInfo.authorName }" disabled>
           				                    				
           			</div>
           		</div>            
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>출판일</label>
           			</div>
           			<div class="form_section_content">
           				<input name="publeYear" autocomplete="off" readonly="readonly" value="<c:out value="${goodsInfo.publeYear}"/>" disabled>                    				
           			</div>
           		</div>            
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>출판사</label>
           			</div>
           			<div class="form_section_content">
           				<input name="publisher" value="<c:out value="${goodsInfo.publisher}"/>" disabled>
           			</div>
           		</div>             
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>책 카테고리</label>
           			</div>
           			<div class="form_section_content">
           				<div class="cate_wrap">
           					<span>대분류</span>
           					<select class="cate1" disabled>
           						<option  value="none">선택</option>
           					</select>
           				</div>
           				<div class="cate_wrap">
           					<span>중분류</span>
           					<select class="cate2" disabled>
           						<option  value="none">선택</option>
           					</select>
           				</div>
           				<div class="cate_wrap">
           					<span>소분류</span>
           					<select class="cate3" name="cateCode" disabled>
           						<option value="none">선택</option>
           					</select>
           				</div>                  				                    				
           			</div>
           		</div>          
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>상품 가격</label>
           			</div>
           			<div class="form_section_content">
           				<input name="bookPrice" value="<c:out value="${goodsInfo.bookPrice}"/>" disabled>
           			</div>
           		</div>               
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>상품 재고</label>
           			</div>
           			<div class="form_section_content">
           				<input name="bookStock" value="<c:out value="${goodsInfo.bookStock}"/>" disabled>
           			</div>
           		</div>          
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>상품 할인율</label>
           			</div>
           			<div class="form_section_content">
           				<input id="discount_interface" maxlength="2" disabled>
           			</div>
           		</div>          		
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>책 소개</label>
           			</div>
           			<div class="form_section_content bit">
           				<textarea name="bookIntro" id="bookIntro_textarea" disabled>${goodsInfo.bookIntro}</textarea>
           			</div>
           		</div>        		
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>책 목차</label>
           			</div>
           			<div class="form_section_content bct">
           				<textarea name="bookContents" id="bookContents_textarea" disabled>${goodsInfo.bookContents}</textarea>
             			</div>
             		</div>
             		
             		
             		<div class="form_section">
               			<div class="form_section_title">
               				<label>상품 이미지</label>
               			</div>
               			<div class="form_section_content">
							<div id="uploadResult">
																
							</div>
               			</div>
               		</div>
                    		
                    		
           			<div class="btn_section">
           				<button id="cancelBtn" class="btn">상품 목록</button>
              			<button id="modifyBtn" class="btn enroll_btn">수정 </button>
              		</div> 
            	 </div>      

         	
         	<form id="moveForm" action="/admin/goodsManage" method="get" >
				<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<input type="hidden" name="amount" value="${cri.amount}">
				<input type="hidden" name="keyword" value="${cri.keyword}">
       		</form>
       	
       </div>
       
	<%@include file="../footer.jsp" %>
	
	
	<script>
	
		$(document).ready(function(){
			
			let bookDiscount = '<c:out value= "${goodsInfo.bookDiscount}"/>' * 100 ;
			$('#discount_interface').attr("value", bookDiscount);
			
			
			let publeYear = "${goodsInfo.publeYear}";
			let length = publeYear.indexOf(" ");
			
			publeYear = publeYear.substring(0, length);
			
			$("input[name='publeYear']").attr("value", publeYear);
			
			
			let cateList = JSON.parse('${cateList}');
			
			let cate1Array = new Array();
			let cate2Array = new Array();
			let cate3Array = new Array();
			
			let cateSelect1 = $(".cate1");
			let cateSelect2 = $(".cate2");
			let cateSelect3 = $(".cate3");
			
			function makeCateArray(array, tier){
				
				cateList.forEach(function(e){
					if(e.tier === tier){
						
						obj = new Object();
						
						obj.cateName = e.cateName;
						obj.cateCode = e.cateCode;
						obj.cateParent = e.cateParent;
						
						array.push(obj);
					}
				});
				
			}
			
			makeCateArray(cate1Array, 1);
			makeCateArray(cate2Array, 2);
			makeCateArray(cate3Array, 3);
			
			
			let targetCate2 = '';
			let targetCate3 = '${goodsInfo.cateCode}';
			
			
			/* 대중소분류 카테고리 작업 */
			cate3Array.forEach(function(e, i){
 				if(targetCate3 === e.cateCode){
					targetCate3 = e;
				} 
 				
 				if(targetCate3.cateParent === e.cateParent){
					cateSelect3.append("<option value='"+e.cateCode+"'>" + e.cateName + "</option>");
				}
			});
			
			$('.cate3 option').each(function(i, obj){
				if(targetCate3.cateCode === obj.value){
					$(obj).attr("selected", "selected");
				}
			});
			
			
			cate2Array.forEach(function(e, i){
 				if(targetCate3.cateParent === e.cateCode){
					targetCate2 = e;
				} 
 				
 				if(targetCate2.cateParent === e.cateParent){
					cateSelect2.append("<option value='"+e.cateCode+"'>" + e.cateName + "</option>");
				}
			});
			
			$('.cate2 option').each(function(i, obj){
				if(targetCate2.cateCode === obj.value){
					$(obj).attr("selected", "selected");
				}
			});
		
			
			cate1Array.forEach(function(e){
				cateSelect1.append("<option value='"+ e.cateCode +"'> "+ e.cateName +" </option>")
			});
			
			$('.cate1 option').each(function(i, obj){
				
				if(targetCate2.cateParent === obj.value){
					$(obj).attr("selected", "selected");
				}
			
			});
			
			
			let bookId = '<c:out value="${goodsInfo.bookId}"/>';
			let uploadResult = $("#uploadResult");
			
			
			// 서버에 요청할 GET방식 url, 서버에 요청할때 전달할 데이터, 성공 시 실행할 콜백함수
			$.getJSON("/getAttachList", {bookId : bookId}, function(arr){
				
				if(arr.length === 0){
					
					let str = "";
					
					str += "<div id='result_card'>";
					str += "<img src='/resources/img/goodsNoImage.png'>";
					str += "</div>";
				
					uploadResult.html(str);
					
					return;
				}
				
				let str = "";
				let obj = arr[0];
				
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				
				str += "<div id='result_card'";
				str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
				str += ">";
				str += "<img src='/display?fileName=" + fileCallPath +"'>";
				str += "</div>";
				
				uploadResult.html(str);
				
			});
			
			
		});
		
		
		/* ckeditor 위지윅 */
		ClassicEditor
			.create(document.querySelector('#bookIntro_textarea'))
			.then(editor => {
				editor.isReadOnly = true;
			})
			.catch(e => console.error(e));
		
		ClassicEditor
			.create(document.querySelector("#bookContents_textarea"))
			.then(editor => {
				editor.isReadOnly = true;
			})
			.catch(e => console.error(e));

		
		
		$("#cancelBtn").on('click', function(e){
			
			e.preventDefault();
			$('#moveForm').submit();
			
		});
		
		$("#modifyBtn").on('click',function(e){
			
			e.preventDefault();
			
			let addInput = '<input type="hidden" name="bookId" value="${goodsInfo.bookId}">'
			$('#moveForm').append(addInput);
			$('#moveForm').attr("action", "/admin/goodsModify");
			$('#moveForm').submit();
			
		});
		
		
		
	
	</script>
</body>
</html>