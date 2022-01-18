<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>cart</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript" src="resources/js/cart.js" charset="UTF-8"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/cart.css?after">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@ include file="../include/header.jsp" %>
		<section class="section_cart">
		<h2>상품목록</h2>
		<table class="cart" align="center">
			<tr>
				<th><input id="checkAll" type="checkbox" checked /></th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>옵션</th>
				<th>판매가</th>
				<th>수량</th>
				<th>합계</th>
				<th>선택</th>
			</tr>
			<c:set var="priceSum" value="0" />
			<c:set var="deliverySum" value="0" />
			<c:forEach items="${cartPrd}" var="cartprd">
				<tr align="center">
					<!--체크박스-->
					<td>
						<input type="checkbox" name="chk" onclick="calCart()" value="${cartprd.p_no}" checked />
						<input type="hidden" name="p_sum" value="${cartprd.p_sum}" />
						<input type="hidden" name = "m_no" id="m_no" value="${member.m_no}"/>
					</td>
					<td><img src="${cartprd.p_img}" width="75" height="75"></td><!-- 이미지 -->
					<td>${cartprd.p_name}</td><!-- 상품명 -->
					<td>${cartprd.p_size}</td>
					<td><fmt:formatNumber value="${cartprd.p_price}" pattern="#,###"/></td><!-- 판매가 -->
					<td><fmt:formatNumber value="${cartprd.pay_quantity}" pattern="#,###"/></td><!-- 수량 -->
					<td><fmt:formatNumber value="${cartprd.p_sum}" pattern="#,###"/></td><!-- 합계 -->
					<td>
						<input type="button" id="delCart" onClick="delCart('${cartprd.p_no}', '${member.m_no}', '${cartprd.p_size}')" value="삭제" />
						<input type="hidden" id="p_no" value="${cartprd.p_no}" />
					</td>
				</tr>
				<c:set var="priceSum" value="${priceSum + cartprd.p_sum}" />
			</c:forEach>
			<tr align="center">
				<td colspan="9">
					<input type="hidden" name = "m_no" id="m_no" value="${member.m_no}"/>
					<input type="button" name="cartClear" id="cartClear" onclick="cartClear()" value="상품 비우기" />
				</td>
			</tr>
		</table>
		<h2>결제</h2>
		<table class="cart3" align="center">
			<tr align="center">
				<th colspan="2">총 상품 금액</th>
				<th></th>
				<th colspan="2">총 배송비</th>
				<th></th>
				<th>총 합계</th>
			</tr>
			<tr align="center">
				<td colspan="2"><h2 id="p_sum"><fmt:formatNumber value="${priceSum}" pattern="#,###" /></h2></td>
				<td><h2>+</h2></td>
				<td colspan="2"><h2><fmt:formatNumber value="${5000}" pattern="#,###" /></h2></td>
				<td><h2>=</h2></td>
				<td><h2 id="total"><fmt:formatNumber value="${priceSum + 5000}" pattern="#,###" /></h2></td>
			</tr>
			<tr align="center">
				<td colspan="7">
					<input type="button" id="payCart" onclick="payCart()" value="결제하기" />
					<input type="hidden" name="hiddenbtn" id="hiddenbtn" value="cartpage" />
				</td>
			</tr>
		</table>
		<script>
			$(document).ready(function() {	// 최상단 체크박스 클릭
				$("#checkAll").click(function() {	// 클릭
					if ($("#checkAll").prop("checked")) {	// input tag name="chk" checked=true
						$("input[name=chk]").prop("checked", true);
					} else {
						$("input[name=chk]").prop("checked", false);
					}
				})
				
				$("input[name=chk]").click(function() {
					if ($("input[name=chk]").length == $("input[name=chk]:checkbox:checked").length) {
						$("#checkAll").prop("checked", true);
					} else {
						$("#checkAll").prop("checked", false);
					}
				})
			})
			
			function payCart() {
				var m_no = $("#m_no").val();
				var hiddenbtn = $("#hiddenbtn").val();
				if ($("input[name=chk]:checkbox:checked").length == 0) {
					swal("", "결제할 상품을 선택해주세요.", "warning");
				} else {
					$.ajax({
						type : "POST",
						url : "payment",
						data : {
							"m_no" : m_no,
							"hiddenbtn" : hiddenbtn
						}, success : function(data) {
							console.log(data);
							window.location.href="payment";
						}
					});
				}
			}
		</script>
		</section>
		<%@ include file="../include/footer.jsp" %>
	</body>
</html>