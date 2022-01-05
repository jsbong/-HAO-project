<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/register.do">
		<table border="1">
			<tr>
				<td>회원이메일</td>
				<td>
					<input type="text" name="m_email" id="m_email">
				</td>
			</tr>
			<tr>
				<td>회원PWD</td>
				<td>
					<input type="password" name="m_pwd" id="pwd">
				</td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td>
					<input type="text" name="m_name">
				</td>
			</tr>
			<tr>
				<td>회원생일</td>
				<td>
					<input type="date" name="m_birth">
				</td>
			</tr>
			<tr>
				<td>회원연락처</td>
				<td>
					<input type="text" name="m_phone">
				</td>
			</tr>
			<tr>
				<td>회원 우편주소</td>
				<td>
					<input type="text" name="m_zipcode">
				</td>
			</tr>
			<tr>
				<td>회원 주소</td>
				<td>
					<input type="text" name="m_faddr">
				</td>
			</tr>
			<tr>
				<td>회원 상세주소</td>
				<td>
					<input type="text" name="m_laddr">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>