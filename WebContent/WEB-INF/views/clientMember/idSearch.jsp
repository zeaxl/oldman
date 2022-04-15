<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/themefisher-font/themefisher-font-style.css">

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<style type="text/css">
.errorMsg {
	color: red;
}

#logo {
	font-size: 40px;
}
</style>
<title>아이디 찾기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	function idCheck() {
		let name = $("#name").val();
		let email = $("#email").val();

		if (name == "") {
			$("#name").focus();
		} else if (email == "") {
			$("#email").focus();
		} else {
			$.ajax({
				asysc : true,
				url : "/idSearch",
				type : 'post',
				data : {
					name : name,
					email : email
				},
				success : function(result) {
					if (result != "") {
						let originStr = result;
						let maskingStr;
						maskingStr = originStr.replace(/(?<=.{3})./gi, "*");

						$("#idSearch").empty();
						$("#idSearch")
								.append(
										"<h3>요청하신 아이디 찾기 결과는 다음과 같습니다.</h3><br>"
												+ "<h3>" + maskingStr
												+ "</h3><br><br>");
					} else {
						$("#idSearch").empty();
						$("#idSearch").append(
								"<h3>아이디를 찾을 수 없습니다.</h3>" + "<br><br>");
					}
				},
				error : function(error) {
					alert("Ajax 동작 Error")
				}
			});

		}
	}
</script>
<script>
	// 스페이스바 입력 방지
	function checkSpacebar() {
		var kcode = event.keyCode;
		if (kcode == 32)
			event.returnValue = false;
	}
</script>
</head>

<body id="body">

	<section class="signin-page account">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="block text-center">
						<h2 id="logo">
							<a class="logo" href="/">KHERB</a>
						</h2>
<div id="idSearch">
	<h2 class="text-center">아이디 찾기</h2>

<form class="text-left clearfix" method="POST" action="/idSearch">
	<div class="form-group">
		<i class="tf-ion-person"></i> 이름 <input name="name" id="name"
				autofocus="autofocus" class="form-control"
				onkeydown="checkSpacebar()" placeholder="이름을 입력하세요" />
	</div>
	<div class="form-group">
		<i class="tf-ion-email"></i> 이메일 <input id="email" name="email"
			class="form-control" onkeydown="checkSpacebar()"
			placeholder="이메일을 입력하세요" />
	</div>
	<div class="text-center">
		<button type="button" onclick="idCheck()"
			class="btn btn-main text-center">확인</button>
	</div>
</form>
</div>

	<div class="text-center">
		<br> <a href="/login">로그인하기</a> &emsp;|&emsp; <a href="/pwSearch">비밀번호
			재설정</a>
	</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	
<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>