<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>HAOSHOP-PRODUCT</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
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
		<section>
			<div id="pdc">
				<c:if test="${(fn:length(map.list)) eq 0}">
					<span>
						<h2>상품내역이 없습니다.</h2>
					</span>
				</c:if>
				<c:forEach begin="0" end="${(fn:length(map.list) + 3) / 4 - 1}" var="row">
					<table id="product">
						<tr>
							<c:forEach begin="0" end="3" var="col">
								<c:set var="item" value="${map.list[row * 4 + col]}" />
								<c:if test="${not empty item}">
									<td width="300">
										<div onclick="location.href='productpage?p_no=${item.p_no}'" style="cursor: pointer">
											<div><img src="${item.p_img}" width="200" height="200"></div>
											<div>${item.p_name}</div>
											<div><fmt:formatNumber value="${item.p_price}" pattern="#,###,###"/>원</div>
										</div>
									</td>
								</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
					<c:if test="${(fn:length(map.list)) ne 0}">
						<tr>
							<td colspan="4" align="center">
								<c:if test="${map.pager.curBlock > 1}">
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
			</div>
		</section>
		<!-- footer -->
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>