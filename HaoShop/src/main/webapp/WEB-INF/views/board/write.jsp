<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write</title>
	<link rel="stylesheet" type="text/css" href="resources/css/board/write.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function createB() {
			var m_no=$("#m_no").val();
			var m_id=$("#m_id").val();
			var b_title=$("#b_title").val();
			var b_content=CKEDITOR.instances.b_content.getData();
			var titleLength=b_title.length;
	
			if(!b_title) {
				swal("", "제목을 입력하세요.", "error");
			} else if(titleLength>50) {
				swal("", "제목이 너무 깁니다.", "error");
			} else if(b_content==""){ 
		 		swal("", "글내용을 입력해 주세요!!.", "error");
		 		return false; 
			} else {
				swal({
					icon: "warning",
					text: "지금 게시글 등록을 하시겠습니까?",
					closeOnClickOutside : false,
					closeOnEsc : false, 
					buttons: ["돌아가기", "작성 완료!"],
					}).then(function(isConfirm) {
					if (isConfirm) { 
						swal('등록 완료!','게시글 등록을 완료했습니다.','success').then(function(isConfirm) {
						$.ajax({
							type : "POST",
							url : "createBoard",
							data : {
								"m_no" : m_no,
								"m_id" : m_id,
								"b_title" : b_title,
								"b_content" : b_content
							}, success : function(data) {
								location.href='board';
							}
						});
					});
				}
			});
		}
	}

	// 키보드로 글자수 입력 받았을 때 글자카운트 스크립트
	$(document).ready(function(){
		$('#b_title').keyup(function(){
			// 남은 글자수를 구한다.
			var titleLength = $(this).val().length; //현재 글자수
			var remain = 50 - titleLength;
			
			// 문서 객체에 남은 글자수 표시
			$('#titleCount').html(remain);
			
			if(remain>=0){
			      $('#titleCount').css('color', 'green');
			}else{
			      $('#titleCount').css('color', 'red');
			}
			
			if(remain<0) {
				swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
			}
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp" %>
	<section class="write-content">
		<div class="organize">
			<input type="hidden" name="m_no" id="m_no" value="${member.m_no}" />
			<input type="hidden" name="m_id" id="m_id" value="${member.m_id}" />
			<h3>게시글 작성</h3>
			<ul class="textb">
				<li class="textb_title">
					<div>
						<span>제목</span>
						<input type="text" name="b_title" id="b_title" maxlength="70" size="70%" />
						<span id="titleCount" style="color:green;">50</span><span>/50</span>
					</div>
				</li>
				<li>
					<textarea name="b_content" id="b_content" cols="88" rows="50"></textarea>
					<script>
						CKEDITOR.replace( 'b_content', {} );
					</script>
				</li>
				<li class="textb_bottom">
					<div class="textb_bottom_button">
						<input type="button" class="updateWrite" value="작성" onClick="createB()" />
						<button class="updateList" onClick="location.href='board'">취소</button>
					</div>
				</li>
			</ul>
		</div>
	</section>
	
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>