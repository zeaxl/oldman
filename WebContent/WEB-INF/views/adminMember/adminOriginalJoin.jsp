<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/images/favicon.png" />">

  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="<c:url value="/resources/themefisher-font-style.css"/>">

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="<c:url value="/resources/bootstrap.min.css"/>">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="<c:url value="/resources/style.css"/>">

  <!-- Animate css -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/animate/animate.css"/>">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/slick/slick.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/plugins/slick/slick-theme.css"/>">
  

<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-align: left;
}

ul.tabs li{
  display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current{
	display: inherit;
}

</style>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

    function sample4_execDaumPostcode_do(){
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
                
                document.getElementById('sample4_postcode_do').value = data.zonecode;
                document.getElementById("sample4_roadAddress_do").value = roadAddr;

            },
    		
    		onclose: function(state) {
    			
    	        //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
    	        if(state === 'FORCE_CLOSE'){
    	            //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

    	        } else if(state === 'COMPLETE_CLOSE'){
    	        	
    	        	console.log("도매 다음 우편 API 끝")
    	        	
    	        }
    	    }
    	            
        }).open();

    }
   
</script>
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
function idCheck(clicked_id){
	
	console.log(clicked_id);
	 if(clicked_id == 'soidCheck'){
		console.log("소매체크");
		var chkid="소매";
	 }else{
		console.log("도매체크");
		var chkid="도매";
	 }
	 	console.log(chkid);
	
	if (chkid =='소매'){
		var chkinput = $('#startingPoint').find('form:eq(3),input[id=soId]').val();
	}else{
		var chkinput = $('#startingPoint').find('form:eq(5),input[id=doId]').val();
	}
	alert(chkinput);
	if(chkid && (chkinput.trim().length != 0)){
	
		$.ajax({
			asysc: true,
			url:"/kherb/admin/mem/idCheck",
			type: 'post',
			data:chkinput,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
						success:function(result){
			if(result >0){
				alert("해당 아이디가 존재");
				$("#submit").attr("disabled","disabled");
				if(clicked_id=="soidCheck"){
					$("#soId").val("");
					$("#soId").focus();
					$('input:radio[id=somae]').prop('checked', 'this.checked');
					$("#soidCheckClicked").val("0");
				} else if(clicked_id=="doidCheck"){
					$("#doId").val("");
					$("#doId").focus();
					$('input:radio[id=domae]').prop('checked', 'this.checked');
					$("#doidCheckClicked").val("0");
				}
				
			//	window.location.reload();
			} else {
				alert("사용 가능 아이디");
				if(clicked_id=="soidCheck"){
					$("#soidCheckClicked").val("1");
				} else if(clicked_id=="doidCheck"){
					$("#doidCheckClicked").val("1");
				}
				$("#submit").removeAttr("disabled");
			}
			},
			error:function(error){			
				alert("Error 입니다.")
			}
		
			});
		
	}else{
			alert("아이디를 입력해주세요");
		}
}

