<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminPage</title>
	<link rel="stylesheet" href="resources/css/admin/adminPage.css">
	<link rel="stylesheet" href="resources/css/admin/jqbar.css" />
	<link rel="stylesheet" href="resources/css/admin/graph.css">
	<script src="resources/js/jqbar.js" charset="UTF-8"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script>
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
			$(document).ready(function() {
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
		                data: [${map.pay_M[0]} + ${map.pay_M[1]} + ${map.pay_M[2]},
		                	${map.pay_M[3]} + ${map.pay_M[4]} + ${map.pay_M[5]}, 
	                		${map.pay_M[6]} + ${map.pay_M[7]} + ${map.pay_M[8]}, 
                			${map.pay_M[9]} + ${map.pay_M[10]} + ${map.pay_M[11]}] 
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
	        
	        var ctx = document.getElementById('myChart').getContext('2d'); 
	    	var chart = new Chart(ctx, { // 챠트 종류를 선택 
	    		type: 'line', // 챠트를 그릴 데이터
	    		data: { 
	    			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], 
	    			datasets: [
	    				{ label: '월 매출', 
	    				backgroundColor: 'transparent', 
	    				borderColor: 'red', 
	    				data: [${map.pay_M_P[0]},${map.pay_M_P[1]},${map.pay_M_P[2]},${map.pay_M_P[3]},${map.pay_M_P[4]},${map.pay_M_P[5]},
	    					${map.pay_M_P[6]},${map.pay_M_P[7]},${map.pay_M_P[8]},${map.pay_M_P[9]},${map.pay_M_P[10]},${map.pay_M_P[11]},] }
	    			] }, // 옵션 
	    		options: { 
	    			legend: { display: false },
	    			title: { display : true } 
	    		}
	    	}); 
	    	
	    	var ctx = document.getElementById('myChart1'); 
			var myChart = new Chart(ctx, { 
				type: 'bar', 
				data: { 
					labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], 
					datasets: [{ 
						label: '판매량', 
						data: [${map.pay_M[0]},${map.pay_M[1]},${map.pay_M[2]},${map.pay_M[3]},${map.pay_M[4]},${map.pay_M[5]},
							${map.pay_M[6]},${map.pay_M[7]},${map.pay_M[8]},${map.pay_M[9]},${map.pay_M[10]},${map.pay_M[11]},], 
						backgroundColor: [
							'rgba(255, 99, 132, 1)', 
							'rgba(54, 162, 235, 1)', 
							'rgba(255, 206, 86, 1)', 
							'rgba(75, 192, 192, 1)', 
							'rgba(153, 102, 255, 1)', 
							'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)', 
							'rgba(54, 162, 235, 1)', 
							'rgba(255, 206, 86, 1)', 
							'rgba(75, 192, 192, 1)', 
							'rgba(153, 102, 255, 1)', 
							'rgba(255, 159, 64, 1)'],  
						borderColor: [
							'rgba(255, 99, 132, 1)', 
							'rgba(54, 162, 235, 1)', 
							'rgba(255, 206, 86, 1)', 
							'rgba(75, 192, 192, 1)', 
							'rgba(153, 102, 255, 1)', 
							'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)', 
							'rgba(54, 162, 235, 1)', 
							'rgba(255, 206, 86, 1)', 
							'rgba(75, 192, 192, 1)', 
							'rgba(153, 102, 255, 1)', 
							'rgba(255, 159, 64, 1)'], 
						borderWidth: 1 }] 
				}, 
				options: { 
					legend: { display: false },
					title: { display : true },
					scales: { 
						yAxes: [{ ticks: 
						{ beginAtZero: true } 
						}] 
					} 
				}
			}); 
			});
		</script>
</head>
<body>
	<!-- admin_bar -->
	<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
	<!-- 관리자 페이지 section -->
	<section class="adminpage_section">
		<div class="adminpage-content">
			<h1>관리자 페이지</h1>
			<h4>일일 방문자 수 <span style="color: blue;">${map.cntToday}</span> 명</h4>
			<div class="graph_container">
	            <div class="monthly_payment">
	            	<span class="monthly_payment_title">월별 매출액</span>
	            	<canvas id="myChart" height=100px></canvas>
	            </div>
					<div class="quarterly_amount">
		            	<span class="quarterly_amount_title">분기별 판매 건수</span>
		            	<canvas id="chDonut3"></canvas>
		            </div>
		            <div class="monthly_amount">
		            	<span class="monthly_amount_title">월별 판매 건수</span>
		            	<canvas id="myChart1"></canvas>
	            </div>
	    	</div>
	    	<div class="haoshopStatus">
				<h3 onclick="location.href='deliver?sPrd=배송대기중'">
					<span class="current">배송 대기중인 주문</span>
					<span class="hide">${map.waitDelCnt}</span>
				</h3>
				<h3 onclick="location.href='productList?pCnt=30'">
					<span class="current">재고 부족 상품 (30개 이하)</span>
					<span class="hide">${map.p_Cnt}</span>	
				</h3>
			</div>
			<div class="todaySignup">
				<h4>신규 가입 현황 </h4>
				<ul>
					<li class="totalLeft">신규 가입 회원 수 : <span style="color: blue">${map.newMemberCnt}</span>명</li>
					<li class="status_detail">
		  				<table class="Status_table">
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
											<tr>
												<td><a href="memberDetail?m_no=${row_m.m_no}">${row_m.m_no}</a></td>
												<td>${row_m.m_id}</td>
												<td>${row_m.m_name}</td>
												<td>
													<fmt:parseDate var="parseRegDate" value="${row_m.m_birth}" pattern="yyyy-MM-dd"/>
													<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
													${resultRegDt}
												</td>
												<td>${row_m.m_phone}</td>
												<td>${fn:split(row_m.m_addr, '*')[1]}</td>
											</tr>
										</c:when>
										<%-- 검색결과가 없을 떄 --%>
										<c:when test="${map.newMemberCnt == 0}">
											<tr>
												<td colspan="6"><b>신규 가입 회원이 없습니다.</b></td>
											</tr>
										</c:when>
									</c:choose>
								</c:forEach>
		    				</tr>
						</table>
					</li>
				</ul>
			</div>
			<div class="todaySignup">
				<h4>금일 주문 현황</h4>
				<ul>
					<li class="totalLeft">금일 주문 내역 갯수: <b style="color: blue;">${map.count}</b></li>
					<li class="status_detail">
	 				<table class="Status_table">
	    				<tr>
							<th>주문 번호</th>
							<th>회원 번호</th>
							<th>주문일자</th>
							<th>상품명</th>
							<th>결제금액</th>
							<th>배송현황</th>
						</tr>
						<tr>
							<!-- "주문내역" -->
							<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
								<c:set var="row" value="${map.list[i]}" />
								<c:choose>
									<%-- 검색결과가 있을 때 --%>
									<c:when test="${not empty row}">
										<tr>
											<td>${row.pay_no}</td>
											<td>${row.m_no}</td>
											<td><fmt:formatDate value="${row.pay_regdate}" pattern="yyyy-MM-dd" /></td>
											<td>${row.p_name}</td>
											<td><fmt:formatNumber value="${row.p_sum}" pattern="#,###"/>원</td>
											<td>
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
					</table>
				</li>
				<li>
					<!-- 페이지 네비게이션 출력 -->
					<div class="paging">
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
					</li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>