<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>mypage2</title>
	<link rel="stylesheet" type="text/css" href="resources/css/member/mypageCheck.css">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		// 마이페이지2 비밀번호 확인
		function mypg2() {
			var m_id = $("#m_id").val();
			var m_pwd = $("#m_pwd").val();
			
			var mypPwd = $("#m_pwd").val();
			
			if (!m_id || !mypPwd) {
				swal("", "패스워드를 입력해주세요.", "error");
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
								url : "mypage2",
								data : {
									"m_id" : m_id,
									"m_pwd" : m_pwd
								}, success : function() { window.location.href = "mypage3"; }
							});
						} else {
							swal("", "패스워드를 확인해주세요.", "warning")
						}
					}, error : function(data) {
						console.log(data);
					}
				});
			}
		}
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<!-- 본인환인 section -->
	<section class="section_my">
		<div class="myInfo_check">
			<table class="pwcheck">
				<tr>
					<td colspan="2"><h3>비밀번호 확인</h3></td>
				</tr>
				<tr>
					<th>회원 아이디</th>
					<td>${member.m_id}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="20" id="m_pwd" placeholder="비밀번호 확인" /></td>
				</tr>
			</table>
			<div class="checkbtn">
				<!-- 회원 비밀번호 체크 -->
				<input type="button" value="확인" onClick="mypg2()" />
				<input type="button" value="취소" onClick="javascript:history.go(-1);" />
			</div>
		</div>
	</section>
	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>