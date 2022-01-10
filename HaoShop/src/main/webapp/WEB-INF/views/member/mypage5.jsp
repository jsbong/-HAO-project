<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html lang="ko">
	<head>
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css?">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		
		<title>Decorating's</title>
	</head>
	<body>
		<%@ include file="../include/menu.jsp"%>
		<table class="pwcheck" align="center">
			<tr>
				<th colspan="2">비밀번호 확인</th>
			</tr>
			<tr>
				<td width="100" bgcolor="#7FB3FA">회원 아이디</td>
				<td width="250">${member.m_id}</td>
			</tr>
			<tr>
				<td bgcolor="#7FB3FA">비밀번호</td>
				<td><input type="password" name="m_pwd" id="m_pwd" placeholder="Password" ></td>
			</tr>
		</table>
		<div class="checkbtn" align="center">
			<form id="myInfo">
				<!-- 회원 비밀번호 체크 -->
				<input type="button" class="confirm" value="확인" onClick="distroyAccount()" />&nbsp;&nbsp;&nbsp;
				<input type="reset" class="cancel" value="취소" onClick="" />
			</form>
		</div>
		<%@ include file="../include/csinfo.jsp"%>
	</body>
</html>