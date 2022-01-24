<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/member/mypageCheck.css">
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
	<title>mypage5</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	
	<!-- 회원정보확인 section -->
	<section class="section_my">
		<div class="myInfo_check">
			<table class="pwcheck">
				<tr>
					<td colspan="2"><h3>비밀번호 확인</h3></td>
				</tr>
				<tr>
					<th>회원 아이디</th>
					<td><input type="text" name="m_no" id="m_no" value="${member.m_id}" disabled></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_pwd" id="m_pwd" placeholder="Password" ></td>
				</tr>
			</table>
			<div class="checkbtn">
				<form id="myInfo">
					<!-- 회원 비밀번호 체크 -->
					<input type="button" value="확인" onClick="distroyAccount()" />&nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" onClick="javascript:history.go(-1);" />
				</form>
			</div>
		</div>
	</section>
	
	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>
	</body>
</html>