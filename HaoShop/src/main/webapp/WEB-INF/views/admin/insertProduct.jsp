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
							<select name="cate_id" id="cate_id" style="width: 150px; height: 24px;">
								<option value="" selected>::선택::</option>
								<option value="TAB20180010">테이블</option>
								<option value="PLO20180020">화분</option>
								<option value="LIG20180030">인테리어조명</option>
								<option value="LED20180040">LED</option>
								<option value="CHE20180050">전신거울</option>
								<option value="AWA20180060">벽걸이거울</option>
								<option value="ADF20180070">탁상거울</option>
								<option value="PLA20180080">플레이트</option>
								<option value="CUT20180090">커틀리</option>
								<option value="TEA20180100">티도구</option>
								<option value="FAB20180110">탁상보</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>품명</th>
						<td>
							<input type="text" name="prd_name" id="prd_name" />
						</td>
					</tr>
					<tr>
						<th>물품번호</th>
						<td>
							<input type="text" name="prd_id" id="prd_id" />
							<input type="button" value="중복 확인" onclick="prdidChk()"><br/>
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>
							<input type="text" name="prd_price" id="prd_price" />
						</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>
							<input type="text" name="prd_delivery" id="prd_delivery" />
						</td>
					</tr>
					<tr>
						<th>재고</th>
						<td>
							<input type="text" name="prd_stock" id="prd_stock" />
						</td>
					</tr>
					<tr>
						<th>상품옵션</th>
						<td>
							<input type="text" name="prd_option" id="prd_option" />
						</td>
					</tr>
					<tr>
						<th>할인금액</th>
						<td>
							<input type="text" name="prd_discount" id="prd_discount" />
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
							<textarea name="prd_explain" id="prd_explain" cols="88" rows="80"></textarea>
							<script>
								CKEDITOR.replace('prd_explain', {});
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