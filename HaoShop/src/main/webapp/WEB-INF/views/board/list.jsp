<jsp:useBean id="now" class="java.util.Date" />
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/board/board.css">
	<title>FORUM</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<section class="board_section">
		<div class="board_detail">
				<input type="hidden" id="curPage" value="${curPage }"/>
				<h2>BOARD</h2>
				<!-- 일반 사용자일 때 -->
				<c:if test="${member.m_id != null && member.m_no != null}">
					<button type="button" class="writeBtn" onClick="location.href='write'">글쓰기</button>
				</c:if>
			
				<!-- 검색했을 때 카운트-->
				<c:if test="${map.search eq 's'}">
					<c:choose>
						<c:when test="${map.count == 0 }">
						<span>${keyword}에 대한 게시글이 없습니다. 검색을 다시 확인해주세요.</span>
						</c:when>
						<c:otherwise>
						<span>${map.count}개의 게시물이 있습니다.</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			<table class="board_table">
				<tr>
					<th class="list1" width="8%">번호</th>
					<th class="list1" width="50%">제목</th>
					<th class="list1" width="13%">아이디</th>
					<th class="list1" width="13%">작성일</th>
					<th class="list1" width="8%">조회</th>
				</tr>
				<c:forEach begin="0" end="${(fn:length(map.listAdmin))}" var="j">
					<c:set var="adm" value="${map.listAdmin[j]}" />
						<%-- 검색결과가 있을 때 --%>
						<c:if test="${not empty adm}">
						<tr>
							<td class="list2 admin">${adm.b_no}</td>
							<td class="list2 admin"><a href="view?b_no=${adm.b_no}">${adm.b_title}</a>
							<td class="list2 admin">관리자</td>
							<td class="list2 admin">${adm.b_regdate}</td>
							<td class="list2 admin">${adm.b_viewcnt}</td>
						</tr>
						</c:if>
				</c:forEach>
				<!-- 사용자 -->
				<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
					<c:if test="${ row.m_id ne 'Administrator' }">
						<input type="hidden" id="b_no" name="b_no" value="${row.b_no}"/>
						<%-- 검색결과가 있을 때 --%>
						<c:if test="${not empty row}">
						<tr>
							<td class="list2">${row.b_no}</td>
							<td class="list2"><a href="view?b_no=${row.b_no}">${row.b_title}</a>
							<td class="list2" id="${row.m_id}">${row.m_id}</td>
							<td class="list2">${row.b_regdate}</td>
							<td class="list2">${row.b_viewcnt}</td>
						</tr>
						</c:if>
					</c:if>
				</c:forEach>
			</table>

		<!-- 페이지 네비게이션 출력 -->
		<div class="page_navigation">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="board?curPage=1
						&searchOption=${searchOption}&keyword=${keyword}
						&search=${search}">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="board?curPage=${map.pager.prevPage}
						&searchOption=${searchOption}&keyword=${keyword}
						&search=${search}">[이전]</a>
			</c:if>

			<c:forEach var="num" begin="${map.pager.blockBegin}" 
						end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color: red;">${num}</span>
					</c:when>
					
					<c:otherwise>
						<a href="board?curPage=${num}
						&searchOption=${searchOption}&keyword=${keyword}
						&search=${search}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
		<!-- 검색 조건 뷰 -->
		<div class="boardSearch">
			<form action="board">
				<input type="hidden" name="search" id="search" value="s"/>
				<select name="searchOption" id="searchOption">
					<option value="ALL" <c:out value="${map.searchOption=='ALL'?'selected':''}"/> >제목+이름+내용</option>
					<option value="B_TITLE" <c:out value="${map.searchOption=='B_TITLE'?'selected':''}"/> >제목</option>
					<option value="M_ID" <c:out value="${map.searchOption=='M_ID'?'selected':''}"/> >이름</option>
					<option value="B_CONTENT" <c:out value="${map.searchOption=='B_CONTENT'?'selected':''}"/> >내용</option>
				</select> 
				<input type="text" name="keyword" id="keyword" value="${keyword}">
				<input type="submit" class="check2" value="조회"/>
			</form>				
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="board?curPage=${map.pager.nextPage}
						&searchOption=${searchOption}&keyword=${keyword}
						&search=${search}">[다음]</a>
			</c:if>
			<c:if test="${(map.pager.totPage > 5) && 
			(map.pager.totPage != map.pager.curPage)}">
				<a href="board?curPage=${map.pager.totPage}
						&searchOption=${searchOption}&keyword=${keyword}
						&search=${search}">[끝]</a>
			</c:if>
		</div>
		</div>
	</section>
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>

