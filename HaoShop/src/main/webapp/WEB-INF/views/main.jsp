<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HAOSHOP</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/catebanner.css">
    <link rel="stylesheet" href="resources/css/collectionsection.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".slide").not(".active").hide(); // 화면 로딩 후 첫번째 div를 제외한 나머지 숨김

            setInterval(nextSlide, 4500); // 4초(4000)마다 다음 슬라이드로 넘어감
            
            $("ul.shop_tabs li").click(function() {
                var tab_id = $(this).attr("data-tab");

                $("ul.shop_tabs li").removeClass("current");
                $(".tab-content").removeClass("current");

                $(this).addClass("current");
                $("#"+tab_id).addClass("current");
            });
            
            $(window).scroll( function(){
                $('.fadeinleft').each( function(i){
                    
                    var bottom_of_element = $(this).offset().top + $(this).outerHeight();
                    var bottom_of_window = $(window).scrollTop() + $(window).height();
                    
                    if( bottom_of_window > bottom_of_element/2){
                        $(this).animate({'opacity':'1','margin-left':'6.5%'},1500);
                    }
                    
                }); 
            });
            
            
            /* fadeIn 애니메이션 */
            $(window).scroll( function(){

                $('.hideme').each( function(i){
                    var bottom_of_object = $(this).offset().top + $(this).outerHeight();
                    var bottom_of_window = $(window).scrollTop() + $(window).height();
                    
                    if(bottom_of_window > bottom_of_object/1.5){
                        $(this).animate({'opacity':'1'}, 1500);
                    }
                }); 
            });
        });
        
        // 다음 슬라이드로 넘어가는 메소드(무한반복)
        function nextSlide() {
            $(".slide").hide();
            var allSide = $(".slide"); // $(".slide")을 배열로 리턴
            var currentIndex = 0;

            $(".slide").each(function(index, item) { // index .slide 순서, 
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
	<%@ include file="include/header.jsp" %>
    <section class="visual">
        <!-- 슬라이드 -->
        <div class="slide active">
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
            <a href="hao.jsp">About us</a>
        </div>
    </section>
    
   <!-- 카테고리 섹션 -->
    <section class="shop_cate-content fadeinleft">
        <h2>SHOP</h2>
        <ul class="shop_tabs">
            <li class="shop_tab-link current" data-tab="tab-1">OUTER</li>
            <li class="shop_tab-link" data-tab="tab-2">TOP</li>
            <li class="shop_tab-link" data-tab="tab-3">BOTTOM</li>
            <li class="shop_tab-link" data-tab="tab-4">ETC</li>
        </ul>
        <div id="tab-1" class="tab-content current">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="#"><img src="resources/img/visual_01.jpg" alt=""></a>
                    </p>
                    <h3>JACKET</h3>
                    <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_02.jpg" alt="">
                        </a>
                    </p>
                        <h3>COAT</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_03.jpg" alt="">
                        </a>
                    </p>
                        <h3>DOWN JACKET</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_04.jpg" alt="">
                        </a>
                    </p>
                        <h3>SHIRTS</h3>
                        <a href="#">View more</a>
                </li>
            </ul>
        </div>
        <div id="tab-2" class="tab-content">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="#"><img src="resources/img/visual_03.jpg" alt=""></a>
                    </p>
                    <h3>JACKET</h3>
                    <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_04.jpg" alt="">
                        </a>
                    </p>
                        <h3>COAT</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_01.jpg" alt="">
                        </a>
                    </p>
                        <h3>DOWN JACKET</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_02.jpg" alt="">
                        </a>
                    </p>
                        <h3>SHIRTS</h3>
                        <a href="#">View more</a>
                </li>
            </ul>
        </div>
        <div id="tab-3" class="tab-content">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="#"><img src="resources/img/visual_04.jpg" alt=""></a>
                    </p>
                    <h3>JACKET</h3>
                    <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_01.jpg" alt="">
                        </a>
                    </p>
                        <h3>COAT</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_02.jpg" alt="">
                        </a>
                    </p>
                        <h3>DOWN JACKET</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_03.jpg" alt="">
                        </a>
                    </p>
                        <h3>SHIRTS</h3>
                        <a href="#">View more</a>
                </li>
            </ul>
        </div>
        <div id="tab-4" class="tab-content">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="#"><img src="resources/img/visual_04.jpg" alt=""></a>
                    </p>
                    <h3>JACKET</h3>
                    <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_03.jpg" alt="">
                        </a>
                    </p>
                        <h3>COAT</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_02.jpg" alt="">
                        </a>
                    </p>
                        <h3>DOWN JACKET</h3>
                        <a href="#">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="#">
                            <img src="resources/img/visual_01.jpg" alt="">
                        </a>
                    </p>
                        <h3>SHIRTS</h3>
                        <a href="#">View more</a>
                </li>
            </ul>
        </div>
    </section>
    
        <!-- collection section -->
    <section class="collection">
        <div class="collection_inner hideme">
            <div class="textBox">
                <h3 class="title_s">COLLECTION</h3>
                <p>21FW HAO SHOP</p>
                <a href="#" class="title_btn">View more</a>
                <ul class="collection_list">
                    <li>
                        <a href="#"><img src="resources/img/visual_01.jpg" alt=""></a>
                    </li>
                    <li>
                        <a href="#"><img src="resources/img/visual_02.jpg" alt=""></a>
                    </li>
                    <li>
                        <a href="#"><img src="resources/img/visual_03.jpg" alt=""></a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    
    <!-- footer -->
    <%@ include file="include/footer.jsp" %>
</body>
</html>