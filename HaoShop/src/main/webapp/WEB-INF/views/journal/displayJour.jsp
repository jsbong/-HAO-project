<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HAOSHOP-JOURNAL</title>
	<link rel="stylesheet" href="resources/css/journal/displayJour.css">
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<!-- journal section -->
	<section class="journal_section">
		<div class="journal-content">
			<input type="hidden" name="jour_no" id="jour_no" value="${journal.jour_no}">
			<ul class="journal_detail">
				<li class="jour_name"><h1>${journal.jour_name}</h1></li>
				<li class="jour_date">${journal.jour_regdate}</li>
				<li class="jour_explain">${journal.jour_explain}</li>
			</ul>
		</div>
	</section>
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>

