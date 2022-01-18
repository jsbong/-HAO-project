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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<section>
		<table>
			<tr>
				<td>상품번호</td>
				<td><input type="text" id="p_no" name="p_no" value="${product.p_no}" disabled>
			</tr>
			<tr>
				<td>카테고리번호</td>
				<td><input type="text" value="${product.cate_no}" disabled>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" id="p_name" name="p_name" value="${product.p_name}"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><img src="${fn:split(product.p_img,'*')[0]}" alt="이미지"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" id="p_price" name="p_price" value="${product.p_price}"></td>
			</tr>
			<tr>
				<td>할인가</td>
				<td><input type="text" id="p_discount" name="p_discount" value="${product.p_discount}"></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td><input type="text" id="p_size" name="p_size" value="${product.p_size}"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td><input type="text" id="p_color" name="p_color" value="${product.p_color}"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text" id="p_explain" name="p_explain" value="${product.p_explain}"></td>
			</tr>
			<tr>
				<td><input type="button" value="수정" onclick="productUp()"></td>
			</tr>
		</table>
	</section>
	<script>
		// 상품정보 수정
		function productUp() {
			var p_no = $("#p_no").val();
			var p_name = $("#p_name").val();
			var p_price = $("#p_price").val();
			var p_discount = $("#p_discount").val();
			var p_size = $("#p_size").val();
			var p_color = $("#p_color").val();
			var p_explain = $("#p_explain").val();
			swal({
				icon : "warning",
				text : "정말 수정 하시겠습니까?",
				closeOnClickOutside : false,
				closeOnEsc : false,
				buttons : [ "돌아가기", "확인" ],
			}).then(function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type : "POST",
						url : "updatePrd",
						data : {
							"p_no" : p_no,
							"p_name" : p_name,
							"p_price" : p_price,
							"p_discount" : p_discount,
							"p_size" : p_size,
							"p_color" : p_color,
							"p_explain" : p_explain
						},
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
	</script>
</body>
</html>