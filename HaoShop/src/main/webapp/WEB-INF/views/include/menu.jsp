<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/login.js" charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/include.css">
<script>
	// 마이페이지 클릭 이벤트
	function mypBtn() {
		var m_no = $("#m_no").val();
		var myp = $("#myp").val();
		$.ajax({
			type : "GET",
			url : "mypL",
			data : {
				"m_no" : m_no,
				"myp" : myp
			}, success : function(data) {
				window.location.href = "mypage?m_no=" + m_no + "&myp=" + myp;
			}
		});
	}
</script>
<h1 id="main_title"><a href="main"><img src="resources/img/deco.png" /></a></h1>
<div id="icon" align="right">
<form name="frm" id="frm">
	<input type="hidden" id="myp" value="${myp}" />
		<c:choose>
			<c:when test="${member.m_id eq 'Administrator'}">
				<i class="fa fa-user-plus fa-2x" onclick="location.href='prdinsert'"
					style="cursor: pointer"></i>
				<i class="fa fa-user  fa-2x" onclick="location.href='productList'"
					style="cursor: pointer"></i>
				<i class="fa fa-user-times  fa-2x" onclick="location.href='logout'"
					style="cursor: pointer"></i>
			</c:when>
			<c:when test="${member.m_id == null}">
				<i class="fa fa-user-plus fa-2x" onclick="location.href='term'"
					style="cursor: pointer"></i>
				<i class="fa fa-user  fa-2x" onclick="location.href='login'"
					style="cursor: pointer"></i>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="m_id" name="m_id"
					value="${member.m_id}" />
				<input type="hidden" id="m_no" name="m_no"
					value="${member.m_no}" />
				<i class="fa fa-user-times  fa-2x" onclick="location.href='logout'"
					style="cursor: pointer"></i>
				<i class="fa fa-shopping-cart fa-2x" onclick="productCart()"
					style="cursor: pointer"></i>
				<i class="fa fa-shopping-bag fa-2x" onClick="mypBtn()"
					style="cursor: pointer"></i>
			</c:otherwise>
		</c:choose>
		<div id="search" align="center">
         <input type="text" name="sPrd" id="sPrd" placeholder="검색어 입력" onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
         <button type="button" id="searchBtn" onclick="searchPrd()" style="cursor: pointer">
            <strong>검색</strong>
         </button>
      </div>
      <script>
         function searchPrd() {
            var sea = $("#sPrd").val();
            self.location = "searchPrd?sPrd=" + sea;
         }
      </script>
</form>
</div>
<div id="nav">
	<ul>
		<li onclick="location.href='review'">리뷰</li>
		<li class='Mirror'>OUTER
			<ul>
				<li	onclick="location.href='category?cate_no=100001'">Jacket</li>
				<li onclick="location.href='category?cate_no=100002'">Coat
					거울</li>
				<li class="liBot"
					onclick="location.href='category?cate_no=100003'">DownJacket</li>
			</ul>
		</li>
		<li>TOP
			<ul>
				<li	onclick="location.href='category?cate_no=200001'">Sweater</li>
				<li onclick="location.href='category?cate_no=200002'">Knitwear</li>
				<li	onclick="location.href='category?cate_no=200003'">Shirts</li>
				<li class="liBot"
					onclick="location.href='category?cate_no=200004'">Vest</li>
			</ul>
		</li>
		<li>BOTTOM
			<ul>
				<li	onclick="location.href='category?cate_no=300001'">Trouser</li>
				<li class="liBot"
					onclick="location.href='category?cate_no=300002'">Short</li>
			</ul>
		</li>
		<li>ETC
			<ul>
				<li	onclick="location.href='category?cate_no=400001'">Shoes</li>
				<li class="liBot"
					onclick="location.href='category?cate_no=400002'">Lifegoods</li>
			</ul>
		</li>
		<li class='contact' onclick="location.href='board'">공지사항</li>
	</ul>
</div>