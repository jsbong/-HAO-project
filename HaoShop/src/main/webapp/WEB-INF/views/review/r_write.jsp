<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="resources/css/board.css?cv">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function createR() {
	var m_no=$("#m_no").val();
	var p_name=$("#p_name").val();
	var m_id=$("#m_id").val();
	var r_title=$("#r_title").val();
	var r_content=CKEDITOR.instances.r_content.getData();
	var titleLength=r_title.length;
	
	if(!r_title) {
		swal("", "제목을 입력하세요.", "error");
	} else if(titleLength>50) {
		swal("", "제목이 너무 깁니다.", "error");
	} else if(r_content==""){ 
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
			    swal('등록 완료!','게시글 등록을 완료했습니다.^^','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "createReview",
							data : {
								"m_no" : m_no,
								"p_name" : p_name,
								"m_id" : m_id,
								"r_title" : r_title,
								"r_content" : r_content
						}, success : function(data) {
							location.href='review';
						}
						});
			    	});
			  }
			})
	}
}

// 키보드로 글자수 입력 받았을 때 글자카운트 스크립트
$(document).ready(function(){

	$('#r_title').keyup(function(){
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
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/menu.jsp" %>
<title>${review.r_title}</title>
</head>
<body>
<center>
	<div style="width:800px;">

		<br/><br/>
	<form>
		<input type="hidden" name="m_no" id="m_no" value="${member.m_no}" />
		<input type="hidden" name="p_name" id="p_name" value="${product.p_name}"/>
		<input type="hidden" name="m_id" id="m_id" value="${member.m_id}" />
		<table class="textb" width="100%">
			<tr>
			<td class="asd" width="60">제목</td>
			<td  class="asd" align="left">
			<input type="text" name="r_title" id="r_title" maxlength="70" size="70%" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="r_content" id="r_content" cols="88" rows="80"></textarea>
		<script>
			CKEDITOR.replace( 'r_content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input type="button" class="r_write" value="작성하기" onClick="createR()" />
	</form>
	
		<button style="float:right;" class="listp"onClick="location.href='review'">목록</button>
	</div>
</center>
<%@ include file="../include/csinfo.jsp" %>
</body>
</html>