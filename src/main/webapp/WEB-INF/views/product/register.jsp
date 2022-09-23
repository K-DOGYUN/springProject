<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Product Register</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
								상품정보 입력
	                        </div>
	                        <div class="panel-body">
	                            <div class="row">
                                    <form role="form" action="/product/register" method="post">
                                    	<div class="col-lg-6">
	                                    	<div class="form-group">
	                                           	<label>상품명</label>
	                                           	<input class="form-control" placeholder="상품명 입력" name="p_name">
	                                       	</div>
	                                        <div>
	                                        	<div class="">
	                                        		<label>카테고리 선택</label>
	                                        	</div>
												<div class="form-group col-lg-6">
													<label>대분류</label>
													<select class="form-control" id="large_category">
		                                                <option value="">-</option>
	                                            	</select>
												</div>
												<div class="form-group col-lg-6">
													<label>중분류</label>
													<select class="form-control" id="medium_category">
		                                                <option value="">-</option>
	                                            	</select>
												</div>
												<div class="form-group col-lg-6">
													<label>소분류</label>
													<select class="form-control" id="small_category">
		                                                <option value="">-</option>
	                                            	</select>
												</div>
												
												<div class="form-group col-lg-6">
													<label>세분류</label>
													<select class="form-control" id="detail_category" name="category_num">
		                                                <option value="">-</option>
	                                            	</select>
												</div>
	                                        </div>
											<div class="form-group">
	                                            <label>상태</label>
	                                            <label class="radio-inline">
	                                                <input type="radio" name="p_stat" id="optionsRadiosInline1" value="일반" checked>일반
	                                            </label>
	                                            <label class="radio-inline">
	                                                <input type="radio" name="p_stat" id="optionsRadiosInline2" value="중고">중고
	                                            </label>
	                                            <label class="radio-inline">
	                                                <input type="radio" name="p_stat" id="optionsRadiosInline3" value="재생">재생
	                                            </label>
	                                       	</div>
	                                    	<div class="form-group">
	                                    		<div class="">
	                                    			<label>제조사</label>
	                                    		</div>
	                                           	<input class="form-control" placeholder="제조사 입력" name="manufac_num">
	                                       	</div>
	                                    	<div class="form-group">
	                                           	<label>가격</label>
	                                           	<input class="form-control" placeholder="가격 입력(숫자만)" name="p_price">
	                                       	</div>
	                                    	<div class="form-group">
	                                           	<label>배송비</label>
	                                           	<input class="form-control" placeholder="배송비 입력(숫자만)" name="deliv_fee">
	                                       	</div>
	                                    	<div class="form-group">
	                                           	<label>재고수량</label>
	                                           	<input class="form-control" placeholder="재고 입력(숫자만)" name="p_stock">
	                                       	</div>
                                    	</div>
		                                <div class="col-lg-6" id="productImageRegister">
		                                	<div class="form-group">
	                                            <label>상품사진 등록</label>
	                                            <input type="file" id="productImage" name="productImage" multiple>
	                                            <button type="button" id="uploadBtn">Image upload</button>
	                                        </div>
	                                        <div id="thumnails">
	                                        </div>
		                                </div>
		                                <div class="col-lg-12">
		                                	<button type="submit" id="submitBtn" class="btn btn-default">Submit Button</button>
		                                </div>
                                    </form>
	                            </div>
	                            
	                        </div>
	                    </div>
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						//서브밋 버튼
						var formObj = $("form[role='form']");
						$("button[type='submit']").on("click", function(e) {
							console.log("submit clicked");
							e.preventDefault();
							imgArray.forEach(function(e, i) {
								console.log(i);
								console.log(e);
								for(var key in e) {
									var imgInform = document.createElement("input");
									imgInform.setAttribute("name", "imgList["+i+"]."+key);
									imgInform.setAttribute("value", e[key]);
									imgInform.setAttribute("class", "form-control");
									$("form[role='form']").append(imgInform);
								}
							});
							$("form[role='form']").submit();
						})
