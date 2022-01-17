<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deliver</title>
</head>
<body>
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/admin_bar.css">
</head>
<body>
<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
<section class="member_section">
  <h1 align="center">배송 현황</h1>
  <h3 align="center">회원&상품 정보</h3>
<div class="member_div">
			<table>
				<tr>
					<th>구매 번호</th>
					<th>회원 번호</th>
					<th>구매날짜·구매시간</th>
					<th>배송현황</th>
					<th>배송상태 변경</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th colspan="2">주소</th>
					<th>전화번호</th>
				</tr>
				<tr>
					<td>6</td>
					<td>7</td>
					<td colspan="2">8</td>
					<td>9</td>
				</tr>
			</table>
			
		<div align="center">
			<table class="list">
			<tr>
			총 주문 내역 갯수:<b style="color: green;">${map.count}</b>
			</tr> 
			</table>
		</div>	
		<div class="order">
			<table cellpadding="0" cellspacing="0" class="orderlist" align="center" width="950">
			<tr align="right">
			<td colspan="3" width="70%"></td>
			</tr>
				<tr bgcolor="#7FB3FA" align="center">
					<td>주문 번호</td>
					<td>회원 번호</td>
					<td>주문일자</td>
					<td>상품명</td>
					<td>결제금액</td>
					<td>배송현황</td>
				</tr>
				<!-- "주문내역" -->
				<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
					<c:choose>
						<%-- 검색결과가 있을 때 --%>
						<c:when test="${not empty row}">
							<tr bgcolor="#fff" height="50">
								<td align="center">${row.pay_no}</td>
								<td align="center">${row.m_no}</td>
								<td align="center">${row.pay_regdate}
								<td>${row.p_name}</td>
								<td align="center"><fmt:formatNumber value="${row.p_sum}" pattern="#,###"/>원</td>
									<td align="center">
										<input class="stachange"+${i} type="text" value="${row.pay_state}" size="4" data-tab="${row.pay_state}">
										<input class="pay_no" type="hidden" value="${row.pay_no}" data-tab1="${row.pay_no}" />
										<input type="button" value="변경" onclick="stachange()" />
									</td>
							</tr>
						</c:when>
						<%-- 검색결과가 없을 떄 --%>
						<c:when test="${map.count == 0}">
							<tr style="text-align: center;">
								<td colspan='5'><b>주문내역이 없습니다.</b></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
				<tr>
					<td><input type="text" class="abc"></td>
				</tr>
			</table>
			<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
					<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
				</c:if>
			</div>
		</div>
		<script>
			function chkingg() {
				var pay_state = $(".stachange").val();
				$(".abc").val(pay_state);
			}
			
			
			function list(page) {
				location.href="deliver?curPage="+page;
			}
			function stachange() {
				
				var pay_state = $(".stachange").attr("data-tab");
				var pay_no = $(".pay_no").attr("data-tab1");
				alert(pay_state+" "+pay_no);
				$.ajax({
					type : "POST",
					url : "paystate",
					data : {
						"pay_no" : pay_no,
						"pay_state" : pay_state
					}, success : function(data) {
						alert("변경 완료");
					}
				});
					document.sta.method="POST";
					document.sta.action="paystate";
					document.sta.submit();
			}
		</script>
</body>
</html>

