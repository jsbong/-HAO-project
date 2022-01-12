<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="resources/css/view.css?">
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
			    swal('수정 완료!','게시글 수정을 완료했습니다.^^','success').then(function(isConfirm)
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
<script src="resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/menu.jsp" %>
<title>${board.b_title}</title>
</head>
<body>
<center>
	<div style="width:800px;">
		<div style="float:right;">
		</div>
		<br/><br/>

	<form>
		<input type="hidden" name="b_no" id="b_no" value="${board.b_no}"/>
		<table border="1" bordercolor="#E1DCDC" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70">제목</td>
			<td align="left">
			<input type="text" name="b_title" id="b_title" size="70%" maxlength="100" 
			value="${board.b_title}" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td>작성자</td>
			<td align="left">${board.m_id}</td>
			</tr>
				
			<tr>
			<td>작성일</td>
			<td align="left">${board.b_regdate}</td>
			</tr>
				
			<tr>
			<td>조회수</td>
			<td align="left">${board.b_viewcnt}</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="b_content" id="b_content" cols="88" rows="80">${board.b_content}</textarea>
		<script>
   		 	CKEDITOR.replace( 'b_content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input id="list_btn" type="button" value="저장" onclick="updateB()" />
	</form>
		<button id="list_btn" style="float:right;" onclick="location.href='board'">목록</button>
	</div>
</center>
<%@ include file="../include/csinfo.jsp" %>
</body>
</html>