//						카테고리 옵션 생성
						<c:forEach items="${category}" var="category">
							<c:if test="${category.category_level == 1 }">
                    			$("#large_category").append(
                    				"<option value='${category.category_number}'>${category.category_name}</option>"
                    			);
                    		</c:if>
							<c:if test="${category.category_level == 2 }">
                    			$("#medium_category").append(
                    				"<option hidden class='${category.parent_number}' value='${category.category_number}'>${category.category_name}</option>"
                    			);
                    		</c:if>
							<c:if test="${category.category_level == 3 }">
                    			$("#small_category").append(
                    				"<option hidden class='${category.parent_number}' value='${category.category_number}'>${category.category_name}</option>"
                    			);
                    		</c:if>
							<c:if test="${category.category_level == 4 }">
                    			$("#detail_category").append(
                    				"<option hidden class='${category.parent_number}' value='${category.category_number}'>${category.category_name}</option>"
                    			);
                    		</c:if>
						</c:forEach>
//						카테고리 옵션 생성 끝
//						카테고리 디스플레이 전환
						$("#large_category").on("change", function() {
							$("#medium_category").children().css("display", "none");
							$("#medium_category").val("").prop("selected", true);
							$("#small_category").children().css("display", "none");
							$("#small_category").val("").prop("selected", true);
							$("#detail_category").children().css("display", "none");
							$("#detail_category").val("").prop("selected", true);
							var parent = $(this).find("option:selected").val();
							$("."+parent).css("display", "block");
						});
						$("#medium_category").on("change", function() {
							$("#small_category").children().css("display", "none");
							$("#small_category").val("").prop("selected", true);
							$("#detail_category").children().css("display", "none");
							$("#detail_category").val("").prop("selected", true);
							var parent = $(this).find("option:selected").val();
							$("."+parent).css("display", "block");
						});
						$("#small_category").on("change", function() {
							$("#detail_category").children().css("display", "none");
							$("#detail_category").val("").prop("selected", true);
							var parent = $(this).find("option:selected").val();
							$("."+parent).css("display", "block");
						});
//						카테고리 디스플레이 전환 끝
//						이미지 등록
						var regex = new RegExp("(.*?)\(jpg|gif|png)$");
						function imgCheck(fileName, fileSize) {
							if(fileSize >= 5242880) { //5M
								alert("파일 사이즈 초과");
								return false;
							}
							if(!regex.test(fileName)){
								alert("jpg, gif, png 형식의 파일만 등록 가능합니다.");
								return false;
							}
						}// imgCheck
						
						function showImage(result) {
							console.log("showImage")
							$(result).each(function(i, obj) {
								var callPath = encodeURIComponent(obj.imagePath + "/s_" + obj.imageUUID + "_" + obj.imageName);
								$("#thumnails").append(
									"<div><img src='/showImage?path="
									+ callPath
									+ "'><button type='button' class='deleteImage' data-image=\'"
									+ callPath
									+ "\'> x </button></div>"
								);
							});
						}
						
						var imgArray = new Array();
						$("input[type='file']").change(function(e){
							var formData = new FormData();
							var inputFile = $("input[name='productImage']");
							var files = inputFile[0].files;
							
							for(var i = 0; i< files.length; i++) {
								if(imgCheck(files[i].name, files[i].size) == false) {
									console.log("something wrong")
									return false;
								}								
								formData.append("uploadImage", files[i]);
							}
							
							$.ajax({
								url: '/imageUpload',
								processData: false,
								contentType: false,
								data: formData,
								type: 'POST',
								dataType: 'json',
								success: function(result) {
									console.log(result);
									result.forEach(function(e) {
										imgArray.push(e);
									})
									console.log(imgArray);
									showImage(result);
									$("#productImage").val("");
								}
							});
						});
// 					image delete
						$("#thumnails").on("click", "button", function(e) {
							console.log("delete");
							var count = $(this).closest("div").index()
							console.log(count)
							imgArray.splice(count, count);
							console.log(imgArray);
							var path = $(this).data("image");
							$(this).closest("div").remove();
							$.ajax({
								url: '/imageDelete',
								data: {path: path},
								dataType: 'text',
								type: 'POST',
								success: function(result){
									console.log(result);
								}
							});
						});
					//이미지 등록 끝
					});
					
				</script>
				<!-- form group -->
				
				
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
<%@ include file="../includes/footer.jsp"%>