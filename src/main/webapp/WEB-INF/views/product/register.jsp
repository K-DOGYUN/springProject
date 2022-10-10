<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>
	<div class="container" style="margin-top: 100px">
		<div class="container">
			<h1 class="display-1">Product Registration</h1>
		</div>
		<form action="/product/register" method="post" role="form">
			<div class="row">
				<div class="col-lg-8" id="leftForm">
					<label for="productName" class="form-label mt-2">Product Name</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="productName" name="productName" placeholder="Product Name"/>
						<label for="productName">Product Name</label>
					</div> 

					<label for="productName" class="form-label mt-2">Seller Id</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="sellerNo" name="sellerNo" placeholder="Seller Id"
						readonly="readonly" value="<sec:authentication property='principal.username'/>"/>
						<label for="productName">Seller Id</label>
					</div> 

					<label for="manufacName" class="form-label mt-2">Manufacturer Name(제조사)</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="manufacName" name="manufacName" placeholder="Manufacturer Name(제조사)"/>
						<label for="manufacName">Manufacturer Name(제조사)</label>
					</div> 

					<label for="productStock" class="form-label mt-2">Stock(옵션 사용시 옵션의 재고수의 합계를 표시합니다)</label>
					<div class="form-floating mb-2">
						<input type="text" class="form-control" id="productStock" name="productStock" maxlength="10" placeholder="Stock(옵션 사용시 옵션의 재고수의 합계를 표시합니다)"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
						<label for="productStock">Stock(옵션 사용시 옵션의 재고수의 합계를 표시합니다)</label>
					</div>
					
					<div id="optionBtnBox">
						<button type="button" id="useOption" class="btn btn-sm btn-primary mt-2">옵션 사용</button>
						<button type="button" id="optionBtn" class="btn btn-sm btn-warning mt-2" style="display: none;">옵션 추가</button>
						<button type="button" id="unuseOption" class="btn btn-sm btn-danger mt-2" style="display: none;">옵션 사용 취소</button>
					</div>
					
					<label for="categoryNo" class="form-label mt-2">Select Category</label>
					<div class="d-flex mt-2 input-group mb-3">				
						<button type="button" class="btn btn-dark me-2" id="categoryMenuBtn">Category Menu</button>
						<button type="button" class="btn btn-outline-dark me-2" id="categoryName"></button>
						<input type="text" class="form-control" id="categoryNo" name="categoryNo" placeholder="Category Number"
						readonly="readonly"/>
					</div>
					<div class="d-flex">
						<div class="col-lg-11 mt-2 row border border-light rounded text-bg-dark" id="categoryMenu" style="display: none; width: 150%">
							
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

					<label for="productPrice" class="form-label mt-2">Price</label>
					<div class="form-floating mb-2">
						<input type="text" class="form-control" id="productPrice" name="productPrice" maxlength="10" placeholder="Price"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
						<label for="productPrice">Price</label>
					</div>
					
					<label for="deliveFee" class="form-label mt-2">Delivery Fee</label>
					<div class="form-floating mb-2">
						<input type="text" class="form-control" id="delivFee" name="delivFee" maxlength="10" placeholder="Delivery Fee"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
						<label for="deliveFee">Delivery Fee</label>
					</div>
					
				</div>
				<div class="col-lg-4 mt-2" id="img">
					<label for="imageUpload" class="form-label mt-2">Image Upload</label>
					<input type="file" class="form-control" id="imageUpload" name="imageUpload" placeholder="Image Upload" multiple="multiple">
					<div class="row" id="imgBox">
					</div>
					<button type="button" class="d-block btn btn-sm btn-dark m-auto" onclick="goPopup()">주소 추가</button>
					
				</div>
				<div class="col mt-2">
					<button type="submit" id="SubmitButton" class="btn btn-primary m-auto">Submit</button>
					<button type="reset" class="btn btn-danger m-auto">Reset</button>		
				</div>
			</div>
		</form>
	</div>
	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var optionCount = 0;
		$(document).ready(function() {
			$("#useOption").on("click", function() {
				console.log("use")
				$("#useOption").hide();
				$("#optionBtn").show();
				$("#unuseOption").show();
				$("#optionBtn").trigger("click");
				$("#productStock").attr("readonly", "readonly");
				$("#productStock").attr("value", "0");
				$("#productStock").val("0")
			});
			$("#unuseOption").on("click", function() {
				console.log("op")
				$("#useOption").show();
				$("#optionBtn").hide();
				$("#unuseOption").hide();
				$(".table-striped").remove();
				$("#productStock").removeAttr("readonly");
				$("#productStock").attr("value", "0");
				$("#productStock").val("0")
			});
			//-------option 토글--------
			$("#optionBtn").on("click", function() {
				var table = document.createElement("table");
				table.setAttribute("id", "optionBox"+optionCount);
				table.setAttribute("class", "table table-striped");
				
				var tbody = document.createElement("tbody");
				
				var tr = document.createElement("tr");
				tr.setAttribute("id", "optionNameBox");
				
				var td = document.createElement("td");
				td.setAttribute("class", "align-bottom");
				td.setAttribute("scope", "row");
				
				var label = document.createElement("label");
				label.setAttribute("class", "mb-2");
				label.setAttribute("style", "font-size: 15px");
				label.append("옵션명 (예 : 색상, 사이즈) : ");
				
				td.append(label);
				tr.append(td);
				
				var td = document.createElement("td");
				td.setAttribute("class", "align-bottom");
				td.setAttribute("colspan", "2");
				
				var input = document.createElement("input");
				input.setAttribute("type", "text");
				input.setAttribute("class", "form-control form-control-sm");
				input.setAttribute("id", "optionName"+optionCount);
				input.setAttribute("onchange", "nameChanged("+optionCount+")");
				input.setAttribute("placeholder", "옵션명 (예 : 색상, 사이즈) : ");
				
				td.append(input);
				tr.append(td);
				
				var td = document.createElement("td");
				td.setAttribute("class", "align-bottom");
				
				var button = document.createElement("button");
				button.setAttribute("class", "btn btn-sm btn-warning mt-2");
				button.setAttribute("type", "button");
				button.setAttribute("onclick", "optionDetailAdd("+optionCount+")");
				button.append("상세 추가");
				
				td.append(button);
				tr.append(td);
				tbody.append(tr);
				
				var tr = document.createElement("tr");
				tr.setAttribute("id", "optionDeleteBox"+optionCount);
				
				var td = document.createElement("td");
				td.setAttribute("colspan", "4");
				
				var button = document.createElement("button");
				button.setAttribute("class", "btn btn-sm btn-danger mt-2");
				button.setAttribute("type", "button");
				button.setAttribute("onclick", "optionDelete("+optionCount+")");
				button.append("옵션 삭제");
				
				td.append(button);
				tr.append(td);
				tbody.append(tr);
				table.append(tbody);
				
				$("#optionBtnBox").before(table);
				
				optionCount += 1;
			});
			//-------option 토글--------
			//-------create category--------
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
	        		//console.log("mediumCate : " + mediumCate);
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
	            	categoryA.setAttribute("onclick", "selectCate(${category.category_number},'${category.detail_category}')");
	            	categoryA.append("${category.detail_category}");
	            	
	            	categoryLi.append(categoryA);
	            	
	            	$("#detailCategory").append(categoryLi);
	        	}
        	</c:forEach>
        	//-------create category--------
        	//-------create toggle--------
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
        	//-------create toggle--------

			
			//서브밋 버튼
			$("button[type='submit']").on("click", function(e) {
				console.log("submit clicked");
				e.preventDefault();

				$("form[role='form']").submit();
			})

			//이미지 등록
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
			var imgCount = 0;
			function showImage(result) {
				console.log("showImage");
				console.log(result);
				$(result).each(function(i, obj) {
					console.log(obj);
					var callPath = encodeURIComponent(obj.imgPath + "/s_" + obj.imgUuid + "_" + obj.imgName);
					console.log(callPath);
					
					var box = document.createElement("div");
					box.setAttribute("class", "col-6");
					
					var div = document.createElement("div");
					
					var img = document.createElement("img");
					img.setAttribute("src", "/showImage?path="+callPath);
					
					var button = document.createElement("button");
					button.setAttribute("type", "button");
					button.setAttribute("class", "deleteImage btn btn-dark");
					button.setAttribute("data-image", "\\"+callPath+"\\");
					button.append("x");
					
					div.append(img);
					box.append(div);
					box.append(button);
					
					var input = document.createElement("input");
					input.setAttribute("type", "text");
					input.setAttribute("hidden", "hidden");
					input.setAttribute("name", "imgList["+imgCount+"].imgName");
					input.setAttribute("value", obj.imgName);
					box.append(input);
					
					var input = document.createElement("input");
					input.setAttribute("type", "text");
					input.setAttribute("hidden", "hidden");
					input.setAttribute("name", "imgList["+imgCount+"].imgPath");
					input.setAttribute("value", obj.imgPath);
					box.append(input);
					
					var input = document.createElement("input");
					input.setAttribute("type", "text");
					input.setAttribute("hidden", "hidden");
					input.setAttribute("name", "imgList["+imgCount+"].imgUuid");
					input.setAttribute("value", obj.imgUuid);
					box.append(input);
					
					$("#imgBox").append(box);
					imgCount += 1;
				});
			}
			
			$("input[type='file']").change(function(e){
				var formData = new FormData();
				var inputFile = $("input[name='imageUpload']");
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
						showImage(result);
						$("#imageUpload").val("");
					}
				});
			});
			// 					image delete
			$("#imgBox").on("click", "button", function(e) {
				console.log("delete");
				var count = $(this).closest("div").index()
				console.log(count)
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
		//-------option 삭제--------
		function optionDelete(e) {
			console.log("optionDelete : " + e);
			$("#optionBox"+e).remove();
			optionStockSum();
		}
		function deleteOptionDetial(e) {
			console.log("deleteOptionDetial : " + e);
			$("#optionDetailBox"+e).remove();
			optionStockSum();
		}
		//-------option 삭제--------
		var optionDetailCount = 0;
		//-------option 상세 추가--------
		function optionDetailAdd(e) {
			console.log("optionDetailAdd"+optionDetailCount)
			var tr = document.createElement("tr");
			tr.setAttribute("id", "optionDetailBox"+optionDetailCount)
			
			var td = document.createElement("td");
			td.setAttribute("class", "align-bottom");
			
			var input = document.createElement("input");
			input.setAttribute("class", "form-control form-control-sm");
			input.setAttribute("type", "text");
			input.setAttribute("id", "optionList["+optionDetailCount+"].optionDetail");
			input.setAttribute("name", "optionList["+optionDetailCount+"].optionDetail");
			input.setAttribute("placeholder", "옵션 상세(예 : 빨강, XL)");
			
			td.append(input);
			tr.append(td);
			
			var td = document.createElement("td");
			td.setAttribute("class", "align-bottom");
			
			var input = document.createElement("input");
			input.setAttribute("class", "form-control form-control-sm optionStock");
			input.setAttribute("type", "text");
			input.setAttribute("id", "optionList["+optionDetailCount+"].optionStock");
			input.setAttribute("name", "optionList["+optionDetailCount+"].optionStock");
			input.setAttribute("onchange", "optionStockSum()");
			input.setAttribute("placeholder", "옵션 재고");
			
			td.append(input);
			tr.append(td);
			
			var td = document.createElement("td");
			td.setAttribute("class", "align-bottom");
			
			var input = document.createElement("input");
			input.setAttribute("class", "form-control form-control-sm");
			input.setAttribute("type", "text");
			input.setAttribute("id", "optionList["+optionDetailCount+"].optionPrice");
			input.setAttribute("name", "optionList["+optionDetailCount+"].optionPrice");
			input.setAttribute("placeholder", "옵션 추가 가격");
			
			td.append(input);
			tr.append(td);

			var td = document.createElement("td");
			td.setAttribute("class", "align-bottom");
			
			var button = document.createElement("button");
			button.setAttribute("class", "btn btn-sm btn-danger mt-2");
			button.setAttribute("type", "button");
			button.setAttribute("onclick", "deleteOptionDetial("+optionDetailCount+")");
			button.append("삭제");
			
			var input = document.createElement("input");
			input.setAttribute("type", "text");
			input.setAttribute("class", "optionName"+e);
			input.setAttribute("style", "display: none;");
			input.setAttribute("id", "optionList["+optionDetailCount+"].optionName");
			input.setAttribute("name", "optionList["+optionDetailCount+"].optionName");
			input.setAttribute("value", $("#optionName"+e).val());
			
			td.append(button);
			td.append(input);
			tr.append(td);
			
			$("#optionDeleteBox"+e).before(tr);
			
			optionDetailCount += 1;
		}
		//-------option 상세 추가--------
		//-------optionName 변동 반영--------
		function nameChanged(e) {
			var changedVal = $("#optionName"+e).val();
			console.log("nameChanged "+e+" : "+changedVal);
			$(".optionName"+e).attr("value",changedVal);
			console.log("have to change : "+$(".optionName"+e).val());
		}

		//-------optionName 변동 반영--------
		//-------optionStock 변동 반영--------
		function optionStockSum() {
			console.log("option stock sum")
			var sum = 0;
			$("#productStock").attr("value", sum);
			$(".optionStock").each(function() {
				sum += $(this).val()*1;
				$("#productStock").attr("value", sum);
				$("#productStock").val(sum);
			});
			
		}
		//-------optionStock 변동 반영--------
		//-------category 선택--------
		function selectCate(e1, e2) {
			console.log("selectCate : " + e1)
			$("#categoryNo").attr("value", e1);
			$("#categoryName").append(e2);
			$("#categoryMenu > ul > li > a").hide();
    		$("#categoryMenu").hide();
		}
		//-------category 선택--------
	</script>
				<!-- form group -->
				
				
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

</body>
</html>