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
						<th>메인카테고리</th>
						<td>
							<select name="cate_main_name" id="cate_main_name" style="width: 150px; height: 24px;">
								<option value="" selected>::선택::</option>
								<option value="100">OUTER</option>
								<option value="200">TOP</option>
								<option value="300">BOTTOM</option>
								<option value="400">ETC</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>서브카테고리</th>
						<td>
							<select id="cate_sub_name" name="cate_sub_name"  style="width: 150px; height: 24px;" onchange="chking();">
								<option value="" selected>::선택::</option>
								<option value="001">JACKET</option>
								<option value="002">COAT</option>
								<option value="003">DOWNJACKET</option>
								<option value="001">SWEAT</option>
								<option value="002">KNITWEAR</option>
								<option value="003">SHIRTS</option>
								<option value="004">VEST</option>
								<option value="001">TROUSER</option>
								<option value="002">SHORT</option>
								<option value="001">SHOES</option>
								<option value="002">LIFEGOODS</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>카테고리번호</th>
						<td><input type="text" id="cate_no" name="cate_no"></td><br>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="p_name" id="p_name" />
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>
							<input type="text" name="p_price" id="p_price" />
						</td>
					</tr>
					<tr>
						<th>할인가</th>
						<td>
							<input type="text" name="p_discount" id="p_discount" />
						</td>
					</tr>
					<tr>
						<th>상품색상</th>
						<td>
							<input type="text" name="p_color" id="p_color" />
						</td>
					</tr>
					<tr>
						<th>상품사이즈</th>
						<td>
							<input type="text" name="p_size" id="p_size" />
						</td>
					</tr>
					<tr>
						<th>상품재고</th>
						<td>
							<input type="text" name="p_amount" id="p_amount" />
						</td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td>
							<input type="file" name="uploadFile" id="uploadFile" />
						</td>
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