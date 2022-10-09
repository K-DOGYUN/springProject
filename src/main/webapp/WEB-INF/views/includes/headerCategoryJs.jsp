<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript">
		$(document).ready(function() {
			var largeCate = "";
			var largeCount = 0;
			var mediumCate = "";
			var mediumCount = 100;
			var smallCate = "";
			var smallCount = 1000;
			var detailCate = "";
			var detailCount = 10000;
			<c:forEach items="${category}" var="category">//카테고리 불러오기
            	if (largeCate != "${category.large_category}") {
            		largeCate = "${category.large_category}";
            		//console.log("largeCate : " + largeCate);
            		largeCount++;
            		
            		var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", largeCount);
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0");
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.large_category}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#largeCategory").append(categoryLi);
            	}
            	if (mediumCate != "${category.medium_category}") {
            		mediumCate = "${category.medium_category}";
            		console.log("mediumCate : " + mediumCate);
            		mediumCount++;
            		
            		var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", mediumCount);
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 pNo-"+largeCount);
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.medium_category}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#mediumCategory").append(categoryLi);
            	}
            	if (smallCate != "${category.small_category}") {
            		smallCate = "${category.small_category}";
            		//console.log("smallCate : " + smallCate);
            		smallCount++;
            		
            		var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", smallCount);
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 pNo-"+mediumCount);
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.small_category}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#smallCategory").append(categoryLi);
            	}
            	if (detailCate != "${category.detail_category}") {
            		detailCate = "${category.detail_category}";
            		//console.log("detailCate : " + detailCate);
            		detailCount++;
            		
            		var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", detailCount);
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 pNo-"+smallCount);
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.detail_category}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#detailCategory").append(categoryLi);
            	}
        	</c:forEach>//카테고리 불러오기
        	
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
            	console.log("mediumCategoryTouch");
            	$("#smallCategory > li > a").hide();
            	$("#detailCategory > li > a").hide();
            	var pNo = $(this).attr("id");
            	console.log(pNo);
            	$("#smallCategory > li > a.pNo-" + pNo).show();
            });
            $("#smallCategory > li > a").on("mouseover", function(e) {
            	console.log("smllCategoryTouch");
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
		})
	</script>