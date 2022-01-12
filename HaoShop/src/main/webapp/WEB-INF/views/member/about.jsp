<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/about.css">
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp" %>
    <!-- section.club_banner -->
    <section class="club_banner">
		<div class="inner">
			<h3 class="en">About Us</h3>
			<a href="#" class="more">View more</a>
		</div>
	</section>
		<div class="wrap">
			<span class="bar"></span>
			<ul class="list">
				<li>
					<div class="text">
						<h1>CONTACT</h1>
						<p>(주)HAOSHOP : 532-87-01598 101-1</P>
						<P>Yeonmujang-gil, Seongdong-gu, Seoul License Number : 2020-서울성동-03012</p>
					</div>
					<div class="img">
						<img src="resources/img/about/about01.jpg" alt="">
					</div>
				</li>
				<li class="left">
					<div class="text">
						<h1>C/S CENTER</h1>
						<P>문의 : 02-745-7401</P>
						<p>점심시간 12:30-13:30</p>
						<p><a href="#">1:1문의</a></p>
						<p><a href="#">교환 및 환불 안내</a></p>
						<P><a href="#">카카오톡 채팅상담</a></p>
						<p><a href="#">고객센터</a></p>
					</div> 
					<div class="img">
						<img src="resources/img/about/about02.jpg" alt="">
					</div>
				</li>
				<li>
					<div class="text">
						<h1>BANK ACCOUNT</h1>
						<p>(주) HAOSHOP</P>
						<P>국민 590402 05 021487</P><p>신한 150 894 65874123</p><P>우리 4581 656 65842</P>
					</div>
					<div class="img">
						<img src="resources/img/about/about03.jpg" alt="">
					</div>
				</li>
			</ul>
		</div>

		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
		<script>
	      $( document ).ready( function() {
	        $( window ).scroll( function() {
	          if ( $( this ).scrollTop() > 200 ) {
	            $( '.top' ).fadeIn();
	          } else {
	            $( '.top' ).fadeOut();
	          }
	        } );
	        $( '.top' ).click( function() {
	          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	          return false;
	        } );
	      } );
		</script>
    
</body>
</html>