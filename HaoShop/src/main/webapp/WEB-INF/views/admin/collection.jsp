<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>collection</title>
	<link rel="stylesheet" href="resources/css/collection.css">
	<link rel="stylesheet" href="resources/css/admin_bar.css">
    <script src="resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- navigation -->
	<%@ include file="../admin/admin_bar.jsp" %>
	
	<!-- collection section -->
	<section class="coll_section">
		<div class="coll_content">
			<h2 align="center">COLLECTION REGISTRATION</h2>
			<form name="form1" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>컬렉션명</td>
						<td><input type="text" name="coll_name" id="coll_name"></td>
					</tr>
					<tr>
						<td>메인이미지</td>
						<td><input type="file" name="file1" id="file1">
					</tr>
					<tr>
						<td>컬렉션설명</td>
						<td><textarea rows="15" cols="100" name="coll_explain"></textarea>
							<script>
								// CKEDITER 적용시키기
								CKEDITOR.replace("coll_explain", {
									filebrowerUploadUrl : "/imageUpload.do"
								});
							</script>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
</body>
</html>

