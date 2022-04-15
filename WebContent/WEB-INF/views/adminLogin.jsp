<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
*{margin:0; padding:0;}

.logo{
	padding-top:55px;
	
}
.logo a{
	font-size: 100px;
	color: #0275e9;
	font-weight: bold;
	text-decoration: none;
	text-decoration-line: none;	
}
.form-control{
	width: 70%;
	margin:auto;
	height :48px;
	border: solid 1px #dadada;
	background: white;
}


.container {
    flex-direction: colum;
    align-items: center;
}

.container .row{
	margin-top:120px;	
}

form {
    margin-top: 50px;
}

.text-center button{
	width: 70%;
	height :48px;
	font-weight: bold;
	font-size: 18px;
	background: #0275e9;
	color: white;
	border: solid 1px skyblue;
	cursor: pointer;
	text-decoration:none;
	
}
.text-center button:hover{
	color:white;
	background-color:#0275e9;
	border:none;
}

.row{
	width:50%;
	margin:auto;
}

a#signup{
	font-size:16px;
	color:#0275e9;
	text-decoration:none;
}

footer.container-fluid.text-center.formfooter {
    color: black;
    font-size:15px;
}


@media screen and ( max-width : 768px) {
	.logo{
		padding-top:30px;	
	}
	.logo a{
		font-size: 70px;
	}
	.container .row{
		width:70%;
		margin:auto;
		margin-top:60px;
	}
	a#signup{
		font-size:12px;
	}
	.form-group{
		width:100%;
	}
	.form-group p{
		font-size:12px;
	}
	.logo.text-center{
		height:120px;
	}
	.form-control{
		width:80%;
	}
	.text-center button{
		width: 80%;
		height :35px;	
	}
	hr{
		margin:10px 0;
	}	
	footer.container-fluid.text-center.formfooter {
    font-size:10px;
}
}

</style>

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
<title>관리자 로그인</title>
</head>
<body>
 
<div class="wrapper" >
	<div class="main-content">

   <div class="container">
        <div class="row">
			<div>
			<div>
					<div>
					 <h1 align="center">관리자 로그인</h1>
 <form:form  method="POST" commandName="memberVO" action="login">                                         
            
                           <div class="form-group">                              
  <form:input path="id" id="id" cssClass="form-control form-control-user" 
 	onkeydown="checkSpacebar()" autofocus="autofocus" placeholder="ID를 입력하세요" aria-describedby="emailHelp" />     
                           </div>
                           <div class="form-group">                              
  <form:input type="password" path="pw" id="pw" cssClass="form-control form-control-user" 
	onkeydown="checkSpacebar()" placeholder="비밀번호를 입력하세요"/>                                        
                           </div>
                         
                           <div class="text-center">
                         
                              <button type="button" onclick="loginCheck()" class="submit-button">관리자 로그인</button>                                                                                          
                           </div>
                       
                           <div class="">
                            &nbsp;
                           </div>
                                           
     </form:form>     
                 
				</div>
			</div>
		
			</div>
		</div>
      </div> 
       
       
   </div>
<footer class="container-fluid text-center formfooter">
            <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; KHerb, 2022<br><br>
                            박주영, 강승희, 이재준, 홍현택, 김도현, 김광한, 손종국</span>
                    </div>
                </div>
	</footer></div>
</body>