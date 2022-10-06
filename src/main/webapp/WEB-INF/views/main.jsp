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
	<header class="p-3 text-bg-dark">
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
					<button type="button" class="btn btn-outline-light me-2">Category Menu</button>
				<form class="col-lg-9 mb-3 mb-lg-0 me-lg-3" role="search">
					<input type="search"
						class="form-control form-control-dark text-bg-dark"
						placeholder="Search..." aria-label="Search">
				</form>
			</div>
			<div class="d-flex justify-content-center">
				<div class="col-lg-11 mt-2 row border border-light rounded">
					<ul class="col-lg-3 border-end border-light mt-3 btn-group-vertical" id="largeCategory" style="justify-content: flex-start;">
					</ul>
					<ul class="col-lg-3 border-end border-light mt-3" id="mediumCategory">
					</ul>
					<ul class="col-lg-3 border-end border-light mt-3" id="smallCategory">
					</ul>
					<ul class="col-lg-3 mt-3" id="detailCategory">
					</ul>
				</div>
			</div>
		</div>
	</header>
	
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
        });
       </script>
</body>
</html>