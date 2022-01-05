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
		var member_id = $("#member_id").val();
		var myp = $("#myp").val();
		$.ajax({
			type : "GET",
			url : "mypL",
			data : {
				"member_id" : member_id,
				"myp" : myp
			}, success : function(data) {
				window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
			}
		});
	}
</script>
<h1 id="main_title"><a href="main"><img src="resources/img/deco.png" /></a></h1>
<div id="icon" align="right">
<form name="frm" id="frm">
	<input type="hidden" id="myp" value="${myp}" />
		<c:choose>
			<c:when test="${member.member_id eq 'Administrator'}">
				<i class="fa fa-user-plus fa-2x" onclick="location.href='prdinsert'"
					style="cursor: pointer"></i>
				<i class="fa fa-user  fa-2x" onclick="location.href='productList'"
					style="cursor: pointer"></i>
				<i class="fa fa-user-times  fa-2x" onclick="location.href='logout'"
					style="cursor: pointer"></i>
			</c:when>
			<c:when test="${member.member_id == null}">
				<i class="fa fa-user-plus fa-2x" onclick="location.href='term'"
					style="cursor: pointer"></i>
				<i class="fa fa-user  fa-2x" onclick="location.href='login'"
					style="cursor: pointer"></i>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="member_id" name="member_id"
					value="${member.member_id}" />
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
		<li class='Mirror'>거울
			<ul>
				<li
					onclick="location.href='category?cate_id=CHE20180050'">전신 거울</li>
				<li onclick="location.href='category?cate_id=ADF20180070'">탁상
					거울</li>
				<li class="liBot"
					onclick="location.href='category?cate_id=AWA20180060'">벽걸이 거울</li>
			</ul>
		</li>
		<li>식탁용 제품
			<ul>
				<li
					onclick="location.href='category?cate_id=PLA20180080'">플레이트</li>
				<li onclick="location.href='category?cate_id=CUT20180090'">커틀러리</li>
				<li class="liBot"
					onclick="location.href='category?cate_id=TEA20180100'">티</li>
			</ul>
		</li>
		<li>장식품
			<ul>
				<li
					onclick="location.href='category?cate_id=TAB20180010'">테이블</li>
				<li class="liBot"
					onclick="location.href='category?cate_id=PLO20180020'">화분</li>
			</ul>
		</li>
		<li>조명
			<ul>
				<li
					onclick="location.href='category?cate_id=LIG20180030'">인테리어 조명</li>
				<li class="liBot"
					onclick="location.href='category?cate_id=LED20180040'">LED</li>
			</ul>
		</li>
		<li onclick="location.href='category?cate_id=FAB20180110'">천</li>
		<li class='contact' onclick="location.href='board'">공지사항</li>
	</ul>
</div>