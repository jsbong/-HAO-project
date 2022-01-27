<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <script src="resources/js/login.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="resources/css/include/header.css">
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
                <li><a href="searchPrd?sPrd=">ALL</a></li>
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
                                <a href="productpage?p_no=148">
                                <img src="resources/img/product/100001/trucker jacket-cloudy mint-01.jpg">
                                <div>
                                    <span style="font-weight:bold">trucker jacket</span><br>
                                    <span>cloudy mint</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=169">
                                <img src="resources/img/product/100002/airforce mouton coat-black-01.jpg">
                                <div>
                                    <span style="font-weight:bold">airforce mouton coat</span><br>
                                    <span>black</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=158">
                                    <img src="resources/img/product/100002/extream parka-black-01.jpg">
                                    <div>
                                        <span style="font-weight:bold">extream parka</span><br>
                                        <span>black</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=179">
                                    <img src="resources/img/product/100003/arctic puffer down-beige-01.jpg">
                                    <div>
                                        <span style="font-weight:bold">arctic puffer down</span><br>
                                        <span>beige</span>
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
                                <a href="productpage?p_no=252">
                                <img src="resources/img/product/200001/symbol embroidery sweatshirt-lime-01.jpg">
                                <div>
                                    <span style="font-weight:bold">symbol embroidery sweatshirt</span><br>
                                    <span>lime</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=343">
                                <img src="resources/img/product/200002/square neck knit-navy-1.jpg">
                                <div>
                                    <span style="font-weight:bold">square neck knit</span><br>
                                    <span>navy</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=360">
                                    <img src="resources/img/product/200003/daddy shirt-dust navy (1).jpg">
                                    <div>
                                        <span style="font-weight:bold">daddy shirt</span><br>
                                        <span>navy</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=383">
                                    <img src="resources/img/product/200003/m-65 shirt jacket-beige glen check (1).jpg">
                                    <div>
                                        <span style="font-weight:bold">m-65 shirt jacket</span><br>
                                        <span>beige glen check</span>
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
                                <a href="productpage?p_no=122">
                                <img src="resources/img/product/300001/utility easy pants  beige gunclub check (2).jpg">
                                <div>
                                    <span style="font-weight:bold">utility easy pants</span><br>
                                    <span>beige gunclub check</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=120">
                                <img src="resources/img/product/300001/one tuck wide denim  indigo (2).jpg">
                                <div>
                                    <span style="font-weight:bold">one tuck wide denim</span><br>
                                    <span>indigo</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=116">
                                    <img src="resources/img/product/300001/functional pants  dark beige (2).jpg">
                                    <div>
                                        <span style="font-weight:bold">functional pants</span><br>
                                        <span>dark beige</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=206">
                                    <img src="resources/img/product/300002/gear shorts  black (3).jpg">
                                    <div>
                                        <span style="font-weight:bold">gear shorts</span><br>
                                        <span>black</span>
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
                                <a href="productpage?p_no=401">
                                <img src="resources/img/product/400001/monkey low cut-black (1).jpg">
                                <div>
                                    <span style="font-weight:bold">monkey low cut</span><br>
                                    <span>black</span>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=396">
                                <img src="resources/img/product/400001/michael tout poils -poils vache (1).jpg">
                                <div>
                                    <span style="font-weight:bold">michael tout poils</span><br>
                                    <span>poils vache</span>
                                </div>
                                </a>
                            </li>
							<li>
                                <a href="productpage?p_no=398">
                                    <img src="resources/img/product/400001/michael(ligne bbr) -lisse noir (1).jpg">
                                    <div>
                                        <span style="font-weight:bold">michael(ligne bbr)</span><br>
                                        <span>lisse noir</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="productpage?p_no=399">
                                    <img src="resources/img/product/400001/chambord-lisse noir (1).jpg">
                                    <div>
                                        <span style="font-weight:bold">chambord</span><br>
                                        <span>lisse noir</span>
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
                		<li><a href="adminpage">ADMINPAGE</a></li>
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
 					<li><a href="board">BOARD</a></li>
   					<li><a href="journalList">JOURNAL</a>
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