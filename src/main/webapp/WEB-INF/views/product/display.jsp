<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../includes/header.jsp" %>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">${productVO.p_name}</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-lg-6">
                		<div class="panel panel-default">
                			<div class="tab-content">
                			</div>
                		</div>
                		<ul class="nav nav-pills">
                		</ul>
                	</div>
                	<div class="col-lg-4">
                		<div class="panel panel-default">
                			<div class="panel-heading">
                				${productVO.p_name}
                			</div>
                			<div class="panel-body">
                				<div class="list-group">
                					<span class="list-group-item">${productVO.p_price}원</span>
                					<span class="list-group-item">배송비 : ${productVO.deliv_fee}원</span>
                					<span class="list-group-item">제조사 : ${productVO.manufac_num}</span>
                					<span class="list-group-item">상태 : ${productVO.p_stat}</span>
                				</div>
                			</div>
                		</div>
                	</div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
        
		<script type="text/javascript">
			$(document).ready(function() {
				<c:forEach items="${imgList}" var="imgList">
					var list = document.createElement("li");
					var imgButton = document.createElement("a");
					var sImg = document.createElement("img");
					console.log("${imgList.img_num}");
					imgButton.setAttribute("href", "#"+"${imgList.img_num}");
					imgButton.setAttribute("data-toggle", "tab");
					sImg.setAttribute("src",
	        			"/showImage?path="
	        			+"${imgList.img_path}"
	        			+"/s_"
	        			+"${imgList.img_UUID}"
	        			+"_"
	        			+"${imgList.img_name}"
	        		);
					
					imgButton.append(sImg);
					list.append(imgButton);
					$(".nav.nav-pills").append(list);
				
	        		var imgContent = document.createElement("div");
	        		imgContent.setAttribute("class", "tab-pane fade");
	        		imgContent.setAttribute("id", "${imgList.img_num}");
	        		$(".tab-content").append(imgContent);
	        		
	        		var image = document.createElement("img");
	        		var path = "${imgList.img_path}".replace("\\","");
	        		image.setAttribute("src",
	        			"/showImage?path="
	        			+"${imgList.img_path}"
	        			+"/"
	        			+"${imgList.img_UUID}"
	        			+"_"
	        			+"${imgList.img_name}"
	        		);
	        		$("#"+"${imgList.img_num}").append(image)
	       		</c:forEach>
			});
		</script>
<%@ include file="../includes/footer.jsp"%>