<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <script src="resources/js/login.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="resources/css/header.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(function() {
            $("ul.menu_left li").mouseenter(function() {
                $(this).parent().parent().css("background", "#fff");
                $(this).find("div.menu_sub-content").show();
            }).mouseleave(function() {
                $(this).parent().parent().css("background", "none");
                $(".menu_sub-content").css("background","#fff");
                $(this).find("div.menu_sub-content").hide();
            });
        });


        function showSeacrh() {
            document.getElementById("search").style.display = "block";
        }

        function hideSearch() {
            document.getElementById("search").style.display = 'none';
        }
    </script>
</head>
<body>
	<form name="frm" id="frm">
        <header>
            <a href="main" class="logo">HOW ABOUT OOTD</a>
        </header>
        <nav>
            <ul class="menu_left">
                <li><a href="about">HAO</a></li>
                <li><a href="#">ALL</a></li>
                <li>
                    <a href="category?cate_no=100000">OUTER</a>
                    <div class="menu_sub-content">
                        <ul class="sub_cate">
                            <li><a href="category?cate_no=100001">JACKET</a></li>
                            <li><a href="category?cate_no=100002">COAT</a></li>
                            <li><a href="category?cate_no=100003">DOWN JACKET</a></li>
                        </ul>
                                               <ul class="sub_img">
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="category?cate_no=200000">TOP</a>
                    <div class="menu_sub-content">
                        <ul class="sub_cate">
                            <li><a href="category?cate_no=200001">SWEAT</a></li>
                            <li><a href="category?cate_no=200002">KNITWEAT</a></li>
                            <li><a href="category?cate_no=200003">SHIRT</a></li>
                            <li><a href="category?cate_no=200004">VEST</a></li>
                        </ul>
                                               <ul class="sub_img">
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="category?cate_no=300000">BOTTOM</a>
                    <div class="menu_sub-content">
                        <ul class="sub_cate">
                            <li><a href="category?cate_no=300001">TROUSER</a></li>
                            <li><a href="category?cate_no=300002">SHORT</a></li>
                        </ul>
                                               <ul class="sub_img">
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="category?cate_no=400000">ETC</a>
                    <div class="menu_sub-content">
                        <ul class="sub_cate">
                            <li><a href="category?cate_no=400001">SHOES</a></li>
                            <li><a href="category?cate_no=400002">LIFEGOODS</a></li>
                        </ul>
                                               <ul class="sub_img">
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                <img src="resources/img/visual_01.jpg">
                                <div>
                                    <span sytle="font-weight:bold">제품명입니다.</span><br>
                                    <span>컬러</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="resources/img/visual_01.jpg">
                                    <div>
                                        <span sytle="font-weight:bold">제품명입니다.</span><br>
                                        <span>컬러</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <ul class="menu_right">
               <li onclick="showSeacrh();" style="cursor:pointer">SEARCH
                    <div id="search">
                        <input type="text" name="sPrd" id="sPrd" placeholder="search" onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
                        <a href="javascript:hideSearch();">close</a>
                    </div>
                </li>
                    <div id="search" style="display:none">
				         <input type="text" name="sPrd" id="sPrd">
	   				</div>
	                
                <c:choose>
                	<c:when test="${member.m_id == null}">
                		<li><a href="signup">JOIN</a></li>
                		<li><a href="login">LOGIN</a></li>
                	</c:when>
                	<c:when test="${member.m_id eq 'Administrator'}">
                		<li><a href="mypage?m_no=${member.m_no}">MYPAGE</a></li>
                		<li><a href="prdinsert">상품등록</a></li>
                		<li><a href="deliver">주문 내역</a></li>
                		<li><a href="logout">LOGOUT</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="mypage?m_no=${member.m_no}">MYPAGE</a></li>
                		<li><a href="logout">LOGOUT</a></li>
                		<input type="hidden" id="m_id" name="m_id" value="${member.m_id}" />
						<input type="hidden" id="m_no" name="m_no" value="${member.m_no}" />
	                	<li><a href="#" onclick="productCart();">CART</a></li>
   					</c:otherwise>
   				</c:choose>
   					<li><a href="board">FORUM</a></li>
   					<li><a href="journalList">JOURNAL</a>
   					<!-- <div id="search" align="center">
				         <input type="text" name="sPrd" id="sPrd" placeholder="검색어 입력" onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
				         <button type="button" id="searchBtn" onclick="searchPrd()" style="cursor: pointer">
				            <strong>SEARCH</strong>
				         </button>
	   				</div> -->
            </ul>
		      <script>
		         function searchPrd() {
		            var sea = $("#sPrd").val();
		            if(window.event.keyCode == 13) {
		            	self.location = "searchPrd?sPrd=" + sea;	
		            }
		         }
		      </script>
        </nav>
        </form>
</body>
</html>