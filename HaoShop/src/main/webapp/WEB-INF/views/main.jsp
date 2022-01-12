<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>HAOSHOP</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<script>
	       $(document).ready(function() {
	           $(".slide").not(".active").hide(); // 화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	           setInterval(nextSlide, 4000); // 4초(4000)마다 다음 슬라이드로 넘어감
	       })
	
	       // 다음 슬라이드로 넘어가는 메소드(무한반복)
	       function nextSlide() {
	           $(".slide").hide();
	           var allSide = $(".slide");
	           var currentIndex = 0;
	
	           $(".slide").each(function(index, item) { // index .slide 순서
	               if($(this).hasClass("active")) {
	                   currentIndex = index; // currnetIndex는 다음 .slide 인덱스 번호를 가짐
	               }
	           });
	           var nexIndex = 0;
	
	           if(currentIndex >= allSide.length-1) { // 현재 인덱스가 allSide 개수 -1 보다 같거나 커지면
	               nexIndex = 0; // 처음 인덱스로 돌아감
	           } else {
	               // 현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
	               nexIndex = currentIndex+1;
	           }
	
	           $(".menu:after").css("width", "0%");
	           $(".slide").removeClass("active");
	           $(".slide").eq(nexIndex).addClass("active");
	           $(".slide").eq(nexIndex).show();
	       }
		</script>
	</head>
	<body>
		<!-- header -->
		<%@ include file="include/header.jsp"%>
		<!-- main banner -->
		<section class="visual">
        <!-- 슬라이드 -->
        	<div class="slide fade active">
            	<img src="resources/img/visual_01.jpg" alt="">
            	<div class="mainText">
                	<strong>HAO SHOP</strong>
                	<div class="num">
                    	0 <span>1</span>
                	</div>
            	</div>
        	</div>
        	<div class="slide fade">
            	<img src="resources/img/visual_02.jpg" alt="">
	            <div class="mainText">
    	            <strong>HAO SHOP</strong>
        	        <div class="num">
            	        0 <span>2</span>
                	</div>
        	    </div>
        	</div>
        	<div class="slide fade">
            	<img src="resources/img/visual_03.jpg" alt="">
            	<div class="mainText">
                	<strong>HAO SHOP</strong>
                	<div class="num">
                    	0 <span>3</span>
                	</div>
            	</div>
        	</div>
        	<div class="slide fade">
            	<img src="resources/img/visual_04.jpg" alt="">
            	<div class="mainText">
                	<strong>HAO SHOP</strong>
	                <div class="num">
    	                0 <span>4</span>
        	        </div>
	            </div>
        	</div>
    	    <div class="slide fade">
            	<img src="resources/img/visual_05.jpg" alt="">
            	<div class="mainText">
                	<strong>HAO SHOP</strong>
                	<div class="num">
                    	0 <span>5</span>
                	</div>
            	</div>
        	</div>
        	<div class="menu"> <!-- 고정된 슬라이드 -->
            	    <a href="about.jsp">View more</a>
        	</div>
    	</section>
		
		<!-- footer -->
		<%@ include file="include/footer.jsp"%>
	</body>
</html>