// 도매 / 소매 달라서 클릭한 버튼에 따라 form 체크 해줘야할듯
function joinCheck(clicked_id){
	if(clicked_id=="soJoinBtn"){
		var idCheckResult = $("#soidCheckClicked").val();
		if( $("#soId").val()==""){
			$("#soId").focus();
		} else if(idCheckResult=="0"){
			alert("아이디 중복체크를 해주세요");
			return;
		} else if($("#sopw").val()==""){
			$("#sopw").focus();
			//$("form").submit();
		} else if($("#sopwChk").val()==""){
			$("#sopwChk").focus();
		} else if($("#soname").val()==""){
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
			alert("소매 가입");
			$("#soForm").submit();
		}
		
	} else if(clicked_id=="doJoinBtn"){
		var idCheckResult = $("#doidCheckClicked").val();
		if( $("#doId").val()==""){
			$("#doId").focus();
		} else if(idCheckResult=="0"){
			alert("아이디 중복체크를 해주세요");
			return;
		} else if($("#dopw").val()==""){
			$("#dopw").focus();
		} else if($("#dopwChk").val()==""){
			$("#dopwChk").focus();
		} else if($("#doname").val()==""){
			$("#doname").focus();
		} else if($("#doemail").val()==""){
			$("#doemail").focus();
		} else if($("#dohp").val()==""){
			$("#dohp").focus();
		} else if($("#dopostcode").val()==""){
			$("#dopostcode").focus();
		} else if($("#doaddr1").val()==""){
			$("#doaddr1").focus();
		} else if($("#doaddr2").val()==""){
			$("#doaddr2").focus();
		} else if($("#dosano").val()==""){
			$("#dosano").focus();
		} else if($("#fName").val()==""){
			alert("사업자등록증을 첨부해주세요");
		} else{
			alert("도매 가입");
			$("#doForm").submit();
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
	$("input[name=pw], input[name=pwChk]").change(function(){
		
		console.log('비밀번호 함수 준비 완료');	
		
		var chk_adminJoin=$('input:radio[name=adminJoin]:checked').val();

		if (chk_adminJoin =="소매"){
			var pw = $('#startingPoint').find('form:eq(3),input[id=sopw]').val();
			var pwChk = $('#startingPoint').find('form:eq(3),input[id=sopwChk]').val();
			
		}else{
			var pw = $('#startingPoint').find('form:eq(5),input[id=dopw]').val();
			var pwChk = $('#startingPoint').find('form:eq(5),input[id=dopwChk]').val();
		}
			
		console.log(pw);
		console.log(pwChk);
		
		if (chk_adminJoin =="소매"){	
			if (pw && pwChk != ""){
				
				if(pw != pwChk){
				$("input[name=pw]").val("");
				$("input[name=pwChk]").val("");
				
				$("#checkMessage_so").html("비밀번호가 일치 하지 않습니다.");
				$("#checkMessage_so").css("color","red");
				$("#checkMessage_so").css("font-weight","bold");
				$("#checkMessage_so").css("font-size","10px");
				
			}else{
				$("#checkMessage_so").html("비밀번호가 일치합니다.");
				$("#checkMessage_so").css("color","green");
				$("#checkMessage_so").css("font-weight","bold");
				$("#checkMessage_so").css("font-size","10px");
				}		
			}
		}
		else{//도매
			
			if (pw && pwChk != ""){
				
				if(pw != pwChk){
				$("input[name=pw]").val("");
				$("input[name=pwChk]").val("");
				
				$("#checkMessage_do").html("비밀번호가 일치 하지 않습니다.");
				$("#checkMessage_do").css("color","red");
				$("#checkMessage_do").css("font-weight","bold");
				$("#checkMessage_do").css("font-size","10px");
				
			}else{
				$("#checkMessage_do").html("비밀번호가 일치합니다.");
				$("#checkMessage_do").css("color","green");
				$("#checkMessage_do").css("font-weight","bold");
				$("#checkMessage_do").css("font-size","10px");
				}	
			  }
	        }  
 	     });
       });
</script>
<script type = "text/javascript">
function fileCheck(obj){
pathpoint = obj.value.lastIndexOf('.');
filepoint = obj.value.substring(pathpoint+1, obj.length);
fileName = obj.value.substring(12, obj.length);;
filetype = filepoint.toLowerCase();
if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'||
   filetype=='bmp'){
	document.getElementById('fName').value = fileName;
    console.log(fileName);
   
   }else{
   obj.outerHTML = obj.outerHTML;
   $('#imgCheck').modal({backdrop: 'static', keyboard: false});
   
   return false;
   }
   
   if(filetype=='bmp'){
   upload = $('#bmpCheck').modal({backdrop: 'static', keyboard: false});
	  
   if(upload){
	      
   }else
    obj.outerHTML = obj.outerHTML;  
   return false;
   }
   }
   </script>

   <script>
   //첨부 버튼 , hidden file 연동
$(document).ready(function(){
$("#imgbtn").on("click",function(){
	console.log("이미지 버튼");
	$("#la").click();
	})
});
</script>
<script>
   $(document).ready(function(){
	$('input:radio[id=somae]').prop('checked', 'this.checked');
  	$('#somaeForm').show();
	$('#domaeForm').hide();
	
	//도매, 소매 form 작성시 동작
	$("#soForm, #doForm").on("change", function() {

		var somaechk = $('input:radio[id=somae]').is(':checked');
		var domaechk = $('input:radio[id=domae]').is(':checked');
		var typeChk = $('input:radio[id=domae]:checked').is(':checked');

		if(somaechk){
			
		$('input:radio[id=domae]').on("click", function(){
		var deleteSomaeForm= confirm("소매: 기존에 작성하신 내용이 삭제됩니다.");
						
		if(deleteSomaeForm){
		$('input:radio[id=domae]').prop('checked', 'this.checked');
		$('#somaeForm').hide();
		$('#domaeForm').show();
		
		$("#soId").val("");
		$("#sopw").val("");
		$("#sopwChk").val("");
		$("#soname").val("");
		$("#soemail").val("");
		$("#sohp").val("");
		$("#sopostcode").val("");
		$("#soaddr1").val("");
		$("#soaddr2").val("");
		$("#sobirth").val("");
		$("#sample4_postcode_so").val("");
							}
				})		
			}			
		if(domaechk){
			console.log("도매가 체크");	
			$('input:radio[id=somae]').on("click", function(){
		var deleteDomaeForm= confirm("도매: 기존에 작성하신 내용이 삭제됩니다.");
				
		if(deleteDomaeForm){
		$('input:radio[id=somae]').prop('checked', 'this.checked');
		$('#somaeForm').show();
		$('#domaeForm').hide();
		$("#doId").val("");
		$("#dopw").val("");
		$("#dopwChk").val("");
		$("#doname").val("");
		$("#doemail").val("");
		$("#dohp").val("");
		$("#dopostcode").val("");
		$("#doaddr1").val("");
		$("#doaddr2").val("");
		$("#dosano").val("");
		$("#sample4_postcode_do").val("");
		$("#fName").val("");
		}		
			})
		}			
	})
  });
