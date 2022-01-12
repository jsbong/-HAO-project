<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <link rel="stylesheet" href="resources/css/header.css">
    <script src="resources/js/login.js" charset="UTF-8"></script>
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
                <li>SEARCH</li>
                <input type="hidden" id="myp" value="${myp}" />
                <c:choose>
                	<c:when test="${member.m_id == null}">
                		<li><a href="signup">JOIN</a></li>
                		<li><a href="login">LOGIN</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="mypage?m_no=${member.m_no}">MYPAGE</a></li>
                		<li><a href="logout">LOGOUT</a></li>
                	</c:otherwise>
                </c:choose>
                <!-- <a href="javascript:void(0); onclick="함수명(this)">꾸울팁</a> -->
                <li><a href="productCart?m_no=${member.m_no}">CART</a></li>
                <li><a href="#">FORUM</a></li>
            </ul>
        </nav>
</body>
</html>