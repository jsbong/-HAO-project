<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin_bar</title>
    <link rel="stylesheet" href="css/admin_bar.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
    <nav class="admin_bar">
        <ul class="category_admin">
            <a href="#"><li>ADMIN PAGE</li></a>
            <a href="collection"><li>COLLECTION</li></a>
            <li class="product_list">
                PRODUCT <span><</span>
                <ul>
                    <a href="prdinsert"><li class="sub">PRODUCT REGISTER</li></a>
                    <a href="productList"><li class="sub">PRODUCT LIST</li></a>
                </ul>
            </li>
            <a href="member"><li>MEMBER</li></a>
            <a href="deliver"><li>DELIVER</li></a>
            <a href="main"><li>MAIN PAGE</li></a>
        </ul>
        <script>
			$(".product_list").click(function(){
                if($(".sub").is(":visible")){
                    $(".sub").slideUp('slow');
                }
                else{
                    $(".sub").slideDown('slow');
                }
            })
        </script>
        </ul>
    </nav>

</body>
</html>