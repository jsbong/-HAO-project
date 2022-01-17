<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>ProductList</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/product.js" charset="UTF-8"></script>
		<link rel="stylesheet" href="resources/css/productList.css">
        <link rel="stylesheet" href="resources/css/admin_bar.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script>
			function list(page) {
				location.href="productList?curPage="+page;
			}
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
		<section class="member_section">
			<h1 align="center">상품 관리목록</h1>
        	<h3 align="center">상품 리스트</h3>
        	<div class="member_div">
			<form name="f3rm" id="f3rm" enctype="multipart/form-data">
				<table>
					<tr>
						<th>상품 번호</th>
            			<th>카테고리 번호</th>
            			<th>이미지</th>
            			<th>가격</th>
            			<th>할인가</th>
            			<th>재고</th>
					</tr>
					<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
						<c:set var="product" value="${map.list[i]}" />
						<c:if test="${not empty product}">
							<tr>
								<td>${product.cate_no}</td>
								<td><img src="${fn:split(product.p_img, '*')[0]}" width="100" height="100"></td>
								<td>${product.p_name}</td>
								<td>${product.p_no}</td>
								<td>${product.p_price}</td>
								<td>${fn:split(product.p_img, '*')[0]}</td>
							</tr>
						</c:if>
					</c:forEach>
				<tr>
					<td colspan="7" align="center">
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock > 1}">
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
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<!-- 페이징을 지정할 태그에 class에 pagination을 넣으면 자동으로 페이징이 된다.-->
<!-- 페이징의 크기를 제어할 수 있는데 pagination-lg를 추가하면 페이징 크기가 커지고, pagination-sm를 넣으면 작아진다. -->
<!-- 큰 페이징 class="pagination pagination-lg", 보통 페이징 class="pagination", 작은 페이징 class="pagination pagination-sm" -->
<ul class="pagination">
<!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.-->
<!-- disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
<li class="disabled">
<a href="#">
<span>«</span>
</a>
</li>

<li class="active"><a href="#">1</a></li>
<li><a href="member">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li>
<a href="#">
<span>»</span>
</a>
</li>
</ul>
		</form>
		</section>
		<%@ include file="../include/csinfo.jsp" %>
	</body>
</html>