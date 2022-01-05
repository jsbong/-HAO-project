<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>Decorating's</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400,700,800&amp;subset=korean" rel="stylesheet">
	</head>
	<body>
		<%@ include file="include/menu.jsp"%>
		<section>
			<div class="contents">
				<article>
					<div class="banner">
						<script>
							$(document).ready(function() {
								// 사용할 배너
								var $banner = $(".banner").find("ul");
								// 배너 이미지의 폭
								var $bannerWidth = $banner.children().outerWidth();
								// 높이
								var $bannerHeight = $banner.children().outerHeight();
								// 배너 이미지의 갯수
								var $bannerLength = $banner.children().length;
								// 정해진 초마다 함수 실행
								var rollingId;
								// 다음 이미지로 롤링 애니메이션 할 시간차
								rollingId = setInterval(function() {
									rollingStart();
								}, 2000);
								// 마우스 오버시 롤링을 멈춘다.
								$banner.mouseover(function() {
									clearInterval(rollingId);
									$(this).css("cursor", "pointer");
								});
								// 마우스 아웃되면 다시 시작
								$banner.mouseout(function() {
									rollingId = setInterval(function() {
										rollingStart();
									}, 2000);
									
									$(this).css("cursor", "default");
								});
								
								function rollingStart() {
									$banner.css("width", $bannerWidth * $bannerLength + "px");
									$banner.css("height", $bannerHeight + "px");
									
									//배너의 좌측 위치를 옮겨 준다.
									//숫자는 롤링 진행되는 시간이다.
									$banner.animate({left : -$bannerWidth + "px"}, 1500, function() {
										//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
										$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
										//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
										$(this).find("li:first").remove();
										//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
										$(this).css("left", 0);
										//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
									});
								}
							});
						</script>
						<ul>
							<li><img src="resources/img/main1.jpg" width="1380px" height="550px"></li>
							<li><img src="resources/img/main2.jpg" width="1380px" height="550px"></li>
							<li><img src="resources/img/main3.jpg" width="1380px" height="550px"></li>
						</ul>
					</div>
				</article>
			</div>
			<h2 align="center" id="ca">거울</h2>
			<hr align="center" width="1400px">
			<img id="back" src="resources/img/slider/left.png">
			<div class="slide">
				<ul>
					<li>
						<img src="resources/img/slider/mirror/1.png">
						<img src="resources/img/slider/mirror/2.png">
						<img src="resources/img/slider/mirror/3.png">
						<img src="resources/img/slider/mirror/4.png">
						<img src="resources/img/slider/mirror/5.png">
					</li>
				</ul>
			</div>
		<img id="next" src="resources/img/slider/right.png">
		<script type="text/javascript">
			$(document).ready(function() {
				var imgs;
				var img_count;
				var img_position = 1;
				
				imgs = $(".slide ul");
				img_count = imgs.children().length;

				//버튼을 클릭했을 때 함수 실행
				$('#back').click(function() { back(); });
				$('#next').click(function() { next(); });
				
				function back() {
					if (1 < img_position) {
						imgs.animate({ left : '+=1000px' });
						img_position--;
					}
				}
				function next() {
					if (img_count > img_position) {
						imgs.animate({ left : '-=1000px' });
						img_position++;
					}
				}
			});
		</script>
		<h2 align="center" id="ca">식탁용 제품</h2>
		<hr align="center" width="1400px">
		<img id="back2" src="resources/img/slider/left.png">
		<div class="slide2">
			<ul>
				<li>
					<img src="resources/img/slider/table/1.png"> 
					<img src="resources/img/slider/table/2.png"> 
					<img src="resources/img/slider/table/3.png"> 
					<img src="resources/img/slider/table/4.png"> 
					<img src="resources/img/slider/table/5.png">
				</li>
				<li>
					<img src="resources/img/slider/table/6.png">
					<img src="resources/img/slider/table/7.png">
					<img src="resources/img/slider/table/8.png">
					<img src="resources/img/slider/table/9.png">
					<img src="resources/img/slider/table/10.png">
				</li>
			</ul>
		</div>
		<img id="next2" src="resources/img/slider/right.png">
		<script type="text/javascript">
			$(document).ready(function() {
				var imgs;
				var img_count;
				var img_position = 1;

				imgs = $(".slide2 ul");
				img_count = imgs.children().length;

				//버튼을 클릭했을 때 함수 실행
				$('#back2').click(function() { back(); });
				$('#next2').click(function() { next(); });

				function back() {
					if (1 < img_position) {
						imgs.animate({ left : '+=1000px' });
						img_position--;
					}
				}
				function next() {
					if (img_count > img_position) {
						imgs.animate({ left : '-=1000px' });
						img_position++;
					}
				}
			});
		</script>
		<h2 align="center" id="ca">장식품</h2>
		<hr align="center" width="1400px">
		<img id="back3" src="resources/img/slider/left.png">
		<div class="slide3">
			<ul>
				<li><img src="resources/img/slider/deco/6.png"> <img
					src="resources/img/slider/deco/7.png"> <img
					src="resources/img/slider/deco/8.png"> <img
					src="resources/img/slider/deco/9.png"> <img
					src="resources/img/slider/deco/10.png"></li>
				<li><img src="resources/img/slider/deco/6.png"> <img
					src="resources/img/slider/deco/7.png"> <img
					src="resources/img/slider/deco/8.png"> <img
					src="resources/img/slider/deco/9.png"> <img
					src="resources/img/slider/deco/10.png"></li>
			</ul>

		</div>
		<img id="next3" src="resources/img/slider/right.png">
		<script type="text/javascript">
			$(document).ready(function() {
				var imgs;
				var img_count;
				var img_position = 1;

				imgs = $(".slide3 ul");
				img_count = imgs.children().length;

				//버튼을 클릭했을 때 함수 실행
				$('#back3').click(function() { back(); });
				$('#next3').click(function() { next(); });

				function back() {
					if (1 < img_position) {
						imgs.animate({ left : '+=1000px' });
						img_position--;
					}
				}
				function next() {
					if (img_count > img_position) {
						imgs.animate({ left : '-=1000px' });
						img_position++;
					}
				}
			});
		</script>
		<h2 align="center" id="ca">조명</h2>
		<hr align="center" width="1400px">
		<img id="back4" src="resources/img/slider/left.png">
		<div class="slide4">

			<ul>
				<li><img src="resources/img/slider/lamp/1.png"> <img
					src="resources/img/slider/lamp/2.png"> <img
					src="resources/img/slider/lamp/3.png"> <img
					src="resources/img/slider/lamp/4.png"> <img
					src="resources/img/slider/lamp/5.png"></li>
				<li><img src="resources/img/slider/lamp/1.png"> <img
					src="resources/img/slider/lamp/2.png"> <img
					src="resources/img/slider/lamp/3.png"> <img
					src="resources/img/slider/lamp/4.png"> <img
					src="resources/img/slider/lamp/5.png"></li>
			</ul>

		</div>
		<img id="next4" src="resources/img/slider/right.png">
		<script type="text/javascript">
			$(document).ready(function() {
				var imgs;
				var img_count;
				var img_position = 1;

				imgs = $(".slide4 ul");
				img_count = imgs.children().length;

				//버튼을 클릭했을 때 함수 실행
				$('#back4').click(function() { back(); });
				$('#next4').click(function() { next(); });

				function back() {
					if (1 < img_position) {
						imgs.animate({ left : '+=1000px' });
						img_position--;
					}
				}
				function next() {
					if (img_count > img_position) {
						imgs.animate({ left : '-=1000px' });
						img_position++;
					}
				}
			});
		</script>
		<h2 align="center" id="ca">천</h2>
		<hr align="center" width="1400px">
		<img id="back5" src="resources/img/slider/left.png">
		<div class="slide5">

			<ul>
				<li><img src="resources/img/slider/fabric/1.png"> <img
					src="resources/img/slider/fabric/2.png"> <img
					src="resources/img/slider/fabric/3.png"> <img
					src="resources/img/slider/fabric/4.png"> <img
					src="resources/img/slider/fabric/5.png"></li>
				<li><img src="resources/img/slider/fabric/6.png"> <img
					src="resources/img/slider/fabric/7.png"> <img
					src="resources/img/slider/fabric/8.png"> <img
					src="resources/img/slider/fabric/9.png"> <img
					src="resources/img/slider/fabric/10.png"></li>
			</ul>

		</div>
		<img id="next5" src="resources/img/slider/right.png">
		<script type="text/javascript">
			$(document).ready(function() {
				var imgs;
				var img_count;
				var img_position = 1;

				imgs = $(".slide5 ul");
				img_count = imgs.children().length;

				//버튼을 클릭했을 때 함수 실행
				$('#back5').click(function() { back(); });
				$('#next5').click(function() { next(); });

				function back() {
					if (1 < img_position) {
						imgs.animate({ left : '+=1000px' });
						img_position--;
					}
				}
				function next() {
					if (img_count > img_position) {
						imgs.animate({ left : '-=1000px' });
						img_position++;
					}
				}
			});
			</script>
		</section>
		<%@ include file="include/csinfo.jsp"%>
	</body>
</html>