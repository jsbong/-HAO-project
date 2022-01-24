<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/admin_bar.css">
<link rel="stylesheet" href="resources/css/jqbar.css" />
<script src="resources/js/jqbar.js" charset="UTF-8"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>


<section class="member_section">
  <h1 align="center">관리자 페이지</h1>
  <h3 align="center"></h3>
<h3>일일 방문자 수</h3>
<h4><p style="color: red;">${map.cntToday}명</p></h4><br>
<a href="deliver?sPrd=배송대기중"><h3>배송 대기중인 주문</h3></a>
<h4><p style="color: red;">${map.waitDelCnt}개</p></h4><br>
<a href="productList?pCnt=30"><h3>재고 부족 상품 (30개 이하)</h3></a>
<h4><p style="color: red;">${map.p_Cnt}개</p></h4><br>

<div class="bars">
	<div id="bar-1"></div>
	<div id="bar-2"></div>
	<div id="bar-3"></div>
	<div id="bar-4"></div>
	<div id="bar-5"></div>
	<div id="bar-6"></div>
	<div id="bar-7"></div>
	<div id="bar-8"></div>
	<div id="bar-9"></div>
	<div id="bar-10"></div>
	<div id="bar-11"></div>
	<div id="bar-12"></div>
	${map.pay_M_P[0]} ${map.pay_M_P[1]}
	<div class="container">
	    <div class="row my-3">
	        <div class="col">
	            <h4>분기별 판매 현황</h4>
	        </div>
	    </div>
	    <div class="row py-2" >
	        <div class="col-md-4 py-1">
	            <div class="card">
	                <div class="card-body"> <canvas id="chDonut3"></canvas> </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<script src="http://code.jquery.com/jquery-latest.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="resources/js/jqbar.js" type="text/javascript"></script>

<h3>신규 가입 회원</h3>	
<h4><p style="color: red;">${map.newMemberCnt}명</p></h4>

<div class="member_div">
  <table>
    <tr>
      <th>회원 번호</th>
      <th>ID</th>
      <th>이름</th>
      <th>생년월일</th>
      <th>전화번호</th>
      <th>주소</th>
    </tr>
    <tr>
      <c:forEach begin="0" end="${(fn:length(map.m_list))}" var="i">
			<c:set var="row_m" value="${map.m_list[i]}" />
			<c:choose>
				<%-- 검색결과가 있을 때 --%>
				<c:when test="${not empty row_m}">
					<tr bgcolor="#fff" height="50">
						<td align="center"><a href="memberDetail?m_no=${row_m.m_no}">${row_m.m_no}</a></td>
						<td align="center">${row_m.m_id}</td>
						<td align="center">${row_m.m_name}</td>
						<td align="center"><fmt:parseDate var="parseRegDate" value="${row_m.m_birth}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
							${resultRegDt}</td>
						<td align="center">${row_m.m_phone}</td>
						<td align="center">${fn:split(row_m.m_addr, '*')[1]}</td>
					</tr>
				</c:when>
				<%-- 검색결과가 없을 떄 --%>
				<c:when test="${map.newMemberCnt == 0}">
					<tr style="text-align: center;">
						<td colspan='5'><b>신규 가입 회원이 없습니다.</b></td>
					</tr>
				</c:when>
			</c:choose>
		</c:forEach>
    </tr>
