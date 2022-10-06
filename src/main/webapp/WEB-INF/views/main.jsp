<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="p-3 text-bg-dark sticky-top w-100" style="z-index: 1030;">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
						<use xlink:href="#bootstrap"></use></svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
					<li><a href="#" class="nav-link px-2 text-white">Features</a></li>
					<li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
					<li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
					<li><a href="#" class="nav-link px-2 text-white">About</a></li>
				</ul>

				<div class="text-end">
					<button type="button" class="btn btn-outline-light me-2">Login</button>
					<button type="button" class="btn btn-outline-info">Sign-up</button>
				</div>
			</div>
			<div class="d-flex justify-content-center mt-2">				
					<button type="button" class="btn btn-outline-light me-2" id="categoryMenuBtn">Category Menu</button>
				<form class="col-lg-9 mb-3 mb-lg-0 me-lg-3" role="search">
					<input type="search"
						class="form-control form-control-dark text-bg-dark"
						placeholder="Search..." aria-label="Search">
				</form>
			</div>
			<div class="d-flex justify-content-center">
				<div class="col-lg-11 mt-2 row border border-light rounded" id="categoryMenu" style="display: none;">
					
					<ul class="col-lg-3 border-end border-light mt-3 btn-group-vertical" id="largeCategory" style="justify-content: flex-start;">
						<li id="" class="list-group-item">
							<a href="#" id="1" class="btn btn-outline-light btn-sm border-0">
								1
							</a>
						</li>
						<li id="" class="list-group-item">
							<a href="#" id="2" class="btn btn-outline-light btn-sm border-0">
								2
							</a>
						</li>
					</ul>
					
					<ul class="col-lg-3 border-end border-light mt-3 btn-group-vertical" id="mediumCategory" style="justify-content: flex-start;">
						<li id="" class="list-group-item">
							<a href="#" id="3" class="btn btn-outline-light btn-sm border-0 pNo-1">
								3
							</a>
						</li>
						<li id="" class="list-group-item">
							<a href="#" id="4" class="btn btn-outline-light btn-sm border-0 pNo-1">
								4
							</a>
						</li>
						<li id="" class="list-group-item">
							<a href="#" id="5" class="btn btn-outline-light btn-sm border-0 pNo-2">
								5
							</a>
						</li>
						<li id="" class="list-group-item">
							<a href="#" id="6" class="btn btn-outline-light btn-sm border-0 pNo-2" >
								6
							</a>
						</li>
					</ul>
					
					<ul class="col-lg-3 border-end border-light mt-3 btn-group-vertical" id="smallCategory" style="justify-content: flex-start;">
						<li id="" class="list-group-item">
							<a href="#" id="7" class="btn btn-outline-light btn-sm border-0 pNo-3" >
								7
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="8" class="btn btn-outline-light btn-sm border-0 pNo-3" >
								8
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="9" class="btn btn-outline-light btn-sm border-0 pNo-4" >
								9
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="10" class="btn btn-outline-light btn-sm border-0 pNo-4" >
								10
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="11" class="btn btn-outline-light btn-sm border-0 pNo-5" >
								11
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="12" class="btn btn-outline-light btn-sm border-0 pNo-5" >
								12
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="13" class="btn btn-outline-light btn-sm border-0 pNo-6" >
								13
							</a>
						</li>						<li id="" class="list-group-item">
							<a href="#" id="14" class="btn btn-outline-light btn-sm border-0 pNo-6" >
								14
							</a>
						</li>
					</ul>
					
					<ul class="col-lg-3 mt-3 btn-group-vertical" id="detailCategory" style="justify-content: flex-start;">
						<li id="" class="list-group-item">
							<a href="#" id="" class="btn btn-outline-light btn-sm border-0 btn-category" >
								1
							</a>
						</li>
						<li id="" class="list-group-item">
							<a href="#" id="" class="btn btn-outline-light btn-sm border-0 btn-category" >
								1
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner" style="height: 400px;">
				<div class="carousel-item active">
					<img src="/resources/img/1.jpg" class="img-fluid" alt="..." style="margin-top: -20%">
				</div>
				<div class="carousel-item">
					<img src="/resources/img/2.jpg" class="img-fluid" alt="..." style="margin-top: -20%">
				</div>
				<div class="carousel-item">
					<img src="/resources/img/3.jpg" class="img-fluid" alt="..." style="margin-left: 300px">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function() {
        	<c:forEach items="${category}" var="category">
                <c:if test="${category.category_level == 1 }">
                	console.log("${category.category_name}");
                	var category = document.createElement("li");
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 btn-category");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.append("${category.category_name}");
                	
                	category.setAttribute("class", "list-group-item");
                	category.append(categoryA);
                	$("#largeCategory").append(category);
                </c:if>
                <c:if test="${category.category_level == 2 }">
                	console.log("   ${category.category_name}");
                	var category = document.createElement("li");
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 btn-category");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.append("${category.category_name}");
                	
                	category.setAttribute("class", "list-group-item");
                	category.append(categoryA);
                	//category.hidden = true;
                	$("#mediumCategory").append(category);
                </c:if>
                <c:if test="${category.category_level == 3 }">
                	console.log("      ${category.category_name}");
                	var category = document.createElement("li");
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 btn-category");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.append("${category.category_name}");
                	
                	category.setAttribute("class", "list-group-item");
                	category.append(categoryA);
                	//category.hidden = true;
                	$("#smallCategory").append(category);
                </c:if>
                <c:if test="${category.category_level == 4 }">
                	console.log("         ${category.category_name}");
                	var category = document.createElement("li");
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 btn-category");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.append("${category.category_name}");
                	
                	category.setAttribute("class", "list-group-item");
                	category.append(categoryA);
                	//category.hidden = true;
                	$("#detailCategory").append(category);
                </c:if>
            </c:forEach>
            //카테고리 토글
            $("#largeCategory > li > a").on("mouseover", function(e) {
            	console.log("largeCategoryTouch");
            	$("#mediumCategory > li > a").hide();
            	$("#smallCategory > li > a").hide();
            	$("#detailCategory > li > a").hide();
            	var pNo = $(this).attr("id");
            	console.log(pNo);
            	$("#mediumCategory > li > a.pNo-" + pNo).show();
            });
            $("#mediumCategory > li > a").on("mouseover", function(e) {
            	console.log("largeCategoryTouch");
            	$("#smallCategory > li > a").hide();
            	$("#detailCategory > li > a").hide();
            	var pNo = $(this).attr("id");
            	console.log(pNo);
            	$("#smallCategory > li > a.pNo-" + pNo).show();
            });
            $("#smallCategory > li > a").on("mouseover", function(e) {
            	console.log("largeCategoryTouch");
            	$("#detailCategory > li > a").hide();
            	var pNo = $(this).attr("id");
            	console.log(pNo);
            	$("#detailCategory > li > a.pNo-" + pNo).show();
            });//카테고리 토글
            
            $("#categoryMenuBtn").on("click", function(e) {
            	console.log("categoryMenuBtnClicked")
            	if ($("#categoryMenu").is(':visible')) {
            		console.log($("#categoryMenu").is(':visible'));
            		$("#categoryMenu > ul > li > a").hide();
            		$("#categoryMenu").hide();
            	} else {
            		console.log($("#categoryMenu").is(':visible'));
            		$("#categoryMenu > #largeCategory > li > a").show();
            		$("#categoryMenu").show();
            	}
            })
        });
       </script>
</body>
</html>