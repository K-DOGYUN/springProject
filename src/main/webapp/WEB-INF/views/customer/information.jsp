<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Member Information</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
               	<div class="col-lg-8">
               		<div class="panel panel-default">
               			<div class="panel-heading">
               				${information.customerName}님의 정보
               				<button type="button" class="btn btn-default btn-xs pull-right" onclick="openModal()">삭제하기</button>
               				<button type="button" class="btn btn-default btn-xs pull-right" onclick="modify()">수정하기</button>
               			</div>
               			<div class="panel-body">
               				<div class="list-group">
               					<span class="list-group-item">아이디 : ${customerId}</span>
               					<span class="list-group-item">이름 : ${information.customerName}</span>
               					<span class="list-group-item">휴대폰 번호 : ${information.customerPhone}</span>
               					<span class="list-group-item">가입일 : <fmt:formatDate value='${information.regDate}' pattern='yyyy.MM.dd HH:mm:ss'/></span>
               					<span class="list-group-item">최종 수정일 : <fmt:formatDate value='${information.updateDate}' pattern='yyyy.MM.dd HH:mm:ss'/></span>
               					<c:if test="${not empty information.businessNo}">
	               					<span class="list-group-item">사업자 번호 : ${information.businessNo}</span>
               					</c:if>
               				</div>
               			</div>
               		</div>
               		<div class="panel panel-default addr">
               			<div class="panel-heading">
               				주소
               				<button type="button" class="btn btn-default btn-xs pull-right" onclick="goPopup()">새 주소 등록</button>
               			</div>
               		</div>
               	</div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
        <!-- modal -->
		<div id="deleteModal" class="modal fade col-lg-6 col-lg-offset-3" role="dialong" tabindex="-1" aria-hidden="true"
			style="margin-top: 25%">
			<div class="modal-content">
				<div class="modal-header">
					<h4>계정삭제</h4>
				</div>
				<form role="form">
					<div class="modal-body">
						<div class="form-group">
							<label>계정을 삭제하기위해 비밀번호를 입력해주십시오.</label>
							<input class="form-control" type="password" name="customerPw"/>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm pull-right" onclick="closeModal()">닫기</button>
               			<button type="button" class="btn btn-default btn-sm pull-right" onclick="deleteCustomer()">삭제</button>
					</div>
				</form>
			</div>
		</div>
        <!-- modal -->
        <script type="text/javascript">
        	console.log('${information}');
        	console.log('${customerId}');
        	$(document).ready(function() {
        		<c:if test="${empty information}">
        			alert("존재하지 않는 회원입니다.");
        			location.href = "/main";
        		</c:if>
		        <c:forEach items="${information.addrList}" var="addrList" varStatus="stat">
	        		<c:if test="${not empty addrList.mainAddr}">
			        	var panelBody = document.createElement("div");
			        	panelBody.setAttribute("class", "panel-body ${addrList.addrNo}");
			        	
			        	var listGroup = document.createElement("div");
			        	listGroup.setAttribute("class", "list-group");
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("주소 : ${addrList.mainAddr}");
			        	
			        	var deleteButton = document.createElement("button");
			        	deleteButton.setAttribute("type", "button");
			        	deleteButton.setAttribute("class", "btn btn-default btn-xs pull-right");
			        	deleteButton.setAttribute("id", "${addrList.addrNo}");
			        	deleteButton.setAttribute("value", "${addrList.addrNo}");
			        	deleteButton.setAttribute("onclick", "addrDelete(${addrList.addrNo}.value)");
			        	deleteButton.append("삭제");
			        	item.append(deleteButton);
			        	
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("상세주소 : ${addrList.detailAddr}");
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("우편번호 : ${addrList.zipNo}");
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("등록일 : <fmt:formatDate value='${addrList.regDate}' pattern='yyyy.MM.dd HH:mm:ss'/>");
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("최종수정일 : <fmt:formatDate value='${addrList.updateDate}' pattern='yyyy.MM.dd HH:mm:ss'/>");
			        	listGroup.append(item);
			        	
			        	panelBody.append(listGroup);
			        	$(".addr").append(panelBody);
	        		</c:if>
		        </c:forEach>
        	});
        	function goPopup(){
          		// 주소검색을 수행할 팝업 페이지를 호출합니다.
          		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
          		var pop = window.open("../includes/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
          		
          		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
          	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
          	}
        	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
      			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      			console.log("jusoCallback");
      			$.ajax({
      				url : "/address/registration",
      				type : "post",
      				dataType : "json",
      				data : {
      					mainAddr : roadAddrPart1+roadAddrPart2,
      					detailAddr : addrDetail,
      					zipNo : zipNo,
      					customerId : "${customerId}"
      				},
      				success : function(result) {
      					console.log(result);
      					var a = result;
      					var panelBody = document.createElement("div");
			        	panelBody.setAttribute("class", "panel-body "+result.addrNo);
			        	
			        	var listGroup = document.createElement("div");
			        	listGroup.setAttribute("class", "list-group");
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("주소 : "+roadAddrPart1+roadAddrPart2);
			        	
			        	var deleteButton = document.createElement("button");
			        	deleteButton.setAttribute("type", "button");
			        	deleteButton.setAttribute("class", "btn btn-default btn-xs pull-right");
			        	deleteButton.setAttribute("id", result.addrNo);
			        	deleteButton.setAttribute("value", result.addrNo);
			        	deleteButton.setAttribute("onclick", "addrDelete("+result.addrNo+".value)");
			        	deleteButton.append("삭제");
			        	item.append(deleteButton);
			        	
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("상세주소 : "+addrDetail);
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append("우편번호 : "+zipNo);
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.setAttribute("class", "list-group-item");
			        	item.append(
			        		"등록일 : "
			        		+formatDate(result.regDate)
			        	);
			        	listGroup.append(item);
			        	
			        	var item = document.createElement("div");
			        	item.append(
			        		"최종수정일 : "
			        		+formatDate(result.updateDate)
			        	);
			        	item.setAttribute("class", "list-group-item");

			        	listGroup.append(item);
			        	
			        	panelBody.append(listGroup);
			        	$(".addr").append(panelBody);
      				}
      			});
      		}
        	function formatDate(date) {
        	    
        	    var d = new Date(date),
        	    
        	    month = '' + (d.getMonth() + 1) , 
        	    day = '' + d.getDate(), 
        	    year = d.getFullYear(),
        	    hour = d.getHours(),
        	    minute = d.getMinutes(),
        	    second = d.getSeconds();
        	    
        	    if (month.length < 2) month = '0' + month; 
        	    if (day.length < 2) day = '0' + day;
        	    if (hour.length < 2) hour = '0' + hour;
        	    if (minute.length < 2) minute = '0' + minute;
        	    if (second.length < 2) second = '0' + second;
        	    
        	    return [year, month, day].join('.') + " " + [hour, minute, second].join(":");
        	    
			}
        	function addrDelete(e) {
        		console.log(e);
				$.ajax({
					url: '/address/delete',
					data: {addrNo: e},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						console.log(result);
						$("div[class='panel-body "+e+"']").remove();
					}
				});
        	}
        	function modify() {
        		location.href="correction?customerId=${customerId}";
        	}
        	function openModal() {
        		$("#deleteModal").modal("show");
        	}
        	function closeModal() {
        		$("#deleteModal").modal("hide");
        	}
        	function deleteCustomer() {
        		$.ajax({
        			url : '/customer/confirm',
        			data : {customerId : "${customerId}",
        				customerPw : $("input[name='customerPw']").val()},
        			dataType : 'text',
        			type : 'post',
        			success : function(result) {
        				console.log(result);
        				if (result === "correct") {
        					$.ajax({
        						url : '/customer/delete',
        						data : {customerId : "${customerId}"},
        						dataType : 'text',
        						type : 'post',
        						success : function(result) {
        							alert(result);
        							location.href = "/main";
        						}
        					});
        				}
        			}
        		});
        	}
        </script>
<%@ include file="../includes/footer.jsp" %>