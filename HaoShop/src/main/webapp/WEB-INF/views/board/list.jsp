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
	<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<title>FORUM</title>

</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<div class="board_section">
	<input type="hidden" id="curPage" value="${curPage }"/>
	<h2 class="title">FORUM</h2>
	<br><br>
	
			<!-- 일반 사용자일 때 -->
				<c:if test="${member.m_id != null && member.m_no != null}">
				<button type="button" class="text" onClick="location.href='write'">글쓰기</button>
				</c:if>
				<br>
				<br>
			<!-- 검색했을 때 카운트-->
				<c:if test="${map.search eq 's'}">
					<c:choose>
						<c:when test="${map.count == 0 }">
						<br/><span style="font-family:'돋움';">게시글이 없습니다. 검색을 다시 확인해주세요.&nbsp;</span>
						</c:when>
						<c:otherwise>
						<span style="font-family:'돋움';">${map.count}개의 게시물이 있습니다.&nbsp;</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			
			<table class="board_section">
				<tr height="50">
					<th class="list1" width="5%">번호</th>
					<th class="list1" width="5%">멤버</th>
					<th class="list1" width="50%">제목</th>
					<th class="list1" width="15%">작성자</th>
					<th class="list1" width="15%">작성일</th>
					<th class="list1" width="5%">조회</th>
				</tr>
				<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
						<input type="hidden" id="b_no" name="b_no" value="${row.b_no}"/>
					<c:choose>
					<%-- 검색결과가 있을 때 --%>
					<c:when test="${not empty row}">
					<tr>
						<td class="list2">${row.b_no}</td>
						<td class="list2">${row.m_no}</td>
						<td class="list2" style="text-align:left; margin:0 auto;"><a href="view?b_no=${row.b_no}">${row.b_title}</a>
						<td class="list2" style="text-align:center;">${row.m_id}</td>
					<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
					<fmt:formatDate value="${row.b_regdate}" pattern="yyyyMMdd" var="regDate"/>
					<c:choose>
					<c:when test="${today == b_regDate}" >
						<td class="list2" style="color:red;">오늘</td>					
					</c:when>
					<c:otherwise>
						<td class="list2">${row.b_regdate}</td>
					</c:otherwise>
					</c:choose>
						<td class="list2">${row.b_viewcnt}</td>
					</tr>
					</c:when>
					<%-- 검색결과가 없을 떄 --%>
					<c:when test="${map.count == 0}">
					<tr style="text-align:center;"><td colspan='5'>
					<b style="color: red; font-size:30px;">'${keyword}'</b> 에 대한 검색결과가 없습니다.
					</td>
					</tr>
					</c:when>
					</c:choose>
				</c:forEach>
			</table>
		
			<br />
			<br />
			
			<!-- 페이지 네비게이션 출력 -->
			<div>
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
			<form action="board" class="boardsearch">
					<select name="searchOption" id="searchOption">
						<option value="ALL" <c:out value="${map.searchOption=='ALL'?'selected':''}"/> >제목+이름+내용</option>
						<option value="B_TITLE" <c:out value="${map.searchOption=='B_TITLE'?'selected':''}"/> >제목</option>
						<option value="M_ID" <c:out value="${map.searchOption=='M_ID'?'selected':''}"/> >이름</option>
						<option value="B_CONTENT" <c:out value="${map.searchOption=='B_CONTENT'?'selected':''}"/> >내용</option>
					</select> 
				<input type="text" name="keyword" placeholder="검색어 입력" id="keyword" value="${keyword}">
				<input type="hidden" name="search" id="search" value="s"/>
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
	<%@ include file="../include/footer.jsp"%>
</body>
</html>

