<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Modify Information</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-lg-8">
                		<div class="panel panel-default">
                			<div class="panel-heading">
                				Input Information
                			</div>
                			<div class="panel-body">
                				<div class="row">
                					<div class="col-lg-12">
                						<form role="form" method="post" action="/customer/correction">
                							<div class="form-group">
                								<label>ID</label>
                								<input class="form-control" type="text" name="customerId"
                								value="${customerId}" readonly="readonly"/>
                							</div>
                							<div class="form-group">
                								<label>pw</label>
                								<input class="form-control" type="password" name="customerPw"/>
                							</div>
                							<div class="form-group">
                								<label>pw confirm</label>
                								<input class="form-control" type="password" name="customerPwConfirm"/>
                							</div>
                							<div class="form-group">
                								<label>name</label>
                								<input class="form-control" type="text" name="customerName" value="${information.customerName}"/>
                							</div>
                							<div class="form-group row">
                								<div class="col-lg-12">
                									<label>phone number</label>
                								</div>
                								<div class="col-lg-4">
	                								<select class="form-control" name="phone1">
		                                                <option>010</option>
		                                                <option>011</option>
		                                                <option>016</option>
		                                                <option>017</option>
		                                                <option>019</option>
	                                            	</select>
                								</div>
                								<div class="col-lg-4">
	                                            	<input class="form-control" type="text" name="phone2" maxlength="4"
	                                            	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
	                                            	value="${information.customerPhone.split('-')[1]}"/>
                								</div>
                								<div class="col-lg-4">
	                                            	<input class="form-control" type="text" name="phone3" maxlength="4"
	                                            	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
	                                            	value="${information.customerPhone.split('-')[2]}"/>
                								</div>
                							</div>
                							<div class="form-group">
                								<label>business number</label>
                								<input class="form-control" type="text" name="businessNo" maxlength="10" value="${information.businessNo}"
                								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                							</div>
                							<button type="button" id="SubmitButton" class="btn btn-default">Submit</button>
                							<button type="reset" class="btn btn-default">Reset</button>
                						</form>
                					</div>
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
        		$("#SubmitButton").on("click", function(e) {
        			console.log("submit clicked");
        			//정규식
        			const regEmail = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/;//이메일
        			const regPW = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;//비밀번호 8자 이상 숫자,소문자,대문자 각1개이상포함
        			const regPhone = /[0-9]{4}/;
        			const regBNo = /[0-9]{10}/;

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
        			
        			if ($("input[name='businessNo']").val() !== null) {
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
        </script>
<%@ include file="../includes/footer.jsp" %>