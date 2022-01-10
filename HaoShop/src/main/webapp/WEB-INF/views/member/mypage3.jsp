<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE htm>
<html lang="ko">
	<head>
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="resources/js/mypage.js" charset="UTF-8"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css?">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>Decorating's</title>
		<style>
			* {
				margin: 0px auto;
			}
		</style>
	</head>
	<body>
		<%@ include file="../include/menu.jsp"%>
		<section>
			<div align="center">
				<form name="f1rm" id="f1rm">
					<h2 align="center">회원 정보 수정</h2>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th>아이디</th>
							<td>
								<input type="hidden" id="m_no" name="m_no" value="${member.m_no}" />
								<label id="m_id" class="input" onFocus="">${member.m_id}</label><br>
								<label id="idchk"></label>
							</td>
						</tr>
						<tr>
							<th>변경할 비밀번호</th>
							<td><input type="password" id="m_pwd" class="input" maxlength="20" /></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" id="chk_m_pwd" class="input" maxlength="20" />
								<label id="checkPasswd"></label>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<label id="m_name" class="input">${member.m_name}</label><br>
								<label id="chkname"></label>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<%-- <fmt:parseDate value="${member.m_birth}" pattern="yyyy-MM-ddHH:mm:ss" var="m_birth" /> --%>
								<%-- <fmt:formatDate value="${m_birth}" pattern="yyyy-MM-dd" var="mbirth" /> --%>
								<label id="m_year" class="input">${member.m_birth}</label><br>
							</td>
						</tr>
						<tr>
							<th>이메일(선택)</th>
							<td>
								<!-- email split해서 값 넣어주기 -->
								<!-- c:set 셋팅 -->
								<c:set var="m_email" value="${member.m_email}" />
								<c:set var="memail" value="${fn:split(m_email, '@') }" />
								<!-- 배열 인덱스로 불러옴 -->
								<input type="text" size="15" id="email_id" class="input" value="${memail[0] }"> @ 
								<input type="text" size="15" id="email_addr" class="input" value="${memail[1] }" disabled>
								<select id="email_select">
									<option value="" selected>::선택하세요::</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="1">직접입력</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>연락처(선택)</th>
							<td>
								<!-- phone split해서 값 넣어주기 -->
								<!-- c:set 셋팅 -->
								<c:set var="m_phone" value="${member.m_phone}" />
								<c:set var="mphone" value="${fn:split(m_phone, '-') }" />
								<!-- 배열 인덱스로 불러옴 -->
								<select id="NUMst">
									<option value="${mphone[0]}" selected>${mphone[0]}</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
								</select> - 
								<input type="text" id="NUMnd" class="input" maxlength="4" size="4" value="${mphone[1]}" /> - 
								<input type="text" id="NUMrd" class="input" maxlength="4" size="4" value="${mphone[2]}" />
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="m_zipcode" id="m_zipcode" class="input" readonly size="10" value="${fn:split(member.m_addr,'*')[0]}">
								<input type="button" onclick="searchPost()" style="cursor: pointer" value="우편번호 찾기"><br><br>
								<input type="text" name="m_faddr" id="m_faddr" class="input" size="60" value="${fn:split(member.m_addr,'*')[1]}" readonly>
							</td>
						</tr>
						<tr>
							<th id="a">상세주소</th>
							<td id="a"><input type="text" name="m_laddr" id="m_laddr" class="input" value="${fn:split(member.m_addr,'*')[2]}"></td>
						</tr>
					</table>
					</form>
						<input type="button" onclick="myinfoUp()" style="cursor: pointer" value="수정" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="" style="cursor: pointer" value="취소" />
			</div>
		</section>
	</body>
</html>