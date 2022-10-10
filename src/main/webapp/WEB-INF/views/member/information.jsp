<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
	<div class="container w-100" style="margin-top: 100px">
		<h1 class="display-1">Member Information</h1>
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-6">
				<dl class="row">
					<dt class="col-sm-4">Member Id</dt>
					<dd class="col-sm-8">${information.memberId}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Member Name</dt>
					<dd class="col-sm-8">${information.memberName}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Contact</dt>
					<dd class="col-sm-8">${information.memberPhone}</dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Registration Date</dt>
					<dd class="col-sm-8"><fmt:formatDate value='${information.memberReg}' pattern='yyyy.MM.dd HH:mm:ss'/></dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Update Date</dt>
					<dd class="col-sm-8"><fmt:formatDate value='${information.memberUpdate}' pattern='yyyy.MM.dd HH:mm:ss'/></dd>
				</dl>
				<dl class="row">
					<dt class="col-sm-4">Member Type</dt>
					<dd class="col-sm-8">${information.auth}</dd>
				</dl>
				<c:if test="${0 ne information.businessNo}">
					<dl class="row">
						<dt class="col-sm-4">Business Number</dt>
						<dd class="col-sm-8">${information.businessNo}</dd>
					</dl>
               	</c:if>
				<c:if test="${0 ne information.employeeNo}">
					<dl class="row">
						<dt class="col-sm-4">Empolyee Number</dt>
						<dd class="col-sm-8">${information.employeeNo}</dd>
					</dl>
               	</c:if>
				<a href="modify?<sec:authentication property='principal.username'/>" class="btn btn-dark btn-sm">정보 수정</a>
				<button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">계정 삭제</button>
			</div>
			<div class="col-lg-6" id="addrBox">
				<div class="container mb-5">
					<button class="btn btn-dark btn-sm float-end" onclick="goPopup()">새 주소 등록</button>
				</div>

			</div>
		</div>
	</div>
	<div class="modal" tabindex="-1" id="deleteModal" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete Account</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form action="">		
					<div class="modal-body">
						<div class="form-floating">
							<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="Password"/>
							<label for="memberPw">확인을 위한 비밀번호 입력</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" onclick="deleteMember()">Delete</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        	console.log('${information}');
        	console.log('${memberId}');
        	$(document).ready(function() {
        		<c:if test="${empty information}">
        			alert("존재하지 않는 회원입니다.");
        			location.href = "/main";
        		</c:if>
		        <c:forEach items="${information.addrList}" var="addrList" varStatus="stat">
	        		<c:if test="${not empty addrList.mainAddr}">
						var container = document.createElement("div");
						container.setAttribute("class", "container");
						container.setAttribute("id", "${addrList.addrNo}")
						
						var hr = document.createElement("hr");
						hr.setAttribute("class", "border border-dark");
						
						var dl = document.createElement("dl");
						dl.setAttribute("class", "row")
						
						var dt = document.createElement("dt");
						dt.setAttribute("class", "col-sm-4");
						dt.append("Main Address");
						
						var dd = document.createElement("dd");
						dd.setAttribute("class", "col-sm-8");
						dd.append("${addrList.mainAddr}");
						
						dl.append(dt);
						dl.append(dd);
						
						container.append(dl);
						
						var dl = document.createElement("dl");
						dl.setAttribute("class", "row")
						
						var dt = document.createElement("dt");
						dt.setAttribute("class", "col-sm-4");
						dt.append("Detail Address");
						
						var dd = document.createElement("dd");
						dd.setAttribute("class", "col-sm-8");
						dd.append("${addrList.detailAddr}");
						
						dl.append(dt);
						dl.append(dd);
						
						container.append(dl);
						
						var dl = document.createElement("dl");
						dl.setAttribute("class", "row")
						
						var dt = document.createElement("dt");
						dt.setAttribute("class", "col-sm-4");
						dt.append("Zip Code");
						
						var dd = document.createElement("dd");
						dd.setAttribute("class", "col-sm-8");
						dd.append("${addrList.zipNo}");
						
						dl.append(dt);
						dl.append(dd);
						
						container.append(dl);
						
						var btnBox = document.createElement("div");
						btnBox.setAttribute("class", "d-flex justify-content-center");
						
						var button = document.createElement("button");
						button.setAttribute("class", "btn btn-danger btn-sm");
						button.setAttribute("onclick", "addrDelete('${addrList.addrNo}')")
						button.append("삭제");
						
						btnBox.append(button)
						
						container.append(btnBox);
						container.append(hr);
						
						$("#addrBox").append(container);
	        		</c:if>
		        </c:forEach>
        	});
        	function addrDelete(e) {
        		console.log(e);
				$.ajax({
					url: '/address/delete',
					data: {addrNo: e},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						console.log(result);
						$("#"+e).remove();
					}
				});
        	}
        	
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
      					memberId : "${memberId}"
      				},
      				success : function(result) {
						var container = document.createElement("div");
						container.setAttribute("class", "container");
						container.setAttribute("id", result.addrNo)
						
						var hr = document.createElement("hr");
						hr.setAttribute("class", "border border-dark");
						
						var dl = document.createElement("dl");
						dl.setAttribute("class", "row")
						
						var dt = document.createElement("dt");
						dt.setAttribute("class", "col-sm-4");
						dt.append("Main Address");
						
						var dd = document.createElement("dd");
						dd.setAttribute("class", "col-sm-8");
						dd.append(result.mainAddr);
						
						dl.append(dt);
						dl.append(dd);
						
						container.append(dl);
						
						var dl = document.createElement("dl");
						dl.setAttribute("class", "row")
						
						var dt = document.createElement("dt");
						dt.setAttribute("class", "col-sm-4");
						dt.append("Detail Address");
						
						var dd = document.createElement("dd");
						dd.setAttribute("class", "col-sm-8");
						dd.append(result.detailAddr);
						
						dl.append(dt);
						dl.append(dd);
						
						container.append(dl);
						
						var dl = document.createElement("dl");
						dl.setAttribute("class", "row")
						
						var dt = document.createElement("dt");
						dt.setAttribute("class", "col-sm-4");
						dt.append("Zip Code");
						
						var dd = document.createElement("dd");
						dd.setAttribute("class", "col-sm-8");
						dd.append(result.zipNo);
						
						dl.append(dt);
						dl.append(dd);
						
						container.append(dl);
						
						var btnBox = document.createElement("div");
						btnBox.setAttribute("class", "d-flex justify-content-center");
						
						var button = document.createElement("button");
						button.setAttribute("class", "btn btn-danger btn-sm");
						button.setAttribute("onclick", "addrDelete('"+result.addrNo+"')")
						button.append("삭제");
						
						btnBox.append(button)
						
						container.append(btnBox);
						container.append(hr);
						
						$("#addrBox").append(container);
      				}
      			});
      		}

        	function deleteMember() {
        		$.ajax({
        			url : '/member/confirm',
        			data : {
        				memberId : "${information.memberId}",
        				memberPw : $("input[name='memberPw']").val()
        			},
        			dataType : 'text',
        			type : 'post',
        			success : function(result) {
        				console.log(result);
           				if (result === "same") {
           					$.ajax({
           						url : '/member/delete',
           						data : {memberId : "${information.memberId}"},
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
</body>
</html>