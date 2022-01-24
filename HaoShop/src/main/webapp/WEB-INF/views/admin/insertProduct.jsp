<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
   <head>
      <meta charset="UTF-8">
      <title>insertProduct</title>
      <script src="http://code.jquery.com/jquery-latest.js"></script>
      <script src="resources/js/product.js" charset="UTF-8"></script>
      <script src="resources/ckeditor/ckeditor.js"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <link rel="stylesheet" href="resources/css/insertProduct.css">
      <link rel="stylesheet" href="resources/css/admin_bar.css">
   </head>
   <body>
      <%@ include file="../admin/admin_bar.jsp" %>
      <section class="insert_section">
         <div class="insert_div">
            <h2 align="center">PRODUCT REGISTRATION</h2>
            <form id="fileForm" action="insertProduct" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="cate_no" name="cate_no">
               <table class="insert_table">
                  <tr>
                     <th>메인카테고리</th>
                     <td>
                        <select name="cate_main_name" id="cate_main_name" onchange="main_nameChange()">
                           <option value="" selected>::선택::</option>
                           <option value="100" data-tab="outer">OUTER</option>
                           <option value="200" data-tab="top">TOP</option>
                           <option value="300" data-tab="bottom">BOTTOM</option>
                           <option value="400" data-tab="etc">ETC</option>
                        </select>
                     </td>
                  </tr>
                  <tr class="cate_sub" id="outer">
                     <th>서브카테고리</th>
                     <td>
                        <select class="cate_sub_name" id="outer1" name="cate_sub" onchange="chking();">
                           <option value="" selected>::선택::</option>
                           <option value="001">JACKET</option>
                           <option value="002">COAT</option>
                           <option value="003">DOWNJACKET</option>
                        </select>
                     </td>
                  </tr>
                  <tr class="cate_sub" id="top">
                     <th>서브카테고리</th>
                     <td>
                        <select class="cate_sub_name" id="top1" name="cate_sub" onchange="chking();">
                           <option value="" selected>::선택::</option>
                           <option value="001">SWEAT</option>
                           <option value="002">KNITWEAR</option>
                           <option value="003">SHIRTS</option>
                           <option value="004">VEST</option>
                        </select>
                     </td>
                  </tr>
                  <tr class="cate_sub" id="bottom">
                     <th>서브카테고리</th>
                     <td>
                        <select class="cate_sub_name" id="bottom1" name="cate_sub_name" onchange="chking();">
                           <option value="" selected>::선택::</option>
                           <option value="001">TROUSER</option>
                           <option value="002">SHORT</option>
                        </select>
                     </td>
                  </tr>
                  <tr class="cate_sub" id="etc">
                     <th>서브카테고리</th>
                     <td>
                        <select class="cate_sub_name" id="etc1" name="cate_sub_name" onchange="chking();">
                           <option value="" selected>::선택::</option>
                           <option value="001">SHOES</option>
                           <option value="002">LIFEGOODS</option>
                        </select>
                     </td>
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
                        <input type="text" name="p_amount" id="p_amount" />
                     </td>
                  </tr>
                  <tr>
                     <th>상품이미지</th>
                     <td>
                           <input multiple='multiple' type='file' name='file' />
                     </td>
                  </tr>
                  <tr>
                     <th>상품설명</th>
                     <td>
                        <textarea name="p_explain" id="p_explain" cols="88" rows="80"></textarea>
                        <script>
							CKEDITOR.replace( 'p_explain', {
								filebrowserUploadUrl : "imageUpload.do"
							});
						</script>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="text-align:center;">
                        <input type="button" class="insertBtn" value="물품등록" onclick="doInsertProduct()" />
                     </td>
                  </tr>
               </table>
            </form>
         </div>
      </section>
   </body>
</html>