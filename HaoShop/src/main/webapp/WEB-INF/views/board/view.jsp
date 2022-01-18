<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/view.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	// 게시물 삭제 확인
	function deleteB() {
		swal({
			 icon: "warning",
			 text: "정말 게시글을 삭제하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["돌아가기", "삭제하기"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm)
			   		{
						location.href='delete?b_no='+${board.b_no};
			    	});
			  }
			})
	}
	
	$("#list_btn").click(function(){
		self.location="board?"
				+ "searchOption=${searchOption}&keyword=${keyword}"
				+ "&search=${search}&curPage=${curPage}";
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${board.b_title}</title>
</head>
<body>
<!-- header -->
<%@ include file="../include/header.jsp" %>

<!-- 게시판 상세 페이지 -->
<section class="board_section">
	<br><br>
	<h2 class="title">게시판</h2>
	<br>
	<br>
	<form>
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="b_no" value="${board.b_no}">
		<table border=1 class="board_form">
			<tr>
				<td class="t_title">멤버</td>
				<td class="t_value">${board.m_no}</td>
			</tr>
			<tr>
				<td class="t_title">조회수</td>
				<td class="t_value">${board.b_viewcnt}</td>
			</tr>
			<tr>
				<td class="t_title">제목</td>
				<td class="t_value">${board.b_title}</td>
			</tr>
			<tr>
				<td class="t_title">작성자</td>
				<td class="t_value">${board.m_id}</td>
			</tr>
			<tr valign="top">
				<td class="t_content">내용</td>
				<td class="c_value">${board.b_content}</td>
			</tr>
			<tr>
				<td class="t_title">작성일</td>
				<td class="t_value">
					${board.b_regdate}  
				</td>
			</tr>
		</table>
	</form>

	
	<div class="board_main">
		<div align="center">
			<button class="list_button" onClick="location.href='board'">목록</button>
			<br>
			<br>
			<c:if test="${map.previousB != null}">
				<button class="previous" onClick="location.href='view?b_no=${map.previousB.b_no}'">이전글</button>
			</c:if>
			<c:if test="${map.nextB != null}">
				<button class="next" onClick="location.href='view?b_no=${map.nextB.b_no}'">다음글</button>
			</c:if>
			
		</div>

		<div class="write">
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${member.m_id == board.m_id}">
			<br>
			<a href="updateWrite">수정</a>&nbsp;&nbsp;&nbsp;
			<a href="#" onClick="deleteB()">삭제</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		</div>
	</div>
	
	
	<br/><br/><br/>
	<!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
	<div class="simpleView-content">
		<table class="simpleView">
			<c:if test="${map.previousB != null}">
			<tr class="a">
				<td onClick="location.href='view?b_no=${map.previousB.b_no}'"
				style="cursor: pointer">이전글</td>
				<td onClick="location.href='view?b_no=${map.previousB.b_no}'"
				style="cursor: pointer;width:400px;">${map.previousB.b_title}</td>
				<td class="tdS">${map.previousB.m_id}</td><td class="tdS">${map.previousB.b_regdate}</td>
			</tr>
			</c:if>
			<c:if test="${map.nextB != null}">
			<tr class="b">
				<td onClick="location.href='view?b_no=${map.nextB.b_no}'"
				style="cursor: pointer">다음글</td>
				<td  onClick="location.href='view?b_no=${map.nextB.b_no}'" 
				style="cursor: pointer;width:400px;">${map.nextB.b_title}</td>
				<td class="tdS">${map.nextB.m_id}</td><td class="tdS">${map.nextB.b_regdate}</td>
			</tr>
			</c:if>
		</table>
	</div>
	</section>
	
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>