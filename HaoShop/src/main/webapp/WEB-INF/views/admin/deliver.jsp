<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			총 주문 내역 개수:<b style="color: green;">${map.count}</b>
			</tr> 
			</table>
		</div>	
		<div class="order">
			<table cellpadding="0" cellspacing="0" class="orderlist" align="center" width="950">
			<tr align="right">
			<td colspan="3" width="70%"></td>
			</tr>
				<tr bgcolor="#7FB3FA" align="center">
					<td>번호</td>
					<td>주문일자</td>
					<td>상품명</td>
					<td>결제금액</td>
					<td>배송현황</td>
				</tr>
				<!-- "주문내역" -->
				<c:forEach begin="0" end="${(fn:length(map.mypL))}" var="i">
					<c:set var="row" value="${map.mypL[i]}" />
					<c:choose>
						<%-- 검색결과가 있을 때 --%>
						<c:when test="${not empty row}">
							<tr bgcolor="#fff" height="50">
								<td align="center">${row.pay_no}</td>
								<td align="center">${row.pay_regdate}
								<td>${row.p_name}</td>
								<%-- <fmt:formatNumber value="${row.p_sum}" pattern="#,###"/> --%>
								<td align="center"><fmt:formatNumber value="${row.p_sum + 5000}" pattern="#,###"/>원</td>
								<td align="center">${row.pay_state}</td>
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
			</table>
			<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="mypL?myp=1&m_no=${m_no}">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="mypL?myp=${map.pager.prevPage}&m_no=${m_no}">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="mypage?m_no=${m_no}&myp=${num}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="mypL?myp=${map.pager.nextPage}&m_no=${m_no}">[다음]</a>
				</c:if>
				<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
					<a href="mypL?myp=${map.pager.totPage}&m_no=${m_no}">[끝]</a>
				</c:if>
			</div>
		</div>
		
</body>
</html>

