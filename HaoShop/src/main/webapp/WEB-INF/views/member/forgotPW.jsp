<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>임시 비밀번호 발급</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="resources/js/login.js" charset="UTF-8"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/member/forgotPW.css">
	</head>
	<body>
		<form action="javascript:window.close();">
			<section>
				<div>
					<div id="login-form">
						<h1>임시비밀번호 발급</h1>
						<fieldset>
							<p><label for="m_id">ID</label><input type="text" name="m_id" id="m_id" placeholder="ID"></p>
							<p><label for="m_name">NAME</label><input type="text" name="m_name" id="m_name" placeholder="NAME"></p>
							<input type="button" onclick="forgotPW()" value="비밀번호 발급">
						</fieldset>
					</div>
				</div>
				<!-- end login-form -->
			</section>
		</form>
	</body>
</html>