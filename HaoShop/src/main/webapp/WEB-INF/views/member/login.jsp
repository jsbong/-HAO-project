<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>HAOSHOP - SIGNUP</title>
		<link rel="stylesheet" href="resources/css/member/login.css">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript" src="resources/js/login.js" charset="UTF-8"></script>
	</head>
	<body>
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		
		<!-- login section -->
		<section class="login">
			<div class="login_section">
				<div class="login_logo">
					<h2>Login</h2>
				</div>
					<div class="login_box">
						<input id="m_id" name="m_id" type="text" placeholder="아이디" 
							onkeypress="if(event.keyCode == 13) {memberCheck(); return;}" required>
						<label for="m_id">아이디</label>
					</div>
					<div class="login_box">
						<input id="m_pwd" name="m_pwd" type="password" placeholder="비밀번호" 
							onkeypress="if(event.keyCode == 13) {memberCheck(); return;}" required>
						<label for="m_pwd">비밀번호</label>
					</div>
					<div class="forgot">
						<span onclick="forgotPWView()">비밀번호 찾기</span> <!-- 이상함!!!!! -->
						<span>|</span>
						<span><a href="signup">회원가입</a></span>
					</div>
					<input type="button" onclick="memberCheck()" value="로그인">
			</div>
		</section>
		
		<!-- footer -->
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>