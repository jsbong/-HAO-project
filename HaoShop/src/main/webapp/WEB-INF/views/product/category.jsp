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
			function list(cate_no, page) {
				location.href="category?cate_no="+cate_no+"&curPage="+page;
			}
		</script>
	</head>
	<body>
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		<section class="category_section">
			<c:if test="${(fn:length(map.list)) eq 0}"> <!-- 상품목록이 없을 경우 -->
				<h2>상품내역이 없습니다.</h2>
			</c:if>
			<table class="product_table">
				<!-- 상품 목록 -->
				<c:forEach begin="0" end="${(fn:length(map.list) + 3) / 4 - 1}" var="row">
					<tr>
						<c:forEach begin="0" end="3" var="col">
							<c:set var="item" value="${map.list[row * 4 + col]}" />
								<td>
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
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
					<c:if test="${(fn:length(map.list)) ne 0}">
						<!-- 페이징 처리 -->
						<tr>
							<td colspan="4" align="center">
								<c:if test="${map.pager.curBlock >= 1}">
									<a href="#" onclick="list('${map.cate_no}', '1')">[처음]</a>
								</c:if>
								<c:if test="${map.pager.curBlock > 1}">
									<a href="#" onclick="list('${map.cate_no}', '${map.pager.prevPage}')">[이전]</a>
								</c:if>
								<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
									<c:choose>
										<c:when test="${num == map.pager.curPage}">
											<span style="color:red;">${num}</span>
										</c:when>
										<c:otherwise>
											<a href="#" onclick="list('${map.cate_no}', '${num}')">${num}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${map.pager.curBlock < map.pager.totBlock}">
									<a href="#" onclick="list('${map.cate_no}', '${map.pager.nextPage}')">[다음]</a>
								</c:if>
								<c:if test="${map.pager.curBlock < map.pager.totPage}">
									<a href="#" onclick="list('${map.cate_no}', '${map.pager.totPage}')">[끝]</a>
								</c:if>
							</td>
						</tr>
					</c:if>
				</table>
		</section>
		<!-- footer -->
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>