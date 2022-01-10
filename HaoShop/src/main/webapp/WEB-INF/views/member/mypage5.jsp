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
		<script>
			//회원탈퇴
			function distroyAccount() {
				var m_no=$("#m_no").val();
				var m_id=$("#m_id").val();
				var m_pwd=$("#m_pwd").val();
				if (!m_id || !m_pwd) {
					swal("", "아이디 혹은 패스워드를 입력해주세요.", "error");
				} else {
						$.ajax({
							type : "POST",
							url : "checkMember",
							data : {
								"m_id" : m_id,
								"m_pwd" : m_pwd
							}, success : function(data) {
								if (data != 0) {
									$.ajax({
										type : "POST",
										url : "distroy",
										data : {
											"m_no" : m_no
										}, success : function() {
											swal("탈퇴완료", "회원 탈퇴되었습니다.", 'success').then(function(){
												$.ajax({
													type : "GET",
													url : "logout",
													data : {},
													success : function(data) {
														location.href="main";
													}
												});
											});
										}
									});
								} else {
									swal("","패스워드를 확인해주세요.","warning")
								}
							}, error : function(data) {
								console.log(data);
							}
						});
				}
			}
		</script>
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
				<td><input type="hidden" name="m_no" id="m_no" value="${member.m_no}"></td>
			</tr>
		</table>
		<div class="checkbtn" align="center">
			<form id="myInfo">
				<!-- 회원 비밀번호 체크 -->
				<input type="button" class="confirm" value="확인" onClick="distroyAccount()" />&nbsp;&nbsp;&nbsp;
				<input type="button" class="cancel" value="취소" onClick="" />
			</form>
		</div>
		<%@ include file="../include/csinfo.jsp"%>
	</body>
</html>