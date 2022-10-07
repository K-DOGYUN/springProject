<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<meta charset="utf-8">
<title>Login</title>
</head>

<body class="text-center">
	<main class="form-signin w-100 vh-100 bg-light">
			<form action="/login" method="post" class="m-auto position-relative" style="width: 350px; top: 30vh">
				<a href="main">
					<img src="/resources/img/ico_naver.png" alt="" />
				</a>
				<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

				<div class="form-floating">
					<input type="email" class="form-control" id="floatingInput"	placeholder="name@example.com" name="username"> 
					<label for="floatingInput">Email address</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
					<label for="floatingPassword">Password</label>
				</div>
				<div class="checkbox mb-3">
					<label class="	">
						<input type="checkbox" value="remember-me" name="remember-me">Remember me
					</label>
				</div>
				<button class="w-100 btn btn-lg btn-outline-primary" type="submit">Sign in</button>
			</form>
	</main>
</body>

</html>
