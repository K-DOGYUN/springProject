<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>ShoppingMall</title>
</head>
<body>

	<header class="p-3 w-100 text-bg-dark position-fixed sticky-top" style="z-index: 1030;">
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
					<li><a href="#" class="nav-link px-2 text-white"></a></li>
				</ul>

				<div class="text-end">
					<sec:authorize access="isAnonymous()">
						<a href="/memberLogin?" class="btn btn-outline-light me-2">Login</a>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						<a href="/member/information?memberId=<sec:authentication property='principal.username'/>" class="btn btn-outline-warning me-2">My-Info</a>
						<form class="logout d-inline-block" action="/memberLogout" method="post">
							<button type="submit" onclick="logout()" class="btn btn-outline-light me-2">Logout</button>
						</form>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<a href="../member/register" class="btn btn-outline-info">Sign-up</a>
					</sec:authorize>
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
					</ul>
					
					<ul class="col-lg-3 border-end border-light mt-3 btn-group-vertical" id="mediumCategory" style="justify-content: flex-start;">
					</ul>
					
					<ul class="col-lg-3 border-end border-light mt-3 btn-group-vertical" id="smallCategory" style="justify-content: flex-start;">
					</ul>
					
					<ul class="col-lg-3 mt-3 btn-group-vertical" id="detailCategory" style="justify-content: flex-start;">
					</ul>
				</div>
			</div>
		</div>
	</header>