</table>
</div>
<h3>금일 주문 현황</h3>
	
	<div align="center">
			<table class="list">
			<tr>
				금일 주문 내역 갯수:<b style="color: blue;">${map.count}</b>
			</tr> 
			</table>
		</div>
			
		<div class="member_div">
 			 <table>
    			<tr>
					<td>주문 번호</td>
					<td>회원 번호</td>
					<td>주문일자</td>
					<td>상품명</td>
					<td>결제금액</td>
					<td>배송현황</td>
				</tr>
				<tr>
				<!-- "주문내역" -->
				<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
					<c:choose>
						<%-- 검색결과가 있을 때 --%>
						<c:when test="${not empty row}">
							<tr bgcolor="#fff" height="50">
								<td align="center">${row.pay_no}</td>
								<td align="center">${row.m_no}</td>
								<td><fmt:formatDate value="${row.pay_regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${row.p_name}</td>
								<td align="center"><fmt:formatNumber value="${row.p_sum}" pattern="#,###"/>원</td>
									<td align="center">
									<label>
										<select name="${row.pay_no}" value="${row.pay_state}" onchange="stachange('${row.pay_no}')">
										  <option value="${row.pay_state}" hidden>${row.pay_state}</option>
										  <option value="배송대기중">배송대기중</option>
										  <option value="배송중">배송중</option>
										  <option value="배송완료">배송완료</option>
										</select>
									</label>
									</td>
							</tr>
						</c:when>
						<%-- 검색결과가 없을 떄 --%>
						<c:when test="${map.count == 0}">
							<tr style="text-align: center;">
								<td colspan='5'><b>주문내역이 없습니다.</b></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
				</tr>
				<tr>
				</tr>
			</table>
			<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
					<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
				</c:if>
			</div>
		</div>
		<script>
		
			$(document).ready(function () {
				$('#bar-1').jqbar({ label: '1월', value: ${map.pay_M[0]}, barColor: '#D64747' , orientation: 'v'});
				$('#bar-2').jqbar({ label: '2월', value: ${map.pay_M[1]}, barColor: '#FF681F' , orientation: 'v'});
				$('#bar-3').jqbar({ label: '3월', value: ${map.pay_M[2]}, barColor: '#ea805c' , orientation: 'v'});
				$('#bar-4').jqbar({ label: '4월', value: ${map.pay_M[3]}, barColor: '#88bbc8' , orientation: 'v'});
				$('#bar-5').jqbar({ label: '5월', value: ${map.pay_M[4]}, barColor: '#939393' , orientation: 'v'});
				$('#bar-6').jqbar({ label: '6월', value: ${map.pay_M[5]}, barColor: '#3a89c9' , orientation: 'v'});
				$('#bar-7').jqbar({ label: '7월', value: ${map.pay_M[6]}, barColor: '#D64747', orientation: 'v' });
				$('#bar-8').jqbar({ label: '8월', barColor: '#FF681F', value: ${map.pay_M[7]}, orientation: 'v' });
				$('#bar-9').jqbar({ label: '9월', barColor: '#ea805c', value: ${map.pay_M[8]}, orientation: 'v' });
				$('#bar-10').jqbar({ label: '10월', barColor: '#88bbc8', value: ${map.pay_M[9]}, orientation: 'v' });
				$('#bar-11').jqbar({ label: '11월', barColor: '#939393', value: ${map.pay_M[10]}, orientation: 'v' });
				$('#bar-12').jqbar({ label: '12월', barColor: '#3a89c9', value: ${map.pay_M[11]}, orientation: 'v' });
			});
			function list(page) {
				location.href="adminpage?curPage="+page;
			}
			function stachange(pay_no) {
				var pay_state = document.getElementsByName(pay_no)[0].value;
				$.ajax({
					type : "POST",
					url : "paystate",
					data : {
						"pay_no" : pay_no,
						"pay_state" : pay_state
					}, success : function(data) {
						alert("변경 완료");
					}
				});
			}
			var colors = ['red','skyblue','yellowgreen','#c3e6cb','#dc3545','#6c757d']; 
		    
		    var donutOptions = { cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐 
		        legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
		    }; 
		    // donut
		    var chDonutData3 = {
		        labels: ['1분기', '2분기', '3분기' , '4분기'], 
		        datasets: [
		            { 
		                backgroundColor: colors.slice(0,3), 
		                borderWidth: 0, 
		                data: [21, 45, 55, 33] 
		            } 
		        ] 
		    };
		    var chDonut3 = document.getElementById("chDonut3"); 
	        if (chDonut3) { 
	            new Chart(chDonut3, { 
	                type: 'pie', 
	                data: chDonutData3, 
	                options: donutOptions 
	            }); 
		    }
		</script>
		


</section>
</body>
<body>



</body>
</html>