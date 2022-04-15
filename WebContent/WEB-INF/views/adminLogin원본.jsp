<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- Custom fonts for this template-->
  <link rel="stylesheet" href="<c:url value="/resources/AdminChart/vendor/fontawesome-free/css/all.min.css"/>" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
     <link rel="stylesheet" href="<c:url value="/resources/AdminChart/css/sb-admin-2.min.css"/>" />

 
<style type="text/css">
	.errorMsg {color:red;}
</style>

<title>관리자 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var alertMsg = "${alertMsg}";
	if(alertMsg!=""){
		alert(alertMsg);
		$("#id").val("");
		$("#id").focus();
		$("#pw").val("");
	}
});

</script>
<script>
function loginCheck(){
	var id= $("#id").val().trim();
	if (id!="admin"){
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		$("#id").val("");
		$("#pw").val("");
		$("#id").focus();
		return;
	} else{
		$("#memberVO").submit();
	}
}
</script>
<script>
// 스페이스바 입력 방지
function checkSpacebar(){
	var kcode=event.keyCode;
	if(kcode==32) event.returnValue=false;
}
</script>
</head>
<body class="bg-gradient-primary">

<div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">KHerb 관리자</h1>
                                    </div>
 <form:form cssClass="text-left clearfix user" method="POST" commandName="memberVO" action="login">                                         
                                    
                                        <div class="form-group">
 <form:input path="id" id="id" cssClass="form-control form-control-user" 
 	onkeydown="checkSpacebar()" autofocus="autofocus" placeholder="ID를 입력하세요" aria-describedby="emailHelp" />                                        
                                        </div>
                                        <div class="form-group">
<form:input type="password" path="pw" id="pw" cssClass="form-control form-control-user" 
	onkeydown="checkSpacebar()" placeholder="비밀번호를 입력하세요"/>                                        

                                        </div>
                                        <button type="button" onclick="loginCheck()" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
</form:form>                                      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

<!-- Bootstrap core JavaScript-->
    <script src="/resources/AdminChart/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/AdminChart/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/AdminChart/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/AdminChart/js/sb-admin-2.min.js"></script>



 
</body>
</html>