<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberStatus</title>
	<link rel="stylesheet" href="resources/css/admin/member.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function list(sPrd, page) {
			location.href="deliver?sPrd=" + sPrd + "&curPage=" + page;
		}
		function stachange(pay_no) {
			var pay_state = document.getElementsByName(pay_no)[0].value;
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
		}
	</script>
</head>
<body>
	<!-- admin_bar -->
	<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
	<!-- 배송 현황 section -->
	<section class="member_section">
		<div class="memberStatus-content">
  			<h1>배송 현황</h1>
			<ul>
				<li class="totalRight">
					<span>총 주문 내역 갯수: <b style="color: blue;">${map.count}</b></span>
				</li>
				<li class="deliveryStatus">
					<span class="viewDelivery"><a href="deliver?sPrd=배송대기중">배송 대기중</a></span>
					<span>|</span>
					<span class="viewDelivery"><a href="deliver?sPrd=배송중"> 배송 중</a></span>
					<span>|</span> 
					<span class="viewDelivery"><a href="deliver?sPrd=배송완료"> 배송 완료</a></span>
					<span>|</span> 
					<span class="viewDelivery"><a href="deliver?sPrd=">전체</a></span>
				</li>
				<li class="status_detail">
					<table class="memberStatus_table">
    					<tr>
							<th>주문 번호</th>
							<th>회원 번호</th>
							<th>주문일자</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>배송현황</th>
						</tr>
						<tr>
						<!-- "주문내역" -->
						<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
							<c:set var="row" value="${map.list[i]}" />
							<c:choose>
							<%-- 검색결과가 있을 때 --%>
								<c:when test="${not empty row}">
									<tr bgcolor="#fff" height="50">
										<td align="center">${row.pay_no}</td>
										<td align="center">${row.m_no}</td>
										<td><fmt:formatDate value="${row.pay_regdate}" pattern="yyyy-MM-dd" /></td>
										<td>${row.p_name}</td>
										<td align="center"><fmt:formatNumber value="${row.p_sum}" pattern="#,###"/>원</td>
										<td align="center">
										<label>
											<select name="${row.pay_no}" onchange="stachange('${row.pay_no}')">
										  		<option value="${row.pay_state}" hidden>${row.pay_state}</option>
										  		<option value="배송대기중">배송대기중</option>
										  		<option value="배송중">배송중</option>
										  		<option value="배송완료">배송완료</option>
											</select>
										</label>
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
						</tr>
					</table>				
				</li>
			</ul>
			<!-- 페이지 네비게이션 출력 -->
			<div class="paging">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onClick="list('${map.sPrd}', '1')">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onClick="list('${map.sPrd}', '${map.pager.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<span style="color: red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onClick="list('${map.sPrd}', '${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="#" onClick="list('${map.sPrd}', '${map.pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock < map.pager.totPage}">
					<a href="#" onClick="list('${map.sPrd}', '${map.pager.totPage}')">[끝]</a>
				</c:if>
			</div>
		</div>
		</section>
</body>
</html>

