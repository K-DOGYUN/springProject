<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="includes/headerCategory.jsp" %>
	<div class="container" style="margin-top: 100px">
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
	<%@ include file="/WEB-INF/views/includes/headerCategoryJs.jsp" %>
</body>
</html>