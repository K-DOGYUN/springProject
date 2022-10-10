<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
	<div class="container" style="margin-top: 100px">
		<div class="container">
			<h1 class="display-1">member Registration</h1>
		</div>
		<form action="/member/register" method="post" role="form">
			<div class="row">
				<div class="col-lg-6" id="leftForm">
					<label for="auth" class="form-label mt-2">Sign-in Type (가입할 유형을 선택하세요)</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="auth" id="customerAuth" value="ROLE_CUSTOMER" checked="checked">
							<label class="form-check-label" for="customerAuth">Customer</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="auth" id="sellerAuth" value="ROLE_SELLER">
							<label class="form-check-label" for="sellerAuth">Seller</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="auth" id="adminAuth" value="ROLE_ADMIN">
							<label class="form-check-label" for="adminAuth">Admin</label>
						</div>
					</div>
				
					<label for="memberId" class="form-label mt-2">Email</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="memberId" name="memberId" placeholder="Email address for ID"/>
						<label for="memberId">Email address for ID</label>
					</div> 
					<label for="memberPw" class="form-label mt-2">Password</label>
					<div class="form-floating">
						<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="Password"/>
						<label for="memberPw">Password (8자 이상, 숫자,소문자,대문자 각1개이상 포함되어야합니다.)</label>
					</div>
					<label for="pwConfirm" class="form-label mt-2">Password Confirm</label>
					<div class="form-floating">
						<input type="password" class="form-control" id="pwConfirm" placeholder="Rewrite your password"/>
						<label for="pwConfirm">Rewrite your password</label>
					</div>
					<label for="memberName" class="form-label mt-2">Name</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="memberName" name="memberName" placeholder="Name"/>
						<label for="memberName">Name</label>
					</div>
					
					<label for="Contact" class="form-label mt-2">Contact</label>
					<div class="row">
						<div class="col">
							<select class="form-select" aria-label="Default select example" name="phone1">
								<option>010</option>
		                        <option>011</option>
		                        <option>016</option>
		                        <option>017</option>
		                        <option>019</option>
							</select>
						</div>
						<div class="col">
							<input class="form-control" type="text" name="phone2" maxlength="4" id="phone2"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
						</div>
						<div class="col">
							<input class="form-control" type="text" name="phone3" maxlength="4" id="phone3"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
						</div>
					</div>
					
					<div id="bNoBox">
						<label for="businessNo" class="form-label mt-2">Business Number</label>
						<div class="form-floating">
							<input type="text" class="form-control" id="businessNo" name="businessNo" placeholder="Business Number"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
							<label for="businessNo">Business Number (아무숫자 10자를 입력해주세요)</label>
						</div>
					</div>
					
					<div id="empNoBox">
						<label for="employeeNo" class="form-label mt-2">employee Number</label>
						<div class="form-floating">
							<input type="text" class="form-control" id="employeeNo" name="employeeNo" placeholder="employee Number"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
							<label for="employeeNo">employee Number (아무숫자 10자를 입력해주세요)</label>
						</div>
					</div>
					

				</div>
				<div class="col-lg-6 mt-2" id="addr">
					<button type="button" class="d-block btn btn-sm btn-dark m-auto" onclick="goPopup()">주소 추가</button>
					
				</div>
				<div class="col mt-2">
					<button type="button" id="SubmitButton" class="btn btn-primary m-auto">Submit</button>
					<button type="reset" class="btn btn-danger m-auto">Reset</button>		
				</div>
			</div>
		</form>
	</div>
	<script src="/resources/js/jquery-3.6.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
   	<script type="text/javascript">
       	$(document).ready(function() {
       		$("#SubmitButton").on("click", function(e) {
       			console.log("submit clicked");
       			//정규식
       			const regEmail = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/;//이메일
       			const regPW = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;//비밀번호 8자 이상 숫자,소문자,대문자 각1개이상포함
       			const regPhone = /[0-9]{4}/;
       			const regBNo = /[0-9]{10}/;
       			
       			if (regEmail.test($("input[name='memberId']").val()) != true) {
       				alert("이메일 형식에 맞게 입력해 주세요");
       				$("input[name='memberId']").focus()
       				return false;
       			}//이메일 유효성 검사
       			if (regPW.test($("input[name='memberPw']").val()) != true) {
       				alert("비밀번호는 8자이상 그리고 영어 대문자, 소문자, 숫자가 각각 하나씩 들어가야 합니다.");
       				$("input[name='memberPw']").focus();
       				return false;
       			}//비밀번호 유효성 검사
       			if ($("input[name='memberPw']").val() != $("#pwConfirm").val()) {
       				alert("두 비밀번호가 일치하지 않습니다.");
       				$("input[name='pwConfirm']").focus();
       				return false;
       			}//비밀번호 확인
       			if (regPhone.test($("input[name='phone2']").val()) != true) {
       				alert("휴대폰번호를 입력해주세요")
       				$("input[name='phone2']").focus();
       				return false;
       			} else if (regPhone.test($("input[name='phone3']").val()) != true) {
       				alert("휴대폰번호를 입력해주세요")
       				$("input[name='phone3']").focus();
       				return false;
       			}//휴대폰 번호 유효성 검사
       			
       			if ($("input[name='businessNo']").val() != null) {
        			if (regBNo.test($("input[name='businessNo']").val()) != true) {
        				alert("숫자 열자리를 정확하게 입력해주십시오.")
        				$("input[name='businessNo']").focus();
        				return false;
        			}     				
       			}//사업자 번호 유효성 검사
       			if ($("input[name='employeeNo']").val() != null) {
        			if (regBNo.test($("input[name='employeeNo']").val()) != true) {
        				alert("숫자 열자리를 정확하게 입력해주십시오.")
        				$("input[name='employeeNo']").focus();
        				return false;
        			}     				
       			}//사원 번호 유효성검사
       			        			
       			var Phone = $("select[name='phone1']").val()
       				+ "-" + $("input[name='phone2']").val()
       				+ "-" + $("input[name='phone3']").val();
       			console.log(Phone);
       			var inputPhone = document.createElement("input");
       			inputPhone.setAttribute("type", "hidden");
       			inputPhone.setAttribute("name", "memberPhone");
       			inputPhone.setAttribute("value", Phone); 			
       			$("form[role='form']").append(inputPhone);
       			
       			$("form[role='form']").submit();
       		});
       		var bNoBox = $("#bNoBox").clone();
       		var empNoBox = $("#empNoBox").clone();
       		$("#bNoBox").remove();
       		$("#empNoBox").remove();
       		$("#customerAuth").change(function() {
           		$("#bNoBox").remove();
           		$("#empNoBox").remove();		
       		});
       		$("#sellerAuth").change(function() {
				$("#leftForm").append(bNoBox);		
				$("#empNoBox").remove();
       		});
       		$("#adminAuth").change(function() {		
				$("#leftForm").append(empNoBox);		
				$("#bNoBox").remove();			
       		});
       		
       	});
       	function goPopup(){
         		// 주소검색을 수행할 팝업 페이지를 호출합니다.
         		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
         		var pop = window.open("../includes/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
         		
         		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
         	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
        }
       	
       	function deleteAddr(num) {
       		console.log("deleteAddr : "+num);
       		$("#addrContainer"+num).remove();
       	}
       	
       	var addrCount = 0;
       	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			console.log(roadAddrPart1);
			console.log(roadAddrPart2);
			console.log(addrDetail);
			console.log(zipNo);
			
			var container = document.createElement("div");
			container.setAttribute("id","addrContainer"+addrCount);
			container.setAttribute("class", "container mt-2");
			
			var inputGroup = document.createElement("div");
			inputGroup.setAttribute("class", "input-group");
			
			var span = document.createElement("span");
			span.setAttribute("class", "input-group-text");
			span.append("주소");
			
			var input = document.createElement("input");
			input.setAttribute("class", "form-control");
			input.setAttribute("type", "text");
			input.setAttribute("name", "addrList["+addrCount+"].mainAddr");
			input.setAttribute("value", roadAddrPart1+" "+roadAddrPart2);
			
			var button = document.createElement("button");
			button.setAttribute("class", "btn btn-sm btn-dark");
			button.setAttribute("type", "button");
			button.setAttribute("onclick", "deleteAddr("+addrCount+")");
			button.append("삭제");
			
			inputGroup.append(span);
			inputGroup.append(input);
			inputGroup.append(button);
			
			container.append(inputGroup);
			
			var inputGroup = document.createElement("div");
			inputGroup.setAttribute("class", "input-group");
			
			var span = document.createElement("span");
			span.setAttribute("class", "input-group-text");
			span.append("상세주소");
			
			var input = document.createElement("input");
			input.setAttribute("class", "form-control");
			input.setAttribute("type", "text");
			input.setAttribute("name", "addrList["+addrCount+"].detailAddr");
			input.setAttribute("value", addrDetail);
			
			inputGroup.append(span);
			inputGroup.append(input);
			
			container.append(inputGroup);
			
			var inputGroup = document.createElement("div");
			inputGroup.setAttribute("class", "input-group");
			
			var span = document.createElement("span");
			span.setAttribute("class", "input-group-text");
			span.append("우편번호");
			
			var input = document.createElement("input");
			input.setAttribute("class", "form-control");
			input.setAttribute("type", "text");
			input.setAttribute("name", "addrList["+addrCount+"].zipNo");
			input.setAttribute("value", zipNo);
			
			inputGroup.append(span);
			inputGroup.append(input);
			
			container.append(inputGroup);
			
			$("#addr").append(container);
   			
   			addrCount += 1;
     	}
	</script>
</body>
</html>
<!--
					<div class="container mt-2">
						<div class="input-group">
							<span class="input-group-text">주소</span>
							<input type="text" class="form-control" />
							<button type="button" class="btn btn-sm btn-dark" onclick>삭제</button>
						</div>
						<div class="input-group">
							<span class="input-group-text">상세주소</span>
							<input type="text" class="form-control" />
						</div>
						<div class="input-group">
							<span class="input-group-text">우편번호</span>
							<input type="text" class="form-control" />
						</div>
					</div> 
-->