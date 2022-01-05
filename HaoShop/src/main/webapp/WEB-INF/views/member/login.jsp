<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>Decorating's</title>
		<script type="text/javascript" src="resources/js/login.js?129" charset="UTF-8"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/login.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@ include file="../include/menu.jsp" %>
		<section>
			<div>
				<form name="f0rm" id="f0rm">
					<div id="login-form">
						<h1 class="login_title">Login</h1>
						<fieldset>
								<input type="text" name="member_id" id="member_id" placeholder="ID">
								<!-- onBlur="if(this.value=='')this.value='Email'" onFocus="if(this.value=='Email')this.value='' " -->
								<input type="password" name="member_pwd" id="member_pwd" placeholder="Password" >
								<!-- onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' " -->
								<input type="button" value="Login" onclick="memberCheck()"/>
								<footer class="clearfix">
									<p>
										<span class="info">?</span>
										<a href="" onclick="forgotPWView()">Forgot Password</a>
									</p>
								</footer>
						</fieldset>
					</div>
				</form>
			</div>
			<!-- end login-form -->
		</section>
		<%@ include file="../include/csinfo.jsp" %>
	</body>
</html>