<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/themefisher-font/themefisher-font-style.css">

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
 
<style type="text/css">
	.errorMsg {color:red;}
	#logo {font-size:40px;}
</style>
<title>비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
function pwCheck(){
	let name = $("#name").val();
	let id = $("#id").val();
	let email = $("#email").val();
	
	if(name==""){
		$("#name").focus();
	} else if(id==""){
		$("#id").focus();
	} else if(email==""){
		$("#email").focus();
	} else{
		$.ajax({
			asysc: true,
			url:"/pwSearch",
			type: 'post',
			data: {
				name : name,
				id : id,
				email : email
			},
			success:function(result){
				if(result>0){
					$("#pwSearch").empty();
					$("#pwSearch").append("<h3>임시 비밀번호가 이메일로 전송되었습니다.</h3><br>");
				} else {
					$("#pwSearch").empty();
					$("#pwSearch").append("<h3>아이디를 찾을 수 없습니다.</h3>" + "<br><br>");
				}
			},
			error:function(error){			
				alert("Ajax 동작 Error")
			}
		});
	
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

<body id="body">
 
<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <h2 id="logo"><a class="logo" href="/">KHERB</a></h2>
 <div id="pwSearch">
     <h2 class="text-center">비밀번호 재설정</h2>          
 

     <form class="text-left clearfix" method="POST" action="/pwSearch">     
            <div class="form-group">
              <i class="tf-ion-person"></i> 이름 
              <input name="name" id="name" autofocus="autofocus" class="form-control" 
              	onkeydown="checkSpacebar()" placeholder="이름을 입력하세요"/>
            </div>
             <div class="form-group">
              <i class="tf-ion-person"></i> 아이디 
              <input name="id" id="id" class="form-control" 
              	onkeydown="checkSpacebar()" placeholder="아이디를 입력하세요"/>
            </div>
            <div class="form-group">
              <i class="tf-ion-email"></i> 이메일 
              <input id="email" name="email" class="form-control" 
               	onkeydown="checkSpacebar()" placeholder="이메일을 입력하세요"/>
            </div>
  
            <div class="text-center">
     <button type="button" onclick="pwCheck()" class="btn btn-main text-center" >확인</button>
            </div>
      </form>      
   </div>
   
    <div class="text-center">
            <br> <a href="/login" >로그인하기</a>
            </div>
   
       </div>

</div>
      </div>
    </div>

</section>
   

 <jsp:include page="/footer.jsp"></jsp:include>
 
</body>
</html>