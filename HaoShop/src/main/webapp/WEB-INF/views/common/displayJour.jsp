<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HAOSHOP-JOURNAL</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<!-- journal section -->
	<div>
		<input type="hidden" name="jour_no" id="jour_no" value="${journal.jour_no}">
		<ul>
			<li>${journal.jour_name}</li>
			<li>${journal.jour_regdate}</li>
			<li>${journal.jour_explain}</li>
		</ul>
	</div>
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>

