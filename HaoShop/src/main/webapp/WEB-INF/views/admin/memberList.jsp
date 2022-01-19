<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>
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
  <h1 align="center">회원 관리목록</h1>
  <h3 align="center">회원 정보</h3>
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
      <c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
					<c:choose>
						<%-- 검색결과가 있을 때 --%>
						<c:when test="${not empty row}">
							<tr bgcolor="#fff" height="50">
								<td align="center"><a href="memberDetail?m_no=${row.m_no}">${row.m_no}</a></td>
								<td align="center">${row.m_id}</td>
								<td align="center">${row.m_name}</td>
								<td><fmt:formatDate value="${row.m_birth}" pattern="yyyy-MM-dd" /></td>
								<td align="center">${row.m_phone}</td>
								<td align="center">${fn:split(row.m_addr, '*')[1]}</td>
							</tr>
						</c:when>
						<%-- 검색결과가 없을 떄 --%>
						<c:when test="${map.count == 0}">
							<tr style="text-align: center;">
								<td colspan='5'><b>회원이 없습니다.</b></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
    </tr>
</table>
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
</section>
<script>
			function list(page) {
				location.href="memberList?curPage="+page;
			}
		</script>
</body>
</html>