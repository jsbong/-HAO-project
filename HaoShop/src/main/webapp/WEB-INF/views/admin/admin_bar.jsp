<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin_bar</title>
    <link rel="stylesheet" href="resources/css/admin/admin_bar.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		$(".product_list").click(function(){
			if($(".sub").is(":visible")){
				$(".sub").css('display', 'none');
			} else{
				$(".sub").css('display','block');
			}
		});
		
		$(".category_admin li").not(".product_list").click(function() {
			var gotocate = $(this).attr("data-tab");
			location.href = gotocate;
		});
		
		$(".category_admin li.product_list").click(function() {
			if((".category_admin li.sub").css("display") == "none") {
				$(this).find("span").css("transform", "rotate(-90deg)");
			} else {
				$(this).find("span").css("transform", "none");
			}
		})
	});
	</script>
</head>
<body>
    <nav class="admin_bar">
        <ul class="category_admin">
            <li data-tab="adminpage"><a href="adminpage">관리자 페이지</a></li>
            <li data-tab="journal"><a href="journal">저널 등록</a></li>
            <li class="product_list">상품 페이지<span>&#10094;</span>
            <li class="sub" data-tab="prdinsert"><a href="prdinsert">&#187; 상품 등록</a></li>
            <li class="sub" data-tab="productList"><a href="productList">&#187; 상품 리스트</a></li>
            <li data-tab="memberList">회원 목록</li>
            <li data-tab="deliver">배송 현황</li>
          	<li data-tab="main">메인 이동</li>
        </ul>
    </nav>

</body>
</html>