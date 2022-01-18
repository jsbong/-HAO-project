<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>ProductList</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/product.js" charset="UTF-8"></script>
		<link rel="stylesheet" href="resources/css/productList.css">
        <link rel="stylesheet" href="resources/css/admin_bar.css">
		<script>
			function list(page) {
				location.href="productList?curPage="+page;
			}
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
		<section class="member_section">
        	<h3 align="center">PRODUCT LIST</h3>
        	<div class="member_div">
				<table>
					<tr>
						<th>상품 번호</th>
						<th>카테고리 번호</th>
            			<th>이미지</th>
            			<th>상품이름</th>
            			<th>가격</th>
            			<th>할인가</th>
            			<th>색상</th>
            			<th>상품설명</th>
					</tr>
					<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
						<c:set var="product" value="${map.list[i]}" />
						<c:if test="${not empty product}">
							<tr>
								<td><a href="#">${product.p_no}</a></td>
								<td>${product.cate_no}</td>
								<td><img src="${fn:split(product.p_img, '*')[0]}" width="100" height="100"></td>
								<td>${product.p_name}</td>
								<td>${product.p_price}</td>
								<td>${product.p_discount}</td>
								<td>${product.p_color}</td>
								<td>${product.p_explain }</td>
							</tr>
						</c:if>
					</c:forEach>
				<tr class="">
					<td colspan="7" align="center">
						<c:if test="${map.pager.curBlock >= 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock >= 1}">
							<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<span style="color:red;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock <= map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		</section>
	</body>
</html>