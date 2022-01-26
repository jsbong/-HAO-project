<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>${board.b_title}</title>
	<link rel="stylesheet" type="text/css" href="resources/css/board/write.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script>
	function updateB() {
		var b_no=$("#b_no").val();
		var b_title=$("#b_title").val();
		var b_content=CKEDITOR.instances.b_content.getData();
		var titleLength=b_title.length;
		if(!b_title) {
			swal("error", "제목을 입력하세요.", "error");
		} else if(titleLength>50) {
			swal("", "제목이 너무 깁니다.", "error");
		} 
		else if(b_content == ""){ 
			 swal("error", "글내용을 입력해 주세요!!.", "error");
			 return false; 
		} 
		else {
			swal({
				 icon: "warning",
				 text: "정말 수정 하시겠습니까?",
				 closeOnClickOutside : false,
				 closeOnEsc : false, 
				 buttons: ["돌아가기", "수정 완료!"],
				}).then(function(isConfirm) {
				  if (isConfirm) {
				    swal('수정 완료!','게시글 수정을 완료했습니다.','success').then(function(isConfirm)
				    	{
				    		$.ajax({
								type : "POST",
								url : "updateBoard",
								data : {
									"b_no" : b_no,
									"b_title" : b_title,
									"b_content" : b_content
							}, success : function(data) {
								location.href="view?b_no="+b_no;
							}
						});
				    	});
				  }
				})
		}
	}
	
	//키보드로 글자수 입력 받았을 때 글자카운트 스크립트
	$(document).ready(function(){
		/* 키보드 이벤트 활용 */
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
		})
	})
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp" %>
	<section class="write-content">
		<div class="organize">
		<input type="hidden" name="b_no" id="b_no" value="${board.b_no}" />
		<input type="hidden" name="m_no" id="m_no" value="${member.m_no}" />
		<input type="hidden" name="m_id" id="m_id" value="${member.m_id}" />
		<h3>게시글 수정</h3>
			<ul class="textb">
				<li class="textb_title">
					<div>
						<span>제목</span>
						<input type="text" name="b_title" id="b_title" value="${board.b_title}" maxlength="70" size="70%" />
						<span id="titleCount" style="color:green;">50</span><span>/50</span>
					</div>
				</li>
				<li>
					<textarea name="b_content" id="b_content" cols="88" rows="80">${board.b_content}</textarea>
					<script>
						CKEDITOR.replace( 'b_content', {} );
					</script>
				</li>
				<li class="textb_bottom">
					<div class="textb_bottom_button">
						<input type="button" class="updateWrite" value="수정" onClick="updateB()" />
						<button class="updateList" onClick="history.go(-1)">취소</button>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- footer -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>