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
            $(this).find("div").slideDown("fast");
            $(this).parent().parent().css("background", "#fff");
        }).mouseleave(function() {
            $(this).parent().parent().css("background", "none");
            $(this).find("div:visible").slideUp("fast");
        });
    });
    
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
                    <a href="#">OUTER</a>
                    <div>
                        <ul>
                            <li><a href="category?cate_no=100001">JACKT</a></li>
                            <li><a href="category?cate_no=100002">COAT</a></li>
                            <li><a href="category?cate_no=100003">DOWN JACKET</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">TOP</a>
                    <div>
                        <ul>
                            <li><a href="category?cate_no=200001">SWEAT</a></li>
                            <li><a href="category?cate_no=200002">KNITWEAT</a></li>
                            <li><a href="category?cate_no=200003">SHIRT</a></li>
                            <li><a href="category?cate_no=200004">VEST</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">BOTTOM</a>
                    <div>
                        <ul>
                            <li><a href="category?cate_no=300001">TROUSER</a></li>
                            <li><a href="category?cate_no=300002">SHORT</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">ETC</a>
                    <div>
                        <ul>
                            <li><a href="category?cate_no=400001">SHOES</a></li>
                            <li><a href="category?cate_no=400002">LIFEGOODS</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            <ul class="menu_right">
                <!-- <li>SEARCH</li> -->
	                
                <c:choose>
                	<c:when test="${member.m_id == null}">
                		<li><a href="signup">JOIN</a></li>
                		<li><a href="login">LOGIN</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="mypage?m_no=${member.m_no}">MYPAGE</a></li>
                		<li><a href="logout">LOGOUT</a></li>
                		<input type="hidden" id="m_id" name="m_id" value="${member.m_id}" />
						<input type="hidden" id="m_no" name="m_no" value="${member.m_no}" />
	                	<li><a href="#" onclick="productCart();">CART</a></li>
   					</c:otherwise>
   				</c:choose>
   					<li><a href="#">FORUM</a></li>
   					<div id="search" align="center">
				         <input type="text" name="sPrd" id="sPrd" placeholder="검색어 입력" onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
				         <button type="button" id="searchBtn" onclick="searchPrd()" style="cursor: pointer">
				            <strong>SEARCH</strong>
				         </button>
	   				</div>
            </ul>
		      <script>
		         function searchPrd() {
		            var sea = $("#sPrd").val();
		            self.location = "searchPrd?sPrd=" + sea;
		         }
		      </script>
        </nav>
        </form>
</body>
</html>