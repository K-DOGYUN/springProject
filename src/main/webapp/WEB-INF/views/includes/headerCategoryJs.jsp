<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript">
        $(document).ready(function() {
        	<c:forEach items="${category}" var="category">
                <c:if test="${category.category_level == 1 }">
                	console.log("${category.category_name}");
                	var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0");
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.category_name}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#largeCategory").append(categoryLi);
                </c:if>
                <c:if test="${category.category_level == 2 }">
                	console.log("   ${category.category_name}");
                	var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 pNo-${category.parent_number}");
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.category_name}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#mediumCategory").append(categoryLi);
                </c:if>
                <c:if test="${category.category_level == 3 }">
                	console.log("      ${category.category_name}");
                	var category = document.createElement("li");
                	var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 pNo-${category.parent_number}");
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.category_name}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#smallCategory").append(categoryLi);
                </c:if>
                <c:if test="${category.category_level == 4 }">
                	console.log("         ${category.category_name}");
                	var categoryLi = document.createElement("li");
                	categoryLi.setAttribute("class", "list-group-item")
                	
                	var categoryA = document.createElement("a");
                	categoryA.setAttribute("href", "#");
                	categoryA.setAttribute("id", "${category.category_number}");
                	categoryA.setAttribute("class", "btn btn-outline-light btn-sm border-0 pNo-${category.parent_number}");
                	categoryA.setAttribute("style", "display: none;")
                	categoryA.append("${category.category_name}");
                	
                	categoryLi.append(categoryA);
                	
                	$("#detailCategory").append(categoryLi);
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