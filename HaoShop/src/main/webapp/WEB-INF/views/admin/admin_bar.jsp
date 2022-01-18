<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin_bar</title>
    <link rel="stylesheet" href="resources/css/admin_bar.css">
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
            <li data-tab="#"><a href="#">ADMIN PAGE</a></li>
            <li data-tab="collection"><a href="collection">COLLECTION</a></li>
            <li class="product_list">PRODUCT <span>&#10094;</span>
            <li class="sub" data-tab="prdinsert"><a href="prdinsert">&#187; PRODUCT REGISTER</a></li>
            <li class="sub" data-tab="productList"><a href="productList">&#187; PRODUCT LIST</a></li>
            <li data-tab="member">MEMBER</li>
            <li data-tab="deliver">DELIVER</li>
          	<li data-tab="main">MAIN PAGE</li>
        </ul>
    </nav>

</body>
</html>