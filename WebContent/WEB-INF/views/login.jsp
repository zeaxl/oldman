<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Mobile Specific Metas
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Constra HTML Template v1.0">


<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/themefisher-font/themefisher-font-style.css">

<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">

<!-- Main Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<style type="text/css">
.errorMsg {
	color: red;
}

#logo {
	font-size: 40px;
}
</style>
<title>Login</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		var alertMsg = "${alertMsg}";
		if (alertMsg != "") {
			alert(alertMsg);
			$("#id").val("");
			$("#id").focus();
			$("#pw").val("");
		}
	});
</script>
<script>
	function loginCheck() {
		var id = $("#id").val().trim();
		if (id == "admin") {
			alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			$("#id").val("");
			$("#pw").val("");
			$("#id").focus();
			return;
		} else {
			$("#memberVO").submit();
		}
	}
	// 스페이스바 입력 방지
	function checkSpacebar() {
		var kcode = event.keyCode;
		if (kcode == 32)
			event.returnValue = false;
	}
</script>
</head>
<body>

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 id="logo"><a class="logo" href="/">KHERB</a></h2>

						<h2 class="text-center">Login</h2>
<form:form cssClass="text-left clearfix" method="POST" commandName="memberVO" action="login">
	<div class="form-group text-center">
		<label class="loginradio">
			<input type="radio"	name="mcode" value="S" checked>일반회원</label> &emsp; 
		<label class="loginradio">
			<input type="radio" name="mcode" value="D">사업자회원</label>
	</div>
	<div class="form-group">
		<i class="tf-ion-person"></i> ID <form:errors path="id" cssClass="errorMsg" />
		<form:input path="id" id="id" autofocus="autofocus" cssClass="form-control" 
			onkeydown="checkSpacebar()" placeholder="ID를 입력하세요" />
	</div>
	<div class="form-group">
		<i class="tf-ion-locked"></i> PW <form:errors path="pw" cssClass="errorMsg" />
		<form:input type="password" id="pw" path="pw" cssClass="form-control" 
			onkeydown="checkSpacebar()"	placeholder="비밀번호를 입력하세요" />
	</div>
</form:form>
	<div class="text-center">
		<button type="button" onclick="loginCheck()" class="btn btn-main text-center">Login</button>
	</div>
	<div class="text-center">&nbsp;</div>
	<div class="text-center">
		<a href="/idSearch">아이디 찾기</a> &emsp;|&emsp; <a href="/pwSearch">비밀번호 재설정</a>
	</div>
	<div class="text-center">&nbsp;</div>

	<!-- 네이버 로그인     -->
	<div class="text-center">
		<a href="${url }">
			<img width="180" height="45" src="${pageContext.request.contextPath}/resources/icon/naverLogin.png"
				alt="네이버로그인" title="네이버로그인" />
		</a>
	</div>
	<div class="text-center">&nbsp;</div>
	<!-- 카카오 로그인 -->
	<div class="text-center">
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=498e27eb054a07c095df9b6443e32aef&redirect_uri=http://localhost:8080/login/oauth_kakao&response_type=code">
			<img width="180" height="45" src="${pageContext.request.contextPath}/resources/icon/kakaoLogin.png"
				alt="카카오로그인" title="카카오로그인" />
		</a>
	</div>
	<p class="mt-20">아직 회원이 아니신가요?<a href="join"> 회원가입</a></p>
					
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>