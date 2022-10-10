<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<option value="1" style="display: ">One</option>


"<div><img src='/showImage?path="
+ callPath
+ "'><button type='button' class='deleteImage' data-image=\'"
+ callPath
+ "\'> x </button></div>"

<table id="optionBox" class="table table-striped">
 
   <tr id="optionNameBox">
     <td class="align-bottom" colspan="1" scope="row">
		<label class="mb-2" for="optionName" style="font-size: 15px">옵션명 (예 : 색상, 사이즈) : </label>
     </td>
     <td class="align-bottom" colspan="2">
		<input type="text" class="form-control form-control-sm"
		id="optionName" name="optionName" placeholder="옵션명 (예 : 색상, 사이즈)"/>
     </td>
  	 <td class="align-bottom">
     	<button type="button" class="btn btn-sm btn-warning mt-2" onclick="optionDetailAdd()">상세 추가</button>
     </td>
   </tr>
   
   <tr id="optionDeleteBox">
    <td >
		<button type="button" id="optionDeleteBtn" class="btn btn-sm btn-danger mt-2" onclick="">옵션 사용 취소</button>
	    </td>
    </tr>
 
</table>


<tr>
   <td class="align-bottom">
   		<input type="text" class="form-control form-control-sm"
id="optionDetail" name="optionDetail" placeholder="옵션 상세(예 : 빨강, XL)"/>
   </td>
   <td class="align-bottom">
   		<input type="text" class="form-control form-control-sm"
id="optionStock" name="optionStock" placeholder="옵션 재고"/>
   </td>
   <td class="align-bottom">
   		<input type="text" class="form-control form-control-sm"
id="optionPrice" name="optionPrice" placeholder="옵션 추가 가격"/>
   </td>
   <td class="align-bottom">
   		<button class="btn btn-sm btn-danger mt-2">옵션 삭제</button>
   </td>
 </tr>
 <tr>
   <td class="align-bottom">
   		<input type="text" class="form-control form-control-sm"
id="optionDetail" name="optionDetail" placeholder="옵션 상세(예 : 빨강, XL)"/>
   </td>
   <td class="align-bottom">
   		<input type="text" class="form-control form-control-sm"
id="optionStock" name="optionStock" placeholder="옵션 재고"/>
   </td>
   <td class="align-bottom">
   		<input type="text" class="form-control form-control-sm"
id="optionPrice" name="optionPrice" placeholder="옵션 추가 가격"/>
   </td>
   <td class="align-bottom">
   		<button class="btn btn-sm btn-danger mt-2">옵션 삭제</button>
   </td>
 </tr>









</body>
</html>