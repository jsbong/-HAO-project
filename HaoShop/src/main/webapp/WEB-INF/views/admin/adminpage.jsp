<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/admin_bar.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
<section class="member_section">
  <h1 align="center">관리자 페이지</h1>
  <h3 align="center">ㅇㅁㄴㅇㅁㄴㅇㅁㅇ</h3>
<h3>일일 방문자 수</h3>
<h4><p style="color: red;">${map.cntToday}명</p></h4><br>
<a href="deliver?sPrd=배송대기중"><h3>배송 대기중인 주문</h3></a>
<h4><p style="color: red;">${map.waitDelCnt}개</p></h4><br>
<h3>신규 가입 회원</h3>	
<h4><p style="color: red;">${map.newMemberCnt}명</p></h4>

<div class="member_div">
  <table>
    <tr>
      <th>회원 번호</th>
      <th>ID</th>
      <th>이름</th>
      <th>생년월일</th>
      <th>전화번호</th>
      <th>주소</th>
    </tr>
    <tr>
      <c:forEach begin="0" end="${(fn:length(map.m_list))}" var="i">
			<c:set var="row_m" value="${map.m_list[i]}" />
			<c:choose>
				<%-- 검색결과가 있을 때 --%>
				<c:when test="${not empty row_m}">
					<tr bgcolor="#fff" height="50">
						<td align="center"><a href="memberDetail?m_no=${row_m.m_no}">${row_m.m_no}</a></td>
						<td align="center">${row_m.m_id}</td>
						<td align="center">${row_m.m_name}</td>
						<td align="center"><fmt:parseDate var="parseRegDate" value="${row_m.m_birth}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
							${resultRegDt}</td>
						<td align="center">${row_m.m_phone}</td>
						<td align="center">${fn:split(row_m.m_addr, '*')[1]}</td>
					</tr>
				</c:when>
				<%-- 검색결과가 없을 떄 --%>
				<c:when test="${map.newMemberCnt == 0}">
					<tr style="text-align: center;">
						<td colspan='5'><b>신규 가입 회원이 없습니다.</b></td>
					</tr>
				</c:when>
			</c:choose>
		</c:forEach>
    </tr>
</table>
</div>
<h3>금일 주문 현황</h3>
	
	<div align="center">
			<table class="list">
			<tr>
				금일 주문 내역 갯수:<b style="color: blue;">${map.count}</b>
			</tr> 
			</table>
		</div>
			
		<div class="member_div">
 			 <table>
    			<tr>
					<td>주문 번호</td>
					<td>회원 번호</td>
					<td>주문일자</td>
					<td>상품명</td>
					<td>결제금액</td>
					<td>배송현황</td>
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
										<select name="${row.pay_no}" value="${row.pay_state}" onchange="stachange('${row.pay_no}')">
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
				<tr>
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
			function list(page) {
				location.href="adminpage?curPage="+page;
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


</section>
</body>
</html>