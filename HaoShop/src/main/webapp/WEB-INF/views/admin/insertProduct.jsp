<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>Decorating's</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/product.js" charset="UTF-8"></script>
		<script src="resources/ckeditor/ckeditor.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@ include file="../include/menu.jsp" %>
		<section>
			<h2 align="center">상품등록</h2>
			<form id="fileForm" action="insertProduct" method="POST" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<th>카테고리</th>
						<td>
							<select name="cate_no" id="cate_no" style="width: 150px; height: 24px;">
								<option value="" selected>::선택::</option>
								<option value="100001">Jacket</option>
								<option value="100002">Coat</option>
								<option value="100003">DownJacket</option>
								<option value="200001">Sweater</option>
								<option value="200002">Knitwear</option>
								<option value="200003">Shirts</option>
								<option value="200004">Vest</option>
								<option value="300001">Trouser</option>
								<option value="300002">Short</option>
								<option value="400001">Shoes</option>
								<option value="400002">Lifegoods</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>품명</th>
						<td>
							<input type="text" name="p_name" id="p_name" />
						</td>
					</tr>
					<tr>
						<th>물품번호</th>
						<td>
							<input type="text" name="p_no" id="p_no" />
							<input type="button" value="중복 확인" onclick="prdidChk()"><br/>
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>
							<input type="text" name="p_price" id="p_price" />
						</td>
					</tr>
					<!-- <tr>
						<th>배송비</th>
						<td>
							<input type="text" name="prd_delivery" id="prd_delivery" />
						</td>
					</tr> -->
					<tr>
						<th>재고</th>
						<td>
							<input type="text" name="p_amount" id="p_amount" />
						</td>
					</tr>
					<tr>
						<th>상품사이즈</th>
						<td>
							<input type="text" name="p_size" id="p_size" />
						</td>
					</tr>
					<tr>
						<th>할인금액</th>
						<td>
							<input type="text" name="p_discount" id="p_discount" />
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="uploadFile" id="uploadFile" />
						</td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
							<textarea name="p_explain" id="p_explain" cols="88" rows="80"></textarea>
							<script>
								CKEDITOR.replace('p_explain', {});
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="물품등록" onclick="doInsertProduct()" />
						</td>
					</tr>
				</table>
			</form>
		</section>
		<%@ include file="../include/csinfo.jsp" %>
	</body>
</html>