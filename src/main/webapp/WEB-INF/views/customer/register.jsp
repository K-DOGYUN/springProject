<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
	<div class="container" style="margin-top: 100px">
		<div class="container">
			<h1 class="fs-1 text-center">Customer Registration</h1>
		</div>
		<form action="/customer/register" method="post" role="form">
			<div class="row">
				<div class="col-lg-6">
					<label for="customerId" class="form-label mt-2">Email</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="customerId" name="customerId" placeholder="Email address for ID"/>
						<label for="customerId">Email address for ID</label>
					</div>
					<label for="customerPw" class="form-label mt-2">Password</label>
					<div class="form-floating">
						<input type="password" class="form-control" id="customerPw" name="customerId" placeholder="Password"/>
						<label for="customerPw">Password</label>
					</div>
					<label for="pwConfirm" class="form-label mt-2">Password Confirm</label>
					<div class="form-floating">
						<input type="password" class="form-control" id="pwConfirm" name="pwConfirm" placeholder="Rewrite your password"/>
						<label for="pwConfirm">Rewrite your password</label>
					</div>
					<label for="customerName" class="form-label mt-2">Name</label>
					<div class="form-floating">
						<input type="text" class="form-control" id="customerName" name="customerName" placeholder="Name"/>
						<label for="customerName">Name</label>
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
							<input class="form-control" type="text" name="phone2" maxlength="4" id="phone3"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mt-2" id="addr">
					<button type="button" class="d-block btn btn-sm btn-dark m-auto" onclick="goPopup()">주소 추가</button>
					
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
       			
       			if (regEmail.test($("input[name='customerId']").val()) != true) {
       				alert("이메일 형식에 맞게 입력해 주세요");
       				$("input[name='customerId']").focus()
       				return false;
       			}//이메일 유효성 검사
       			if (regPW.test($("input[name='customerPw']").val()) != true) {
       				alert("비밀번호는 8자이상 그리고 영어 대문자, 소문자, 숫자가 각각 하나씩 들어가야 합니다.");
       				$("input[name='customerPw']").focus();
       				return false;
       			}//비밀번호 유효성 검사
       			if (regPhone.test($("input[name='phone2']").val()) != true) {
       				alert("휴대폰번호를 입력해주세요")
       				$("input[name='phone2']").focus();
       				return false;
       			} else if (regPhone.test($("input[name='phone3']").val()) != true) {
       				alert("휴대폰번호를 입력해주세요")
       				$("input[name='phone3']").focus();
       				return false;
       			}//휴대폰 번호 유효성 검사
       			
       			if ($("input[name='businessNo']").val() != "") {
        			if (regBNo.test($("input[name='businessNo']").val()) != true) {
        				alert("숫자 열자리를 정확하게 입력해주십시오. 사업자 번호가 없다면 공란으로 비워주십시오")
        				$("input[name='businessNo']").focus();
        				return false;
        			}     				
       			}//사업자 번호 유효성 검사
       			        			
       			var Phone = $("select[name='phone1']").val()
       				+ "-" + $("input[name='phone2']").val()
       				+ "-" + $("input[name='phone3']").val();
       			console.log(Phone);
       			var inputPhone = document.createElement("input");
       			inputPhone.setAttribute("type", "hidden");
       			inputPhone.setAttribute("name", "customerPhone");
       			inputPhone.setAttribute("value", Phone); 			
       			$("form[role='form']").append(inputPhone);
       			
       			$("form[role='form']").submit();
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
       		$("#addrContainer["+num+"]").remove();
       	}
       	
       	var addrCount = 0;
       	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			console.log(roadAddrPart1);
			console.log(roadAddrPart2);
			console.log(addrDetail);
			console.log(zipNo);
			
			var
   			
   			addrCount ++;
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