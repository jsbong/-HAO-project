<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>HAOSHOP-PRODUCT</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/product.css">
		<script>
			$(document).ready(function() {
				var cate_number = $(".cate_number").val();
				var cate_curnumber = $(".cate_curnumber").val().
				
				$(".product_page li").click(function() {
					var gotonum = $(this).attr("data-tab");
					location.href = "category?cate_no=" + cate_number + "&curPage=" + gotonum;
				});
				
				if(cate_number = cate_curnumber) {
					$(".product_page li").addClass("color");
				}
				
			});
		</script>
	</head>
	<body>
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		<section class="category_section">
			<c:if test="${(fn:length(map.list)) eq 0}"> <!-- 상품목록이 없을 경우 -->
				<h2>상품내역이 없습니다.</h2>
			</c:if>
			<ul class="product_table">
				<!-- 상품 목록 -->
				<c:forEach begin="0" end="${(fn:length(map.list) + 3) / 4 - 1}" var="row">
					<li>
						<c:forEach begin="0" end="3" var="col">
							<c:set var="item" value="${map.list[row * 4 + col]}" />
							<a href="productpage?p_no=${item.p_no}" class="product">
								<img src="${item.p_img}">
								<span>${item.p_name}</span>
								<span>
									<!-- 할인가 적용해야됨 -->
									<fmt:formatNumber value="${item.p_price}" pattern="#,###,###원"/>
								</span>
								<span>
									<fmt:formatNumber value="${item.p_price - item.p_discount}" pattern="#,###,###원"/>										
								</span>
							</a>
						</c:forEach>
					</li>
				</c:forEach>
			</ul>
			<ul class="product_page">
				<c:if test="${(fn:length(map.list)) ne 0}">
					<input type="hidden" value="${map.cate_no}" class="cate_number">
					<input type="hidden" value="${map.pager.curPage}" class="cate_curnumber">
					<!-- 페이징 처리 -->
						<li data-tab="1"><</li>
						<c:if test="${map.pager.curBlock > 1}">
							<li data-tab="${map.pager.prevPage}">[이전]</li>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							
								<li data-tab="${num}">${num}</li>
							
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<li data-tab="${map.pager.nextPage}">[다음]</li>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<li data-tab="${map.pager.totPage}">></li>
						</c:if>
				</c:if>
			</ul>
		</section>
		<!-- footer -->
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>