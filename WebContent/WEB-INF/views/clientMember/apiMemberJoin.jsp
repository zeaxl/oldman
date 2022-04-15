<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="form" uri ="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

 <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가 입</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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


<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

    function sample4_execDaumPostcode_so(){
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
   			
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                document.getElementById('sample4_postcode_so').value = data.zonecode;
                document.getElementById("sample4_roadAddress_so").value = roadAddr;

            },
    		
    		onclose: function(state) {
    			
    	        //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
    	        if(state === 'FORCE_CLOSE'){
    	            //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

    	        } else if(state === 'COMPLETE_CLOSE'){
    	        	
    	        	console.log("소매 daum 우편 종료")
    	       
    	        }
    	    }
    	            
        }).open();

    }
</script>
<%
LocalDate now = LocalDate.now();
%>
<script>
function joinCheck(clicked_id){
	if(clicked_id=="soJoinBtn"){
		if($("#soname").val()==""){
			$("#soname").focus();
		} else if($("#soemail").val()==""){
			$("#soemail").focus();
		} else if($("#sohp").val()==""){
			$("#sohp").focus();
		} else if($("#sopostcode").val()==""){
			$("#sopostcode").focus();
		} else if($("#soaddr1").val()==""){
			$("#soaddr1").focus();
		} else if($("#soaddr2").val()==""){
			$("#soaddr2").focus();
		} else if($("#sobirth").val()==""){
			$("#sobirth").focus();
		} else{
			$("#soForm").submit();
		}
	}
}

//스페이스바 입력 방지
function checkSpacebar(){
	var kcode=event.keyCode;
	if(kcode==32) event.returnValue=false;
}
</script>

<script>
$(document).ready(function(){
	$("#soemail").attr("readonly", true);
/*	var sns = "${sns}";
	if(sns=="naver"){
		$("#sobirth").attr("readonly", true);
		$("#soname").attr("readonly", true);
		$("#sohp").attr("readonly", true);
	}*/
});

</script>


</head>

<body id="body">
						
<section class="signin-page account">
								
	<div class="container">
          
       <div class="row">
       <div class="col-md-6 col-md-offset-3">
       <div class="block text-center">

         
<!-- 소매 -->          
         <h2 class="text-center">회원 가입(소매)</h2>
       
    <form:form action="joinSNS" id = "soForm" commandName ="memberVO" method="post">
	<form:errors path="*" cssClass ="errorMsg" element="div"/>
	<div class="form-group" >
       	<input type="hidden" name="sns" value="${sns }" />
        <form:input type="hidden" id="soId" class="form-control"  value="${snsMember.email}" onkeydown="checkSpacebar()" path="id" required="required" 
         placeholder="아이디" />
        <input type="hidden" class="form-control" id="sopw" name="pw"  value="${snsMember.email}"onkeydown="checkSpacebar()" required="required" placeholder="비밀번호" >
    </div>
    <div class="form-group">
         <input type="text" name="name" class="form-control" id="soname" value="${snsMember.name}" required="required" autofocus = "autofocus" placeholder="이름">
         <input type="text" name="email" class="form-control" id="soemail" value="${snsMember.email}" required="required" placeholder="이메일">
         <input type="text" name="hp" class="form-control" id="sohp" value="${snsMember.hp}" required="required" 
         	placeholder="hp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
    </div>
    <div class="form-group">
          <div style="float: left; width: 68%;">
         <input type="text" id="sample4_postcode_so" class="form-control" id="sopostcode" name="postcode"
         	placeholder="우편번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
          </div>
          <div style="float: left; width: 32%;">
         <input type="button" class="btn btn-main text-center" onclick="sample4_execDaumPostcode_so()" value="우편번호 찾기"><br>
         </div>
         </div>
         <div class="form-group">
         <input type="text"  id="sample4_roadAddress_so" class="form-control" id="soaddr1" name="addr1" placeholder="도로명주소">
         <input type="text" name="addr2" class="form-control" id="soaddr2" placeholder="상세주소">
         </div>
         <div style="display:none">Mcode: <input type="text" name="mcode" class="form-control" value="S" required="required"></div>  
         <div style="display:none">Pass: <input type="text" name="pass" class="form-control" value="T" required="required"></div>
         <div class="form-group">
         <input type="date" name="birth" class="form-control" max="<%=now %>" id="sobirth" required="required" placeholder="생년월일"> 
         </div>
         <div id = soSano style="display:none">사업자 등록번호: <input type="text" name="sano" class="form-control" value="개인(소매)" required="required"></div>
         <input type="hidden" name="mimg" value="개인(소매)" />
         <div class="form-group">
         <button type ="button" id="soJoinBtn" onclick="joinCheck(this.id)" class="btn btn-main text-center">회원가입</button> 

    	 <button class="btn btn-main text-center" type ="button" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=498e27eb054a07c095df9b6443e32aef&logout_redirect_uri=http://localhost:8080/logout'">취소</button>
    	 
         </div>
         </form:form>
      
         </div>
 
 
       
</div>
           </div>
      </div>
</section>


<jsp:include page="/footer.jsp"></jsp:include>
  </body>
  </html>