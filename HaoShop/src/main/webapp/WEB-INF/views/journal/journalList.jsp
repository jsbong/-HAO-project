<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>HAOSHOP-JOURNAL_LIST</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/product/product.css">
		<script>
			$(document).ready(function() {
				$(".product_page li").click(function() {
					var gotonum = $(this).attr("data-tab");
					location.href = "journalList?curPage=" + gotonum;
				});
			});
		</script>
	</head>
	<body>
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		<section class="category_section">
			<c:if test="${(fn:length(map.list)) eq 0}"> <!-- 저널이 없을 경우 -->
				<h2>저널이 없습니다.</h2>
			</c:if>
			<ul class="product_table">
				<!-- 상품 목록 -->
				<c:forEach begin="0" end="${(fn:length(map.list) + 3) / 4 - 1}" var="row">
					<li>
						<c:forEach begin="0" end="3" var="col">
							<c:set var="item" value="${map.list[row * 4 + col]}" />
							<c:if test="${not empty item}">
							<a href="displayJour?jour_no=${item.jour_no}" class="product">
								<img src="${item.jour_img}">
								<span style="font-size:20px; font-weight: 800;">${item.jour_name}</span><br>
								<%-- <c:choose>
									<c:when test="${ item.p_discount == 0 }">
										<span><fmt:formatNumber value="${item.p_price}" pattern="\#,###,###" /></span>
									</c:when>
									<c:otherwise>
										<span style="color:darkgray; text-decoration:line-through; font-size:14px"><fmt:formatNumber value="${item.p_price}" pattern="\#,###,###" /></span>
										<span><fmt:formatNumber value="${item.p_price - item.p_discount}" pattern="\#,###,###"/></span>
									</c:otherwise>
								</c:choose> --%>
							</a>
							</c:if>
						</c:forEach>
					</li>
				</c:forEach>
			</ul>
			<ul class="product_page">
				<c:if test="${(fn:length(map.list)) ne 0}">
					<%-- <input type="hidden" value="${map.cate_no}" class="s_number"> --%>
					<!-- 페이징 처리 -->
						<li data-tab="1">&lt;</li>
						<c:if test="${map.pager.curBlock > 1}">
							<li data-tab="${map.pager.prevPage}">[이전]</li>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<li><span style="color:red;">${num}</span></li>
								</c:when>
								<c:otherwise>
									<li data-tab="${num}">${num}</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<li data-tab="${map.pager.nextPage}">[다음]</li>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<li data-tab="${map.pager.totPage}">&gt;</li>
						</c:if>
				</c:if>
			</ul>
		</section>
		<!-- footer -->
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>