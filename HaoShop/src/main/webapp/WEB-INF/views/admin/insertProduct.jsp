<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertProduct</title>
<link rel="stylesheet" href="resources/css/insertProduct.css">
<link rel="stylesheet" href="resources/css/admin_bar.css">

</head>
<body>
<%@ include file="/WEB-INF/views/admin/admin_bar.jsp" %>
	<section class="insert_section">
	   <div class="insert_div">
      <h2 align="center">상품등록</h2>
      <form id="fileForm" action="insertProduct" method="POST" enctype="multipart/form-data">
			<table class="insert_table">
            <tr>
               <th>메인카테고리</th>
                  <td>
                  <select name="cate_main_name" id="cate_main_name" style="width: 150px; height: 24px;">
                     <option value="" selected>::선택::</option>
                     <option value="100">OUTER</option>
                     <option value="200">TOP</option>
                     <option value="300">BOTTOM</option>
                     <option value="400">ETC</option>
                  </select>
                  </td>
               </tr>
            <tr>
               <th>서브카테고리</th>
                  <td>
                  <select id="cate_sub_name" name="cate_sub_name"  style="width: 150px; height: 24px;" onchange="chking();">
                     <option value="" selected>::선택::</option>
                     <option value="001">JACKET</option>
                     <option value="002">COAT</option>
                     <option value="003">DOWNJACKET</option>
                     <option value="001">SWEAT</option>
                     <option value="002">KNITWEAR</option>
                     <option value="003">SHIRTS</option>
                     <option value="004">VEST</option>
                     <option value="001">TROUSER</option>
                     <option value="002">SHORT</option>
                     <option value="001">SHOES</option>
                     <option value="002">LIFEGOODS</option>
                  </select>
               </td>
            </tr>
            <tr>
               <th>카테고리번호</th>
                 <td><input type="text" id="cate_no" name="cate_no"></td><br>
            </tr>
            <tr>
               <th>상품명</th>
                  <td>
                     <input type="text" name="p_name" id="p_name" />
                  </td>
            </tr>
            <tr>
               <th>상품가격</th>
                  <td>
                     <input type="text" name="p_price" id="p_price" />
                  </td>
            </tr>
            <tr>
               <th>할인가</th>
                  <td>
                     <input type="text" name="p_discount" id="p_discount" />
                  </td>
            </tr>
            <tr>
               <th>상품색상</th>
                  <td>
                     <input type="text" name="p_color" id="p_color" />
                  </td>
            </tr>
            <tr>
               <th>상품사이즈</th>
                  <td>
                     <input type="text" name="p_size" id="p_size" />
                  </td>
            </tr>
            <tr>
               <th>상품재고</th>
                  <td>
                  <input type="number" id="buy_quantity" min="1" maxlength="2" max="99" value="1" oninput="mxNum(this)" />
            </tr>
            <tr>
               <th>상품이미지</th>
                  <td>
                     <input type="file" name="uploadFile" id="uploadFile" />
                  </td>
            </tr>
            <tr>
               <th>상품설명</th>
                  <td>
                     <textarea name="p_explain" id="p_explain" cols="88" rows="80"></textarea>
                  </td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="button" value="물품등록" onclick="doInsertProduct()" />
               </td>
            </tr>
         </table>
      </form>
   </div>
</section>
</body>
</html>

