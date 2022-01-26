<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>signUp</title>
	<link rel="stylesheet" type="text/css" href="resources/css/member/signup.css">		
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="resources/js/signup.js" charset="UTF-8"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp" %>
	<!-- 회원가입  section -->
	<section class="signup_section">
		<div class="signup-content">
			<h2>SIGN UP</h2>
			<ul class="signup_detail">
				<li class="input_title"><span>아이디</span></li>
				<li class="input_content">
					<input type="text" id="m_id" class="input rel" onFocus="">
					<label id="idchk"></label>
				</li>
				<li class="input_title"><span>비밀번호</span></li>
				<li class="input_content">
					<input type="password" id="m_pwd" class="input rel" maxlength="20"
						placeholder="최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자로 8자 이상 입력">
				</li>
				<li class="input_title"><span>비밀번호 확인</span></li>
				<li class="input_content">
					<input type="password" id="chk_m_pwd" class="input rel" maxlength="20" />
					<label id="checkPasswd"></label>
				</li>
				<li class="input_title"><span>이름</span></li>
				<li class="input_content">
					<input type="text" id="m_name" class="input rel"><br>
					<label id="chkname"></label>
				</li>
				<li class="input_title"><span>생년월일</span></li>
				<li class="input_content except">
					<select id="birth_year" class="input birth">
						<option value="">년</option>
						<c:forEach var="i" begin="0" end="${2019-1900}">
							<c:set var="yearOption" value="${2019-i}" />
							<option value="${yearOption}">${yearOption}</option>
						</c:forEach>
					</select>
					<select id="birth_month" class="input birth">
						<option value="">월</option>
						<c:forEach var="j" begin="0" end="${12-1}">
							<c:set var="monthOption" value="${12-j}" />
							<option value="${monthOption}">${monthOption}</option>
						</c:forEach>
					</select> 
					<input type="text" id="birth_day" class="input birth" maxlength="2" placeholder="일"/><br>
					<label id="birchk"></label>				
				</li>
				<li class="input_title"><span>이메일</span></li>
				<li class="input_content">
					<input type="text" id="email_id" class="input email" > @ 
					<input type="text" id="email_addr" class="input email" disabled>
					<select id="email_select" class="input">
						<option value="" selected>::선택하세요::</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="1">직접입력</option>
					</select>
					<input type="button" id="mailChk_btn" onclick="emailChk()" value="인증번호 발송" />				
				</li>
				<li class="input_title hideme"><span>인증번호 입력</span></li>
				<li class="input_content hideme">
					<input type="text" name="authkey" id="authkey" class="input authkey" placeholder="인증번호를 입력하세요" >
					<input type="button" class="authkey_btn" onclick="matchCode()" value="확인" >
					<label id="mailChk"></label>
				</li>
				<li class="input_title"><span>연락처</span></li>
				<li class="input_content except">
					<select id="NUMst" class="input tel">
						<option value="" selected>::선택::</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
					</select> - 
					<input type="text" id="NUMnd" class="input tel" maxlength="4" /> - 
					<input type="text" id="NUMrd" class="input tel" maxlength="4" />			
				</li>
				<li class="input_title"><span>주소</span></li>
				<li class="input_content">
					<input type="text" name="m_zipcode" id="m_zipcode" class="input" readonly>
					<input type="button" onclick="searchPost()" id="addr_btn" value="우편번호 찾기"><br><br>
					<input type="text" name="m_faddr" id="m_faddr" class="input rel" readonly>
				</li>
				<li class="input_title"><span>상세주소</span></li>
				<li class="input_content">
					<input type="text" name="m_laddr" id="m_laddr" class="input rel">				
				</li>
				<li>
					<input type="button" id="signUp_btn" onclick="doSignup()" value="회원가입" />
				</li>			
			</ul>
		</div>
	</section>	
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>