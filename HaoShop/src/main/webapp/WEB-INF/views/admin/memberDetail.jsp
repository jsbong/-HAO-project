<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberDetail</title>
	<link rel="stylesheet" href="resources/css/admin/memberDetail.css">
</head>
<body>
	<!-- admin_bar -->
	<%@ include file="../admin/admin_bar.jsp" %>
	<!-- 회원상세 section -->
	<section class="memberDetail_section">
		<div class="memberDetail_div">
			<h1>${memberdetail.m_name}님 회원 정보</h1>
			<table class="memberDetail_table">
				<tr>
					<th>회원 번호</th>
					<td>${memberdetail.m_no}</td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td>${memberdetail.m_name}</td>
				</tr>
				<tr>
					<th>회원 생년월일</th>
					<td>${memberdetail.m_birth}</td>
				</tr>
				<tr>
					<th>회원 이메일(ID)</th>
					<td>${memberdetail.m_email}</td>
				</tr>
				<tr>
					<th>회원 핸드폰 번호</th>
					<td>${memberdetail.m_phone}</td>
				</tr>
				<tr>
					<th>회원 가입일</th>
					<td>${memberdetail.m_regdate}</td>
				</tr>
				<tr>
					<th>총 구매금액</th>
					<td>
						<fmt:formatNumber value="${map.totalpay}" pattern="#,###"/>원
					</td>
				</tr>
				<tr>
					<th>구매물품</th>
					<td>
						<table class="payment_detail">
							<tr>
								<th>구매번호</th>
								<th>상품번호</th>
								<th>구매날짜</th>
								<th>상품명</th>
								<th>구매금액</th>
								<th>주문 상태</th>
							</tr>
							<c:forEach begin="0" end="${(fn:length(map.mypL))}" var="i">
								<c:set var="row" value="${map.mypL[i]}" />
								<c:choose>
									<%-- 검색결과가 있을 때 --%>
									<c:when test="${not empty row}">
										<tr>
											<td>${row.pay_no}</td>
											<td>${row.p_no}</td>
											<td>${row.pay_regdate}
											<td>${row.p_name}</td>
											<td><fmt:formatNumber value="${row.p_sum}" pattern="#,###"/>원</td>
											<td>${row.pay_state}</td>
										</tr>
									</c:when>
									<%-- 검색결과가 없을 떄 --%>
									<c:when test="${map.count == 0}">
										<tr style="text-align: center;">
											<td colspan='6'><b>주문내역이 없습니다.</b></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</table>
						<!-- 페이지 네비게이션 출력 -->
						<div class="paging">
							<c:if test="${map.pager.curBlock > 1}">
								<a href="memberDetail?myp=1&m_no=${memberdetail.m_no}">[처음]</a>
							</c:if>
							<c:if test="${map.pager.curBlock > 1}">
								<a href="memberDetail?myp=${map.pager.prevPage}&m_no=${memberdetail.m_no}">[이전]</a>
							</c:if>
							<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
								<c:choose>
									<c:when test="${num == map.pager.curPage}">
										<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
										<span style="color: red;">${num}</span>
									</c:when>
									<c:otherwise>
										<a href="memberDetail?m_no=${memberdetail.m_no}&myp=${num}">${num}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${map.pager.curBlock < map.pager.totBlock}">
								<a href="memberDetail?myp=${map.pager.nextPage}&m_no=${memberdetail.m_no}">[다음]</a>
							</c:if>
							<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
								<a href="memberDetail?myp=${map.pager.totPage}&m_no=${memberdetail.m_no}">[끝]</a>
							</c:if>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>