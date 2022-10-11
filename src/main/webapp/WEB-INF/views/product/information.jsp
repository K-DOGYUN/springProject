<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../includes/header.jsp" %>
	<div class="container" style="margin-top: 100px">
		<div class="container">
			<h1 class="display-1">${product.productName }</h1>
		</div>
		<div class="row">
			<div id="leftContainer" class="col-lg-7">
				<div>
					<c:forEach items="${product.imgList}" var="imgList" varStatus="i">
						<div id="imgBox${i.index}">
			  				<img class="img-fluid" alt="" style="height: 70vh;"
			  				src="/showImage?path=${imgList.imgPath}/${imgList.imgUuid}_${imgList.imgName}">
						</div>
					</c:forEach>
				</div>
				<div>
					<c:forEach items="${product.imgList}" var="imgList" varStatus="i">
						<span id="imgBtn${i.index}">
							<img alt="" src="/showImage?path=${imgList.imgPath}/ss_${imgList.imgUuid}_${imgList.imgName}">
						</span>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-5">
				<dl class="row">
					<dt class="col-sm-4">Product Name</dt>
					<dd class="col-sm-8">${product.productName}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Manufacturer Name</dt>
					<dd class="col-sm-8">${product.manufacName}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Delivery Fee</dt>
					<dd class="col-sm-8">${product.delivFee}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Price</dt>
					<dd class="col-sm-8">${product.productPrice}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-12">Options</dt>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
									option name
								</th>
								<th colspan="2">
									name
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								</td>
								<td>optionDetail</td>
								<td>optionPrice</td>
							</tr>
							<tr>
								<td>
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								</td>
								<td>optionDetail</td>
								<td>optionPrice</td>
							</tr>
							<tr>
								<td>
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								</td>
								<td>optionDetail</td>
								<td>optionPrice</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
									option name
								</th>
								<th colspan="2">
									name
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								</td>
								<td>optionDetail</td>
								<td>optionPrice</td>
							</tr>
							<tr>
								<td>
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								</td>
								<td>optionDetail</td>
								<td>optionPrice</td>
							</tr>
							<tr>
								<td>
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								</td>
								<td>optionDetail</td>
								<td>optionPrice</td>
							</tr>
						</tbody>
					</table>
					
				</dl>
				
				<label class="fs-5 fw-bold mb-4">Seller Information</label>
				<dl class="row">
					<dt class="col-sm-4">Seller ID</dt>
					<dd class="col-sm-8">${seller.memberId}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Seller Name</dt>
					<dd class="col-sm-8">${seller.memberName}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Contact</dt>
					<dd class="col-sm-8">${seller.memberPhone}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Business Number</dt>
					<dd class="col-sm-8">${seller.businessNo}</dd>
				</dl>
			</div>
		</div>
	</div>
	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>       
	<script type="text/javascript">

		$(document).ready(function() {
			$("div[id*='imgBox']").hide();
			$("#imgBox0").show();
			$("span[id*='imgBtn']").mouseover(function() {
				var id = $(this).attr('id');
				id = id.replace("imgBtn", "");
				console.log("mouseOver : " + id);
				$("div[id*='imgBox']").hide();
				$("#imgBox"+id).show();
			})
		});
	</script>