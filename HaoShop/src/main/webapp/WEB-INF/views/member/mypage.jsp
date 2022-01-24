<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE htm>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>mypage | HaoSHop</title>
	<link rel="stylesheet" type="text/css" href="resources/css/member/mypage.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(document).ready(function() {
			$("#paymentDetail_button").click(function() {
				$(".background").addClass("show");
			});
			
			$(".window").click(function(e) {
				if($(".window").has(e.target).length === 0) {
				$(".background").removeClass("show");
				}
			});
		});
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<section class="mypage-content">
		<div class="mypage_detail">
			<!-- 회원이름 및 이메일, 구매건수 -->
			<div class="member_name">
				<div class="name">
					<h1 class="myname">${member.m_name}님</h1>
					<span class="myemail">${member.m_email}</span>
				</div>
				<ul class="pay_count">
					<li><span>구매건수</span><br></li>
					<li><h2>${map.count}</h2></li>
				</ul>
			</div>
			<!-- 회원정보 -->
			<div class="member_info">
				<h4>회원정보</h4>
				<span>가입일(${member.m_regdate})</span>
				<span>주소 : ${fn:split(member.m_addr,'*')[1]} ${fn:split(member.m_addr,'*')[2]}</span>
				<span><i class="fas fa-phone-alt"></i> ${member.m_phone}</span>
				<div>
					<input type="button" value="수정" onClick="location.href='mypage2'">
					<input type="button" value="탈퇴" onClick="location.href='mypage5'">
				</div>
			</div>
			<!-- 주문내역 -->
			<div class="member_order">
				<h4>주문내역</h4>
				<ul class="member_order_detail">
					<c:forEach begin="0" end="${(fn:length(map.mypL))}" var="i">
						<c:set var="row" value="${map.mypL[i]}" />
						<c:choose>
							<%-- 검색결과가 있을 때 --%>
							<c:when test="${not empty row}">
								<li>
									<h4>${row.pay_state}</h4>
									<div class="payment_info">
										<div class="payment_detail">
											<a href="productpage?p_no=${row.p_no}"><img src="${fn:split(row.p_img, '*')[0]}"></a>
										</div>
										<div class="payment_explain">
											<span style="color: darkgray">${row.pay_regdate} ORDER</span>
											<span>${row.p_name}</span>
											<span><fmt:formatNumber value="${row.p_sum}" pattern="\#,###"/></span>
											<span>(${fn:split(member.m_addr,'*')[0]}) ${fn:split(member.m_addr,'*')[1]} ${fn:split(member.m_addr,'*')[2]}</span>
										</div>
									</div>
								</li>
							</c:when>
							<%-- 검색결과가 없을 떄 --%>
							<c:when test="${map.count == 0}">
								<li></li>
							</c:when>
						</c:choose>
					</c:forEach>
				</ul>
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
		</div>
	</section>
	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>
   </body>
</html>