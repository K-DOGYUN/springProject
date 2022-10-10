<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../includes/header.jsp" %>
	<div class="container" style="margin-top: 100px">
		<div class="container">
			<h1 class="display-1">${product.productName }</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-7">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#home-tab-pane" type="button" role="tab"
					aria-controls="home-tab-pane" aria-selected="true">Home</button>
				</li>

			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel"
				aria-labelledby="home-tab" tabindex="0">...</div>
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
				<dt class="col-sm-4">Price</dt>
				<dd class="col-sm-8">${product.productPrice}</dd>
			</dl>
			<dl class="row">
				<dt class="col-sm-4">Delivery Fee</dt>
				<dd class="col-sm-8">${product.delivFee}</dd>
			</dl>
			<dl class="row">
				<dt class="col-sm-4">Price</dt>
				<dd class="col-sm-8">${product.productPrice}</dd>
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
	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>       
	<script type="text/javascript">
	/*<li class="nav-item">
	<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
	data-bs-target="#home-tab-pane" type="button" role="tab"
	aria-controls="home-tab-pane" aria-selected="true">Home</button>
</li>

<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel"
	aria-labelledby="home-tab" tabindex="0">...</div>
*/
		$(document).ready(function() {
			<c:forEach items="${product.imgList}" var="imgList">
				var list = document.createElement("li");
				list.setAttribute("class", "nav-item");
				
				var button = document.createElement("button");
				button.setAttribute("class", "nav-link active");
				button.setAttribute("id", "${imgList.imgNo}");
				button.setAttribute("data-bs-toggle", "tab");
				button.setAttribute("data-bs-target", "#${imgList.imgName}");
				button.setAttribute("type", "button");
				button.setAttribute("aria-controls", "home-tab-pane");
				
				var sImg = document.createElement("img");
				
				console.log("${imgList.imgPath}");
				console.log("${imgList.imgUuid}");
				console.log("${imgList.imgName}");
				sImg.setAttribute("src",
        			"/showImage?path="
        			+"${imgList.imgPath}"
        			+"/ss_"
        			+"${imgList.imgUuid}"
        			+"_"
        			+"${imgList.imgName}"
        		);
				
				button.append(sImg);
				list.append(button);
				$(".nav.nav-tabs").append(list);
			
        		var imgContent = document.createElement("div");
        		imgContent.setAttribute("class", "tab-pane fade");
        		imgContent.setAttribute("id", "${imgList.imgNo}");
        		$(".tab-content").append(imgContent);
        		
        		var image = document.createElement("img");
        		var path = "${imgList.imgPath}".replace("\\","");
        		image.setAttribute("src",
        			"/showImage?path="
        			+"${imgList.imgPath}"
        			+"/"
        			+"${imgList.imgUuid}"
        			+"_"
        			+"${imgList.imgName}"
        		);
        		$("#"+"${imgList.imgNo}").append(image)
       		</c:forEach>
		});
	</script>