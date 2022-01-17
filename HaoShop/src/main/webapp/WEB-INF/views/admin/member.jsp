<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
</head>
<body>
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/admin_bar.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
<section class="member_section">
  <h1 align="center">회원 관리목록</h1>
  <h3 align="center">회원 정보</h3>
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
  </thead>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
    </tr>
    <tr>
      <td>13</td>
      <td>14</td>
      <td>15</td>
      <td>16</td>
      <td>17</td>
      <td>18</td>
    </tr>
    <tr>
      <td>19</td>
      <td>20</td>
      <td>21</td>
      <td>22</td>
      <td>23</td>
      <td>24</td>
    </tr>
    <tr>
      <td>25</td>
      <td>26</td>
      <td>27</td>
      <td>28</td>
      <td>29</td>
      <td>30</td>
    </tr>
    <tr>
      <td>31</td>
      <td>32</td>
      <td>33</td>
      <td>34</td>
      <td>35</td>
      <td>36</td>
    </tr>
    <tr>
      <td>37</td>
      <td>38</td>
      <td>39</td>
      <td>40</td>
      <td>41</td>
      <td>42</td>
    </tr>
    <tr>
      <td>43</td>
      <td>44</td>
      <td>45</td>
      <td>46</td>
      <td>47</td>
      <td>Ipsumdfasfgdsgdsgagagagagdagag</td>
    </tr>
</table>
</div>
<!-- 페이징을 지정할 태그에 class에 pagination을 넣으면 자동으로 페이징이 된다.-->
<!-- 페이징의 크기를 제어할 수 있는데 pagination-lg를 추가하면 페이징 크기가 커지고, pagination-sm를 넣으면 작아진다. -->
<!-- 큰 페이징 class="pagination pagination-lg", 보통 페이징 class="pagination", 작은 페이징 class="pagination pagination-sm" -->
<ul class="pagination">
<!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.-->
<!-- disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
<li class="disabled">
<a href="#">
<span><<</span>
</a>
</li>
<!-- li태그의 클래스에 active를 넣으면 색이 반전되고 클릭도 되지 않는다. -->
<!-- active의 의미는 현재 페이지의 의미이다. -->
<li><a href="productList">1</a></li>
<li class="active"><a href="member">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>
<li>
<a href="#">
<span>»</span>
</section>
</body>
</html>