</script>
<script>
function setDisplay(){
    if($('input:radio[id=somae]').is(':checked')){
    	$('#somaeForm').show();
    	$('#domaeForm').hide();
    	
    
    } else if($('input:radio[id=domae]').is(':checked')){
    	
    	$('#somaeForm').hide();
    	$('#domaeForm').show();    
}
}
</script>

</head>

<body id="body">
						
<section class="signin-page account">
								
	<div class="container">
          
       <div class="row">
       <div class="col-md-6 col-md-offset-3">
       <div id="startingPoint"class="block text-center">

          <a class="logo" href="index.html">
          <img src="images/logo.png" alt="">
          </a>
          

	  <label><input type="radio" name="adminJoin" id="somae" value="소매" onchange="setDisplay()" > 소매</label>
	  <label><input type="radio" name="adminJoin" id="domae" value="도매" onchange="setDisplay()"> 도매</label>
      
	<div id="somaeForm">
<!-- 소매 -->          
         <h2 class="text-center">회원 가입(소매)</h2>
         <form:form action="join/so" id = "soForm" commandName ="memberVO" method="post">
		 <form:errors path="*" cssClass ="errorMsg" element="div"/>
		 <div class="form-group" >
		 <div style="float: left; width: 73%;">
         <form:input type="text" id="soId" class="form-control" name="id" onkeydown="checkSpacebar()" path="id" required="required" value="${so_memberVO.id}" 
         placeholder="아이디" autofocus = "autofocus" />
         </div>
         <div style="float: left; width: 27%;">
         <input type="button" value="중복체크"  class="btn btn-main text-center" id="soidCheck" onclick= "idCheck(this.id)" required="required">
	     <input type="hidden" value="0" id="soidCheckClicked" />
         </div> 
         </div>
             
         <div class="form-group" >
         <input type="password" class="form-control" id="sopw" name="pw" onkeydown="checkSpacebar()" required="required" placeholder="비밀번호" >
         <input type="password" class="form-control" id="sopwChk" name="pwChk"  onkeydown="checkSpacebar()" required="required" placeholder="비밀번호 확인">
         </div>
         <div class="form-group">
         <span id="checkMessage_so"></span>
         </div>
         <div class="form-group">
         <input type="text" name="name" class="form-control" id="soname" value="${so_memberVO.name}" required="required" placeholder="이름">
         <input type="text" name="email" class="form-control" id="soemail" value="${so_memberVO.email}" required="required" placeholder="이메일">
         <input type="text" name="hp" class="form-control" id="sohp" value="${so_memberVO.hp}" required="required" 
         	placeholder="hp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
         </div>
         <div class="form-group">
          <div style="float: left; width: 68%;">
         <input type="text" id="sample4_postcode_so" class="form-control" id="sopostcode" name="postcode" value="${so_memberVO.postcode}" 
         	placeholder="우편번호" oninput="this.value = this.fvalue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
          </div>
          <div style="float: left; width: 32%;">
         <input type="button" class="btn btn-main text-center" onclick="sample4_execDaumPostcode_so()" value="우편번호 찾기"><br>
         </div>
         </div>
         <div class="form-group">
         <input type="text"  id="sample4_roadAddress_so" class="form-control" id="soaddr1" name="addr1" value="${so_memberVO.addr1}" placeholder="도로명주소">
         <input type="text" name="addr2" class="form-control" id="soaddr2" value="${so_memberVO.addr2}" placeholder="상세주소">
         </div>
         <div style="display:none">Mcode: <input type="hidden" name="mcode" class="form-control" value="S" required="required"></div>  
         <div style="display:none">Pass: <input type="hidden" name="pass" class="form-control" value="T" required="required"></div>
         <div class="form-group">
         <input type="date" name="birth" class="form-control" max="<%=now %>" id="sobirth" value="${so_memberVO.birth}"required="required" placeholder="생년월일"> 
         </div>
         <div id = soSano style="display:none">사업자 등록번호: <input type="hidden" name="sano" class="form-control" value="개인(소매)" required="required"></div>
         <div class="form-group">
         <button type ="button" id="soJoinBtn" onclick="joinCheck(this.id)" class="btn btn-main text-center">회원가입</button> <button class="btn btn-main text-center" type ="reset">취소</button>
         </div>
         </form:form>
         </div>
 
 <!-- 도매 -->        
         <div id="domaeForm">             
         <h2 class="text-center">회원 가입(도매)</h2>
		 <form:form action="/kherb/join/do" id = "doForm" commandName ="memberVO" method="post" enctype="multipart/form-data">
		 <form:errors path="*" cssClass ="errorMsg" element="div"/>
		 
		 <div class="form-group" >
		 <div style="float: left; width: 73%;">
         <form:input type="text" id="doId" name="id" path="id" class="form-control id" onkeydown="checkSpacebar()" required="required" value="${do_memberVO.id}"
         placeholder="아이디" autofocus = "autofocus" />
         </div>
         <div style="float: left; width: 27%;">
         <input type="button" value="중복체크"  class="btn btn-main text-center" id="doidCheck" onclick= "idCheck(this.id)" required="required">
   	 <input type="hidden" value="0" id="doidCheckClicked" />
         </div> 
         </div>
             
         <div class="form-group" >
         <input type="password" class="form-control" id="dopw" name="pw" onkeydown="checkSpacebar()" required="required" placeholder="비밀번호" >
         <input type="password" class="form-control" id="dopwChk" name="pwChk" onkeydown="checkSpacebar()"  required="required" placeholder="비밀번호 확인">
         </div>
         <div class="form-group">
         <span id="checkMessage_do"></span>
         </div>
         <div class="form-group">
         <input type="text" name="name" class="form-control" id="doname" value="${do_memberVO.name}" required="required" placeholder="이름">
         <input type="text" name="email" class="form-control" id="doemail" value="${do_memberVO.email}" required="required" placeholder="이메일">
         <input type="text" name="hp" class="form-control" id="dohp" value="${do_memberVO.hp}" required="required" 
         	placeholder="hp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
         </div>
         <div class="form-group">
          <div style="float: left; width: 68%;">
         <input type="text" id="sample4_postcode_do" class="form-control" id="dopostcode" name="postcode" value="${do_memberVO.postcode}" 
         	placeholder="우편번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
          </div>
          <div style="float: left; width: 32%;">
         <input type="button" class="btn btn-main text-center" onclick="sample4_execDaumPostcode_do()" value="우편번호 찾기"><br>
         </div>
         </div>
         <div class="form-group">
         <input type="text"  id="sample4_roadAddress_do" class="form-control" id="doaddr1" name="addr1" value="${do_memberVO.addr1}" placeholder="도로명주소">
         <input type="text" name="addr2" class="form-control" id="doaddr2" value="${do_memberVO.addr2}" placeholder="상세주소">
         </div>
         <div style="display:none">Mcode: <input type="hidden" name="mcode" class="form-control" value="D" required="required"></div>  
         <div style="display:none">Pass: <input type="hidden" name="pass" class="form-control" value="F" required="required"></div>
         <div id = doBirth style="display:none">생년 월일:<input type="date" name="birth" value="2022-04-27"required="required"></div>
         <div class="form-group">
         <input type="text" name="sano" class="form-control" id="dosano" value="${do_memberVO.hp}" required="required" 
         	placeholder="사업자 등록번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
         </div>
         <div class="form-group">
         <div style="float: left; width: 78%;">
         <form:input type="text" path="mimg" class="form-control" value="${member.mimg}" id = "fName" readonly="true"  placeholder ="사업자 등록증"/>
         </div>
         <div style="float: left; width: 22%;">
         <label id = "la" for="img2"><input type = "button" class="btn btn-main text-center"   id = "imgbtn" value = "첨 부"/></label>
         <div style="display:none"><input type ="file" name="uploadFile" id = "img2" class="btn btn-main text-center" onchange = "fileCheck(this)" placeholder ="사업자 등록증">
         </div>
         </div>
         </div>
         <div class="form-group">
         <button type ="button" id="doJoinBtn" onclick="joinCheck(this.id)" class="btn btn-main text-center">회원가입</button> <button class="btn btn-main text-center" type ="reset">취소</button>
         </div>
         </form:form>
         
         </div>
 
 
         <p class="mt-20">Already hava an account ?<a href="login"> Login</a></p>
          <p><a href="forget-password.html"> Forgot your password?</a></p>
       
</div>
           </div>
      </div>
    </div>
</section>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    

<jsp:include page="/footer.jsp"></jsp:include>
  </body>
  </html>
</html>