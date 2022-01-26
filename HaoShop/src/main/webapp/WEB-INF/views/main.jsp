<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HAOSHOP</title>
    <link rel="stylesheet" href="resources/css/main/main.css">
    <link rel="stylesheet" href="resources/css/main/catebanner.css">
    <link rel="stylesheet" href="resources/css/main/collectionsection.css">
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
                        $(this).animate({'opacity':'1','margin-left':'6.5%'},1000);
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
            <a href="about">About us</a>
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
                        <a href="category?cate_no=100000"><img src="resources/img/product/100001/collarless cardigan-black-04.jpg" alt=""></a>
                    </p>
                    <h3>OUTER</h3>
                    <a href="category?cate_no=100000">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=100001">
                            <img src="resources/img/product/100001/contrast panel leather jacket-black-04.jpg" alt="">
                        </a>
                    </p>
                        <h3>JACKET</h3>
                        <a href="category?cate_no=100001">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=100002">
                            <img src="resources/img/product/100002/airforce mouton coat-black-04.jpg" alt="">
                        </a>
                    </p>
                        <h3>COAT</h3>
                        <a href="category?cate_no=100002">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=100003">
                            <img src="resources/img/product/100003/ferndail down parka-black-04.jpg" alt="">
                        </a>
                    </p>
                        <h3>DOWN JACKET</h3>
                        <a href="category?cate_no=100003">View more</a>
                </li>
            </ul>
        </div>
        <div id="tab-2" class="tab-content">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="category?cate_no=200001"><img src="resources/img/product/200001/dw long sleeves-grey-4.jpg" alt=""></a>
                    </p>
                    <h3>SWEAT</h3>
                    <a href="category?cate_no=200001">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=200002">
                            <img src="resources/img/product/200002/oversized crewneck knit-oatmeal melange-4.jpg" alt="">
                        </a>
                    </p>
                        <h3>KNITWEAT</h3>
                        <a href="category?cate_no=200002">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=200003">
                            <img src="resources/img/product/200003/oversized shirt-beige (4).jpg" alt="">
                        </a>
                    </p>
                        <h3>SHIRT</h3>
                        <a href="category?cate_no=200003">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=200004">
                            <img src="resources/img/product/200004/cba vest-black nylon washer (3).jpg" alt="">
                        </a>
                    </p>
                        <h3>VEST</h3>
                        <a href="category?cate_no=200004">View more</a>
                </li>
            </ul>
        </div>
        <div id="tab-3" class="tab-content">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="category?cate_no=300000">
                        	<img src="resources/img/product/300001/one tuck wide denim  indigo (4).jpg" alt="">
                        </a>
                    </p>
                    <h3>BOTTOM</h3>
                    <a href="category?cate_no=300000">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=300001">
                            <img src="resources/img/product/300001/cargo pants  charcoal (4).jpg" alt="">
                        </a>
                    </p>
                        <h3>TROUSER</h3>
                        <a href="category?cate_no=300001">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=300002">
                            <img src="resources/img/product/300002/dw shorts  black (4).jpg" alt="">
                        </a>
                    </p>
                        <h3>SHORT</h3>
                        <a href="category?cate_no=300002">View more</a>
                </li>
            </ul>
        </div>
        <div id="tab-4" class="tab-content">
            <ul class="shop_cate-detail">
                <li>
                    <p class="img">
                        <a href="category?cate_no=400000">
                        	<img src="resources/img/product/400001/original 2039-black (4).jpg" alt="">
                        </a>
                    </p>
                    <h3>ETC</h3>
                    <a href="category?cate_no=400000">View more</a>
                </li>
                <li>
                    <p class="img">
                        <a href="category?cate_no=400001">
                            <img src="resources/img/product/400001/chambord-lisse noir (1).jpg" alt="">
                        </a>
                    </p>
                        <h3>SHOES</h3>
                        <a href="category?cate_no=400001">View more</a>
                </li>
            </ul>
        </div>
    </section>
    
    <!-- collection section -->
    <section class="collection">
        <div class="collection_inner hideme">
            <div class="textBox">
                <h3 class="title_s">JOURNAL</h3>
                <p>BY HOW ABOUT OOTD</p>
                <a href="journalList" class="title_btn">View more</a>
                <ul class="collection_list">
                    <li>
                        <a href="journalList"><img src="resources/img/collection/COAT STYLING (1).jpg" alt=""></a>
                    </li>
                    <li>
                        <a href="journalList"><img src="resources/img/collection/COAT STYLING (6).jpg" alt=""></a>
                    </li>
                    <li>
                        <a href="journalList"><img src="resources/img/collection/COAT STYLING (7).jpg" alt=""></a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    
    <!-- footer -->
    <%@ include file="include/footer.jsp" %>
</body>
</html>