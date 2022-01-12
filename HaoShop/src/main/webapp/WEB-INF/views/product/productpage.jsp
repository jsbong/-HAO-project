<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="resources/js/cart.js" charset="UTF-8"></script>
		<script type="text/javascript" src="resources/js/product.js" charset="UTF-8"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/productpage.css">
		<title>Decorating's</title>
	</head>
	<body>
		<script>
			$("#pay_quantity").keyup(function(e){
				var regNumber = /^([0-9]{2})$/;
				var str = $(this).val();
				if(!regNumber.test(str)) {
					var res = str.substring(0, str.length-1);
					$(this).val(res);
				}
			});
		</script>
		<%@ include file="../include/menu.jsp" %>
		<div class="productdetail">
			<form>
				<img class="productLeft" src="${product.p_img}">
				<div class="productRight">
					<p align="left" class="p1">상품명: ${product.p_name}</p>
					<p align="left" class="p2">가격: <fmt:formatNumber value="${product.p_price}" pattern="#,###"/>원</p>
					<p align="left">상품코드: ${product.p_no}</p>
					<p align="left">수량: <input type="number" id="pay_quantity" min="1" maxlength="2" max="99" value="1" oninput="mxNum(this)" /></p>
					<script>
						function mxNum(object) {
							if (object.value.length > object.maxLength) {
								object.value = object.value.slice(0, object.maxLength)
							}
						}
					</script>
					<p align="left">사이즈: 
						<select id="p_size">
							<c:forEach items="${fn:split(product.p_size, ',')}" var="opt">
								<option value="${opt}">${opt}</option>
							</c:forEach>
						</select>
					</p>
					<p align="left">본 상품은 서울배송만 가능합니다.</p><br><br><br>
					<input type="hidden" name="p_img" id="p_img" value="${product.p_img}" />
					<input type="hidden" name="m_no" id="m_no" value="${member.m_no}" />
					<input type="hidden" name="p_no" id="p_no" value="${product.p_no}" />
					<p align="left">
						<input type="button" name="buy" id="buy" onclick="buyProduct()" value="구매하기" />&nbsp;&nbsp;&nbsp;
						<input type="button" name="cart" id="cart" onclick="insertCart()" value="장바구니" />
						<input type="hidden" name="hiddenbtn" id="hiddenbtn" value="prdpage" />
					</p>
				</div>
			</form>
		</div>
		<div class="detail">
			<table style="width: 700px;">
				<tr>
					<th>상품 설명</th>
				</tr>
				<tr>
					<td>${product.p_explain}</td>
				</tr>
			</table>
		</div>
		<div class="danger">
			<table style="width: 700px; text-align: left;">
				<tr>
					<th>주의 사항</th>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;13시 이전 결제 완료시 당일 배송</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;반품 및 교환 요청은 배송비 고객 부담</td>
				</tr>
			</table>
		</div>
		<%@ include file="../include/csinfo.jsp" %>
	</body>
</html>