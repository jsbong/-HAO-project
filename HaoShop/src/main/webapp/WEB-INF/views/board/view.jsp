<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
   <meta charset="UTF-8">
   <title>${board.b_title}</title>   
   <link rel="stylesheet" type="text/css" href="resources/css/board/view.css">
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
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
         });
      }
      
      $("#list_btn").click(function(){
         self.location="board?"
               + "searchOption=${searchOption}&keyword=${keyword}"
               + "&search=${search}&curPage=${curPage}";
      });
      
      // 댓글 작성
      function createC() {
    	  	var b_no = $("#b_no").val();
			var m_id=$("#m_id").val();
			var bc_content=$("#bc_content").val();
			
			if(bc_content==""){ 
		 		swal("", "글내용을 입력해 주세요!!.", "error");
		 		return false; 
			} else {
				swal({
					icon: "warning",
					text: "댓글 등록을 하시겠습니까?",
					closeOnClickOutside : false,
					closeOnEsc : false, 
					buttons: ["돌아가기", "작성 완료!"],
					}).then(function(isConfirm) {
					if (isConfirm) { 
						swal('등록 완료!','댓글 등록을 완료했습니다.^^','success').then(function(isConfirm) {
						$.ajax({
							type : "POST",
							url : "createCommentBoard",
							data : {
								"b_no" : b_no,
								"m_id" : m_id,
								"bc_content" : bc_content
							}, success : function(data) {
								location.href = "view?b_no=" + b_no;
							}
						});
					});
				}
			});
		}
	}
   </script>
</head>
<body>
   <!-- header -->
   <%@ include file="../include/header.jsp" %>
   <!-- 게시판 상세 페이지 -->
   <section class="board_section">
      <!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
      <input type="hidden" name="b_no" id="b_no" value="${board.b_no}">
      <c:choose>
	      <c:when test="${member.m_id eq null}">
	      	<input type="text" id="m_id" value="비회원">
	      </c:when>
	      <c:otherwise>
	      	<input type="text" id="m_id" value="${member.m_id}">
	      </c:otherwise>
      </c:choose>     
      <div class="board-content">
         <ul class="board_detail">
            <li>
               <ul class="board_form">
                  <li>
                     <p><a href="board">목록보기 <span style="font-size:13px;">&gt;</span></a></p>
                     <div class="board_title">
                        <h3>${board.b_title}</h3>
                        <c:choose>
                           <c:when test="${board.m_id eq 'Administrator'}">
                              <span style="font-size: 16px;">관리자</span><br>
                           </c:when>
                           <c:otherwise>
                              <span style="font-size: 16px;">${board.m_id}</span><br>
                           </c:otherwise>
                        </c:choose>
                        <span style="color:gray">${board.b_regdate}</span>
                        <span style="color:gray">조회 ${board.b_viewcnt}</span>
                     </div>
                  </li>
                  <li>내용</li>
                  <li class="user_content">${board.b_content}</li>
                  <!-- 댓글 작성 -->
                  <li>
                  	<span>댓글</span>
                  	<input type="text" id="bc_content">
                  	<input type="button" value="작성" onclick="createC()">	
                  	
                  </li>
                  <!-- 댓글 작성 후 -->
                  <%-- <li>
                  	<input type="text" value=""> 
                  </li>
				</c:forEach> --%>
                  <!--  -->
               </ul>
            </li>
            <li>      
               <div class="write">
                  <!-- 본인만 수정,삭제 버튼 표시 -->
                  <c:if test="${member.m_id == board.m_id}">
                     <a href="updateWrite">수정</a>
                     <a href="#" onClick="deleteB()">삭제</a>
                  </c:if>
               </div>
            </li>
            <li>
            </li>
         </ul>
      </div>
      <!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
      <div class="simpleView-content">
         <table class="simpleView">
            <c:if test="${map.previousB != null}">
            <tr class="prev" onclick="location.href='view?b_no=${map.previousB.b_no}'">
               <td>이전글</td>
               <td>${map.previousB.b_title}</td>
               <td>${map.previousB.m_id}</td>
               <td>${map.previousB.b_regdate}</td>
            </tr>
            </c:if>
            <c:if test="${map.nextB != null}">
            <tr class="next" onclick="location.href='view?b_no=${map.nextB.b_no}'">
               <td>다음글</td>
               <td>${map.nextB.b_title}</td>
               <td>${map.nextB.m_id}</td>
               <td>${map.nextB.b_regdate}</td>
            </tr>
            </c:if>
         </table>
      </div>
   </section>
   
   <!-- footer -->
   <%@ include file="../include/footer.jsp" %>
</body>
</html>