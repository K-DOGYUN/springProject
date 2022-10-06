<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">ALL</h1>
                        <sec:authorize access="isAnonymous()">
                        	<a href="/memberLogin">로그인</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        	<form class="logout" action="/memberLogout" method="post">
	                        	<a href="#" onclick="logout()"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        	</form>
                        	<script type="text/javascript">
                        		function logout() {
                        			$(".logout").submit();
                        		}
                        	</script>
                        </sec:authorize>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
<%@ include file="../includes/footer.jsp" %>