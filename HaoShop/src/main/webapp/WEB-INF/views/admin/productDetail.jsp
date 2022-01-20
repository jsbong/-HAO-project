<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail</title>
<link rel="stylesheet" href="resources/css/admin_bar.css">
<link rel="stylesheet" href="resources/css/productDetail.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		// 상품정보 수정
		function productUp() {
			var formData = new FormData($("#prdForm")[0]);
	      	formData.append('p_explain', CKEDITOR.instances.p_explain.getData());
			swal({
				icon : "warning",
				text : "정말 수정 하시겠습니까?",
				closeOnClickOutside : false,
				closeOnEsc : false,
				buttons : [ "취소", "확인" ],
			}).then(function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type : "POST",
						url : "updatePrd",
						data : formData,
		   		        processData : false,
			      	    contentType : false,
						success : function(data) {
							swal('수정 완료!', '상품정보 수정을 완료했습니다.', 'success').then(function(isConfirm) {
							window.location.href = "productList";});
						},
						error : function(data) {
							swal('', 'xx', 'error');
						}
					});
				}
			})
		}
		// 상품 삭제
		function productdel() {
			var p_no = $("#p_no").val();
			swal({
				icon : "warning",
				text : "해당 상품을 삭제 하시겠습니까?",
				closeOnClickOutside : false,
				closeOnEsc : false,
				buttons : [ "취소", "확인" ],
			}).then(function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type : "POST",
						url : "deletePrd",
						data : {
				            "p_no" : p_no
				         },
						success : function(data) {
							swal('삭제 완료!', '상품 정보가 삭제되었습니다.', 'success').then(function(isConfirm) {
							window.location.href = "productList";});
						},
						error : function(data) {
							swal('', 'xx', 'error');
						}
					});
				}
			})
		}
		
		var slideIndex = 0;
		
		function plusImg() {
			var x = document.getElementsByClassName("imgSlides");
			slideIndex++;
			
			
			if(slideIndex > (x.length-1)) { // 슬라이드 번호가 x 개수보다 커지면 1로 돌아가기 
				slideIndex = 0;
			}
			
			for(i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			
			x[slideIndex].style.display = "block";
		}
		
		function subImg() {
			var x = document.getElementsByClassName("imgSlides");
			slideIndex--;
	
			if(slideIndex < 0) {
				slideIndex = x.length-1;
			}
			
			for(i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			
			x[slideIndex].style.display = "block";
		}
		
		$(document).ready(function() {
			$("#image_button").click(function() {
				$(".background").addClass("show");
			});
			
			$(".window").click(function(e) {
				if($(".window").has(e.target).length === 0) {
				$(".background").removeClass("show");
				}
			});
		});
	</script>
</head>
<body>
	<!-- navigation -->
	<%@ include file="../admin/admin_bar.jsp" %>
	<section class="productdetail-content">
		<div class="productdetail">
		<h2>PRODUCT_DETAIL</h2>
		<form id="prdForm" action="updatePrd" method="POST" enctype="multipart/form-data">
			<table class="product_table">
				<tr>
					<th>상품번호</th>
					<td><input type="text" value="${product.p_no}" disabled>
						<input type="hidden" id="p_no" name="p_no" value="${product.p_no}">
				</tr>
				<tr>
					<th>카테고리번호</th>
					<td><input type="text" value="${product.cate_no}" disabled>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" id="p_name" name="p_name" value="${product.p_name}"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="button" value="이미지 보기" id="image_button"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" id="p_price" name="p_price" value="${product.p_price}"></td>
				</tr>
				<tr>
					<th>할인가</th>
					<td><input type="text" id="p_discount" name="p_discount" value="${product.p_discount}"></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><input type="text" id="p_size" name="p_size" value="${product.p_size}"></td>
				</tr>
				<tr>
					<th>색상</th>
					<td><input type="text" id="p_color" name="p_color" value="${product.p_color}"></td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td>
					    <textarea name="p_explain" id="p_explain" cols="88" rows="80"></textarea>
                        <script>
                           CKEDITOR.replace('p_explain', {
                              filebrowserUploadUrl : "imageUpload.do"
                           });
                        </script>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="상품 수정" onclick="productUp()">
						<input type="button" value="상품 삭제" onclick="productdel()">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</section>
	<div class="background">
		<div class="window">
			<div class="popup">
				<a class="prev" onclick="subImg();">&#10094;</a>
					<c:forEach items="${fn:split(product.p_img, '*')}" var="img">
						<img src="${img}" class="imgSlides">
					</c:forEach>
				<a class="next" onclick="plusImg();">&#10095;</a>
			</div>
		</div>
	</div>
</body>
</html>