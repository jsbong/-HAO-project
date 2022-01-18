<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<td><input type="text" value="번호값" disabled>
			</tr>
			<tr>
				<td>카테고리번호</td>
				<td><input type="text" value="카테고리번호" disabled>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" value="상품이름"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><img src="" alt="이미지"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" value="가격"></td>
			</tr>
			<tr>
				<td>할인가</td>
				<td><input type="text" value="할인가"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td><input type="text" value="색상"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text" value="상품설명"></td>
			</tr>
		</table>
	</section>
</body>
</html>