<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="form" uri ="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
      <title>관리자 회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<meta charset="UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/AdminChart/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
     <link href="${pageContext.request.contextPath}/resources/AdminChart/css/sb-admin-2.min.css" rel="stylesheet">
     <style>
     @media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:12px;}}
     
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-align: left;
}
h2{
    font-weight: bold !important;
    transition: all 0.2s ease;
    margin-top: 15%;
    margin-botton:0%
    
}

#soForm #soIdTab .form-group{
 float: left;
}
#soForm #soIdTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#soForm #soIdTab .form-group:last-child{
 width: calc(25% - 2px);
}
#soForm #soIdTab .form-group .btn-main{
 padding: 14px 13%;
}
#soForm #soEmailTab .form-group{
 float: left;
}
#soForm #soEmailTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#soForm #soEmailTab .form-group:last-child{
 width: calc(25% - 2px);
}
#soForm #soEmailTab .form-group .btn-main{
 padding: 14px 13%;
}
#soForm #soPostcodeTab .form-group{
 float: left;
}
#soForm #soPostcodeTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#soForm #soPostcodeTab .form-group:last-child{
 width: calc(25% - 2px);
}
#soForm #soPostcodeTab .form-group .btn-main{
 padding: 14px 13%;
}



#doForm #doIdTab .form-group{
 float: left;
}
#doForm #doIdTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#doForm #doIdTab .form-group:last-child{
 width: calc(25% - 2px);
}
#doForm #doIdTab .form-group .btn-main{
 padding: 14px 13%;
}
#doForm #doEmailTab .form-group{
 float: left;
}
#doForm #doEmailTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#doForm #doEmailTab .form-group:last-child{
 width: calc(25% - 2px);
}
#doForm #doEmailTab .form-group .btn-main{
 padding: 14px 13%;
}
#doForm #doPostcodeTab .form-group{
 float: left;
}
#doForm #doPostcodeTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#doForm #doPostcodeTab .form-group:last-child{
 width: calc(25% - 2px);
}
#doForm #doPostcodeTab .form-group .btn-main{
 padding: 14px 13%;
}

#doForm #doSanoTab .form-group{
 float: left;
}
#doForm #doSanoTab .form-group:first-child{
 width: calc(75% - 2px);
 margin-right: 4px;
}
#doForm #doSanoTab .form-group:last-child{
 width: calc(25% - 2px);
}
#doForm #doSanoTab .form-group .btn-main{
 padding: 14px 15%;
}
ul.tabs li{
	
	width: calc(100%/2);
    height: 3.75rem;
    border-bottom: 3px solid #333333;
    background-color: #f8f8f8;
    line-height: 3.75rem;
    font-size: 1rem;
    text-align: center;
    color: #333333;
    display: block;
    float: left;
    text-align: center;
    font-weight: bold;
    transition: all 0.2s ease;
}

ul.tabs li.current{
    background-color: #4e73df;
    color: #fff;
    }

.tab-content{
    display: none;
	background: #f8f8f8;
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
    	        	$("#postCheckVal_do").val("1");
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
    	        	$("#postCheckVal_so").val("1");
    	        	console.log("소매 daum 우편 종료")
    	       
    	        }
    	    }
    	            
        }).open();

    }
</script>
<script>
//스페이스바 입력 방지
function checkSpacebar(){
	var kcode=event.keyCode;
	if(kcode==32) event.returnValue=false;
}
</script>
<script>
function idCheck(){
	
	var chkid = $('.tab-content.current').find('form:eq(2),input[name=id]').val();
	console.log("아이디 중복체크: " + chkid);
	var tabChk = $('.tab-content.current').find('form:eq(2),input[name=id]').attr('id');
	console.log(tabChk);
	if(chkid.search(/\s/) != -1){
	    console.log("아이디에 공백이 존재함");
} else{
	if(chkid.trim().length != 0){
		console.log("아이디 중복체크 ajax 실행");
		$.ajax({
			asysc: true,
			url:"/kherb/idCheck",
			type: 'post',
			data:chkid,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:function(result){
			if(result >0){
				$("#submit").attr("disabled","disabled");
				if(tabChk=="soId"){
					//$("#soId").val("");
					$("#soId").focus();
					$(".IdcheckMessage").html("이미 가입된 회원입니다.");
					$(".IdcheckMessage").css("color","red");
					$(".IdcheckMessage").css("font-weight","bold");
					$(".IdcheckMessage").css("font-size","10px");
					$("#soidCheckClicked").val("0");
					
				} else if(tabChk=="doId"){
					//$("#doId").val("");
					$("#doId").focus();
					$(".IdcheckMessage").html("*이미 가입된 회원입니다.");
					$(".IdcheckMessage").css("color","red");
					$(".IdcheckMessage").css("font-weight","bold");
					$(".IdcheckMessage").css("font-size","10px");
					$("#doidCheckClicked").val("0");
					
				}
			} else {
				if(tabChk=="soId"){
					$(".IdcheckMessage").html("*아이디 중복체크가 완료되었습니다.");
					$(".IdcheckMessage").css("color","green");
					$(".IdcheckMessage").css("font-weight","bold");
					$(".IdcheckMessage").css("font-size","10px");
					$("#soidCheckClicked").val("1");
				} else if(tabChk=="doId"){
					$(".IdcheckMessage").html("*아이디 중복체크가 완료되었습니다.");
					$(".IdcheckMessage").css("color","green");
					$(".IdcheckMessage").css("font-weight","bold");
					$(".IdcheckMessage").css("font-size","10px");
					$("#doidCheckClicked").val("1");
				}
				$("#submit").removeAttr("disabled");
			}
			},
			error:function(error){			
				alert("Ajax 동작 Error")
			}
			});
	}else{
			alert("아이디를 입력해주세요");
		}
	}
}
</script>
<script>
$(document).ready(function(){
	$("#dopw").on("propertychange change keyup paste input",function(){
	var dopwVal = $("#dopw").val();
	for( i = 0; i < dopwVal.length; i ++){
	var dopwValD = dopwVal.charAt(i);
	if(!(dopwValD >= '0' && dopwValD <= '9') && !(dopwValD >= 'a' && dopwValD <= 'z') && !(dopwValD >= 'A' && dopwValD <= 'Z')){
	// 특수기호 Filtering
     $(".pwcheckMessage").html("특수문자는 사용할 수 없습니다.");
	 $(".pwcheckMessage").css("color","red");
	 $(".pwcheckMessage").css("font-weight","bold");
	 $(".pwcheckMessage").css("font-size","10px");
	 $("#dopw").focus();
	 $("#pwCheckVal_Num_do").val("0");
	 $("#pwCheckVal_Eng_do").val("0");
	}
	if((dopwValD >= '0' && dopwValD <= '9')){
		//숫자가 하나가 있을 때
		console.log("숫자가 하나이상 존재");
		$("#pwCheckVal_Num_do").val("1");
	}
	if((dopwValD >= 'a' && dopwValD <= 'z')){
		//영문 소문자가 하나 존재
		console.log("영어 소문자 하나이상 존재");
		$("#pwCheckVal_Eng_do").val("1");
	}	
	if((dopwValD >= 'A' && dopwValD <= 'Z')){
		//영문 대문자 하나 존재
		console.log("영어 대문자 하나이상 존재");
		$("#pwCheckVal_Eng_do").val("1");
	}
	}
	})
	
		  $("#dopw").on("click", function(){
		 		
		  	$("#dopw").on("change", function(){
		  		
			 $("#pwCheckVal_Num_do").val("0");
			 $("#pwCheckVal_Eng_do").val("0");
			 
				var dopwVal = $("#dopw").val();
				for( i = 0; i < dopwVal.length; i ++){
				var dopwValD = dopwVal.charAt(i);
				if(!(dopwValD >= '0' && dopwValD <= '9') && !(dopwValD >= 'a' && dopwValD <= 'z') && !(dopwValD >= 'A' && dopwValD <= 'Z')){
				// 특수기호 Filtering
			     $(".pwcheckMessage").html("특수문자는 사용할 수 없습니다.");
				 $(".pwcheckMessage").css("color","red");
				 $(".pwcheckMessage").css("font-weight","bold");
				 $(".pwcheckMessage").css("font-size","10px");
				 $("#dopw").focus();
				 $("#pwCheckVal_Num_do").val("0");
				 $("#pwCheckVal_Eng_do").val("0");
				}
				if((dopwValD >= '0' && dopwValD <= '9')){
					//숫자가 하나가 있을 때
					console.log("숫자가 하나이상 존재");
					$("#pwCheckVal_Num_do").val("1");
				}
				if((dopwValD >= 'a' && dopwValD <= 'z')){
					//영문 소문자가 하나 존재
					console.log("영어 소문자 하나이상 존재");
					$("#pwCheckVal_Eng_do").val("1");
				}	
				if((dopwValD >= 'A' && dopwValD <= 'Z')){
					//영문 대문자 하나 존재
					console.log("영어 대문자 하나이상 존재");
					$("#pwCheckVal_Eng_do").val("1");
				}
			}

		})
	  })
	
		$("#sopw").on("propertychange change keyup paste input", function(){
			var sopwVal = $("#sopw").val();
			for( i = 0; i < sopwVal.length; i ++){
			var sopwValD = sopwVal.charAt(i);
			if(!(sopwValD >= '0' && sopwValD <= '9') && !(sopwValD >= 'a' && sopwValD <= 'z') && !(sopwValD >= 'A' && sopwValD <= 'Z')){
			// 특수기호 Filtering
		     $(".pwcheckMessage").html("특수문자는 사용할 수 없습니다.");
			 $(".pwcheckMessage").css("color","red");
			 $(".pwcheckMessage").css("font-weight","bold");
			 $(".pwcheckMessage").css("font-size","10px");
		//	 $("#sopw").val("");
			 $("#sopw").focus();
			 $("#pwCheckVal_Num_so").val("0");
			 $("#pwCheckVal_Eng_so").val("0");
			}
			if((sopwValD >= '0' && sopwValD <= '9')){
				//숫자가 하나가 있을 때
				console.log("숫자가 하나이상 존재");
				$("#pwCheckVal_Num_so").val("1");
			}
			if((sopwValD >= 'a' && sopwValD <= 'z')){
				//영문 소문자가 하나 존재
				console.log("영어 소문자 하나이상 존재");
				$("#pwCheckVal_Eng_so").val("1");
			}	
			if((sopwValD >= 'A' && sopwValD <= 'Z')){
				//영문 대문자 하나 존재
				console.log("영어 대문자 하나이상 존재");
				$("#pwCheckVal_Eng_so").val("1");
			}
		}
	  })// 소메 비밀번호
		
	  $("#sopw").on("click", function(){
		 		
		  	$("#sopw").on("change", function(){
		  		
			 $("#pwCheckVal_Num_so").val("0");
			 $("#pwCheckVal_Eng_so").val("0");
			 
				var sopwVal = $("#sopw").val();
				for( i = 0; i < sopwVal.length; i ++){
				var sopwValD = sopwVal.charAt(i);
				if(!(sopwValD >= '0' && sopwValD <= '9') && !(sopwValD >= 'a' && sopwValD <= 'z') && !(sopwValD >= 'A' && sopwValD <= 'Z')){
				// 특수기호 Filtering
			     $(".pwcheckMessage").html("특수문자는 사용할 수 없습니다.");
				 $(".pwcheckMessage").css("color","red");
				 $(".pwcheckMessage").css("font-weight","bold");
				 $(".pwcheckMessage").css("font-size","10px");
			//	 $("#sopw").val("");
				 $("#sopw").focus();
				 $("#pwCheckVal_Num_so").val("0");
				 $("#pwCheckVal_Eng_so").val("0");
				}
				if((sopwValD >= '0' && sopwValD <= '9')){
					//숫자가 하나가 있을 때
					console.log("숫자가 하나이상 존재");
					$("#pwCheckVal_Num_so").val("1");
				}
				if((sopwValD >= 'a' && sopwValD <= 'z')){
					//영문 소문자가 하나 존재
					console.log("영어 소문자 하나이상 존재");
					$("#pwCheckVal_Eng_so").val("1");
				}	
				if((sopwValD >= 'A' && sopwValD <= 'Z')){
					//영문 대문자 하나 존재
					console.log("영어 대문자 하나이상 존재");
					$("#pwCheckVal_Eng_so").val("1");
				}
			}

		})
	  })
			
			$("#doId").on("change",function(){
			var doIdVal = $("#doId").val();
			for( i = 0; i < doIdVal.length; i++){
				var doIdValD = doIdVal.charAt(i);
				if(!(doIdValD >= '0' && doIdValD <= '9') && !(doIdValD >= 'a' && doIdValD <= 'z') && !(doIdValD >= 'A' && doIdValD <= 'Z')){
				$("#idCheckVal_do").val("1");
				}
					}
			    if($("#idCheckVal_do").val() == "1"){
			    $(".IdcheckMessage").html("아이디는 숫자와 영문자로만 사용할 수있습니다.");
				$(".IdcheckMessage").css("color","red");
				$(".IdcheckMessage").css("font-weight","bold");
				$(".IdcheckMessage").css("font-size","10px");
				$("#doId").focus();
			//	$("#doId").val("");
				$("#idCheckVal_do").val("0");
				}
	/*		    else{
				$(".IdcheckMessage").html("사용가능한 아이디입니다.");
				$(".IdcheckMessage").css("color","green");
				$(".IdcheckMessage").css("font-weight","bold");
				$(".IdcheckMessage").css("font-size","10px");
									
				}//도매 아이디
	*/
	})
	
			$("#soId").on("change",function(){
			var soIdVal = $("#soId").val();
			for( i = 0; i < soIdVal.length; i++){
				var soIdValD = soIdVal.charAt(i);
				if(!(soIdValD >= '0' && soIdValD <= '9') && !(soIdValD >= 'a' && soIdValD <= 'z') && !(soIdValD >= 'A' && soIdValD <= 'Z')){
				$("#idCheckVal_so").val("1");
				}
					}
			    if($("#idCheckVal_so").val() == "1"){
			    $(".IdcheckMessage").html("아이디는 숫자와 영문자로만 사용할 수있습니다.");
				$(".IdcheckMessage").css("color","red");
				$(".IdcheckMessage").css("font-weight","bold");
				$(".IdcheckMessage").css("font-size","10px");
				$("#soId").focus();
				//$("#soId").val("");
				$("#idCheckVal_so").val("0");
				}
	/*		    else{
				$(".IdcheckMessage").html("사용가능한 아이디입니다.");
				$(".IdcheckMessage").css("color","green");
				$(".IdcheckMessage").css("font-weight","bold");
				$(".IdcheckMessage").css("font-size","10px");
									
				}//소매 아이디
		*/
	})
	
	$("#doemail").on("change",function(){
	//이메일 규격 체크	
	var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!regex.test($("#doemail").val())){
		$(".emailCheckMessage_val").html("이메일을 확인해주세요.");
		$(".emailCheckMessage_val").css("color","red");
		$(".emailCheckMessage_val").css("font-weight","bold");
		$(".emailCheckMessage_val").css("font-size","10px");
		
		$("#doemail").focus();
		$("#emailChkButton_do").attr("disabled","disabled");

	//	$("#doemail").val("");
	}
	else{
		$(".emailCheckMessage_val").html("이메일 입니다.");
		$(".emailCheckMessage_val").css("color","green");
		$(".emailCheckMessage_val").css("font-weight","bold");
		$(".emailCheckMessage_val").css("font-size","10px");	
		$("#emailChkButton_do").removeAttr("disabled");
		
	}
	}) //소매 이메일

	$("#soemail").on("change",function(){
		//이메일 규격 체크	
		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!regex.test($("#soemail").val())){
			$(".emailCheckMessage_val").html("이메일을 확인해주세요.");
			$(".emailCheckMessage_val").css("color","red");
			$(".emailCheckMessage_val").css("font-weight","bold");
			$(".emailCheckMessage_val").css("font-size","10px");
			
			$("#soemail").focus();
			$("#emailChkButton_so").attr("disabled","disabled");
	//		$("#soemail").val("");
		}
		else{
			$(".emailCheckMessage_val").html("이메일 입니다.");
			$(".emailCheckMessage_val").css("color","green");
			$(".emailCheckMessage_val").css("font-weight","bold");
			$(".emailCheckMessage_val").css("font-size","10px");	
			$("#emailChkButton_so").removeAttr("disabled");
		}
		})	
	
});
</script>
<script>
$(document).ready(function(){
	$("input[name=pw], input[name=pwChk]").on("change",function(){
		var pw = $('.tab-content.current').find('form:eq(2),input[name=pw]').val();
		var pwChk = $('.tab-content.current').find('form:eq(2),input[name=pwChk]').val();
		var tabChk = $('.tab-content.current').find('form:eq(2),input[name=id]').attr('id');
		console.log(pw);
		console.log(pwChk);
	
		if(tabChk=="soId"){
		if(!($("#pwCheckVal_Num_so").val()=="1") || !($("#pwCheckVal_Eng_so").val()=="1")){
		$(".pwcheckMessage").html("비밀번호는 영문 대소문자와 숫자를 포함해야만 합니다.");
		$(".pwcheckMessage").css("color","red");
		$(".pwcheckMessage").css("font-weight","bold");
		$(".pwcheckMessage").css("font-size","10px");
		$("#pwCheckVal_Num_so").val("0");
		$("#pwCheckVal_Eng_so").val("0");
		$("#sopw").focus();
		$("#sopwChk").val("");
		} 	
		if (pw && pwChk != ""){
		if (pw != pwChk){
		$(".pwcheckMessage").html("비밀번호를 다시 한번 확인해주세요.");
		$(".pwcheckMessage").css("color","red");
		$(".pwcheckMessage").css("font-weight","bold");
		$(".pwcheckMessage").css("font-size","10px");
		$("#pwCheckVal_Num_so").val("0");
	 	$("#pwCheckVal_Eng_so").val("0");
	 	$("#sopwChk").val("");
	 	$("#sopw").focus();
		$("#soJoinBtn").attr("disabled","disabled");
		}else if(($("#pwCheckVal_Eng_so").val() =="1" && $("#pwCheckVal_Num_so").val() == "1") && pw == pwChk) {
		$(".pwcheckMessage").html("비밀번호가 일치합니다.");
		$(".pwcheckMessage").css("color","green");
		$(".pwcheckMessage").css("font-weight","bold");
		$(".pwcheckMessage").css("font-size","10px");
		$("#pwCheckVal_Num_so").val("1");
	 	$("#pwCheckVal_Eng_so").val("1");
		$("#soJoinBtn").removeAttr("disabled","disabled");
		}
		}
	}// 소매 비번 Chk 
	
	else{//도매
		if(!($("#pwCheckVal_Num_do").val()=="1") || !($("#pwCheckVal_Eng_do").val()=="1")){
		 	$(".pwcheckMessage").html("비밀번호는 영문 대소문자와 숫자를 포함해야만 합니다.");
			$(".pwcheckMessage").css("color","red");
			$(".pwcheckMessage").css("font-weight","bold");
			$(".pwcheckMessage").css("font-size","10px");
		 	$("#pwCheckVal_Num_do").val("0");
		 	$("#pwCheckVal_Eng_do").val("0");
		 	$("#dopw").focus();
		 	$("#dopwChk").val("");
		} 
		if (pw && pwChk != ""){		
		if(pw != pwChk){
		$(".pwcheckMessage").html("비밀번호가 일치 하지 않습니다.");
		$(".pwcheckMessage").css("color","red");
		$(".pwcheckMessage").css("font-weight","bold");
		$(".pwcheckMessage").css("font-size","10px");
		$("#dopwChk").val("");
	 	$("#dopw").focus();
		$("#pwCheckVal_Num_do").val("0");
	 	$("#pwCheckVal_Eng_do").val("0");
		}else if((($("#pwCheckVal_Num_do").val()=="1") || ($("#pwCheckVal_Eng_do").val()=="1")) && pw == pwChk ){
		$(".pwcheckMessage").html("비밀번호가 일치합니다.");
		$(".pwcheckMessage").css("color","green");
		$(".pwcheckMessage").css("font-weight","bold");
		$(".pwcheckMessage").css("font-size","10px");
		}			
		}
	}// 도매 비번 Chk 
   })   
});
</script>
<script type = "text/javascript">
function fileCheck(obj){
	//change Action 일때 
	pathpoint = obj.value.lastIndexOf('.');
	filepoint = obj.value.substring(pathpoint+1, obj.length);
	fileName = obj.value.substring(12, obj.length);;
	filetype = filepoint.toLowerCase();
	//이미지 파일 일 때 파일 업로드
	if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'||
   	filetype=='bmp'){
		document.getElementById('fName').value = fileName;
    	console.log(fileName);
   	}else{
	//이미지 파일이 아닐 때, 파일 업로드 실패
   		obj.outerHTML = obj.outerHTML;
   		alert("이미지 파일만 업로드 가능합니다.");
   return false;
   }   
   }
</script>
<script>
// 이미지 버튼, input text 연동해주는 기능
$(document).ready(function(){
	$("#imgbtn").on("click",function(){
		console.log("이미지 버튼");
		$("#la").click();
})
});
</script>
<script>
//회원단 진입 시, 자동으로 Tab 선택하는 기능
$(document).ready(function(){
	$("#first").addClass("current");
	$("#tab-1").addClass("current");
	
	$('ul.tabs li').click(function(){
		 var tab_id = $(this).attr('data-tab');
        // tab_id 는 클릭한 탭(li)의  data-tab 속성 = tab_id
		// tab_id 한 부분을 기준으로 
        $('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});
</script>
<script>
function emailAuthfun(){
	var chkEmail = $('.tab-content.current').find('form:eq(2),input[name=email]').val();
	//이메일 단에 입력한 Text 값
	console.log(chkEmail);
	// 이메일 형식 테스트 추가
	if(chkEmail.search(/\s/) != -1){
	//이메일에 공백이 존재	
	console.log("이메일에 공백이 존재함");
	} else{
	if(chkEmail.trim().length != 0){
	console.log("이메일 인증 ajax 실행");
		$.ajax({
			asysc: true,
			url:"/kherb/emailAuth",
			type: 'post',
			data: chkEmail,
			dataType:"text",
			contentType:"application/json; charset=UTF-8",
			success:function(key){
				if(key =="alJoin"){
				alert("해당 이메일은 이미 가입되었습니다.");
				$('.tab-content.current').find('form:eq(2),input[name=email]').val("");
				$("#submit").attr("disabled","disabled");
				} else {
				alert("이메일 번호가 발송 되었습니다.");
		        $('.tab-content.current').find('form:eq(2),input[name=emailAuthChk]').val(key);
		       
				}
				},
				error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
}
			});
		}else{
			alert("이메일을 입력해주세요");
		}
	}
}
</script>
<script>
//이메일 인증번호 / 회원입력 이메일 인증번호 비교
$(document).ready(function(){

$("input[name=emailAuth]").keyup(function(){
	var emailAuthChk =  $('.tab-content.current').find('form:eq(2),input[name=emailAuthChk]').val();
	var emailAuth =$('.tab-content.current').find('form:eq(2),input[name=emailAuth]').val();
	console.log("이메일 인증번호 : "+ emailAuthChk 
				+ "이메일 인증번호(고객) :" + emailAuth );
	if(emailAuth !="" ){
	if (emailAuth != emailAuthChk){
		//이메일 인증 번호가 다를 때	
	//	$("input[name=emailAuth]").val("");
		$("input[name=emailAuth]").focus();
		$(".emailCheckMessage").html("인증번호가 일치하지 않습니다.");
		$(".emailCheckMessage").css("color","red");
		$(".emailCheckMessage").css("font-weight","bold");
		$(".emailCheckMessage").css("font-size","10px");
		}	
	else{
		//이메일 번호가 같을 때 
		$(".emailCheckMessage").html("인증번호가 일치합니다.");
		$(".emailCheckMessage").css("color","green");
		$(".emailCheckMessage").css("font-weight","bold");
		$(".emailCheckMessage").css("font-size","10px");
		}
	}
})

});
</script>
<script>
//tab 클릭 했을 때, 이전 데이터 삭제
$(document).ready(function(){

	//alert(tabChk);
	//doId, soId		
	$('ul.tabs li').click(function(){
	var tabChk = $('.tab-content.current').find('form:eq(2),input[name=id]').attr('id');
		
	if(tabChk == "soId"){
	var deleteSomaeForm= confirm("기존에 작성하신 내용이 삭제됩니다.");
	if(deleteSomaeForm){
		$("#soId").val("");
		$("#sopw").val("");
		$("#sopwChk").val("");
		$("#soname").val("");
		$("#soemail").val("");
		$("#soemailAuth").val("");
		$("#soemailAuthChk").val("");
		$("#sohp").val("");
		$("#sopostcode").val("");
		$("#sample4_postcode_so").val("");
		$("#sample4_roadAddress_so").val("");
		$("#soaddr1").val("");
		$("#sobirth").val("");
		$(".IdcheckMessage").html("");
		$(".emailCheckMessage").html("");		
		$(".emailCheckMessage_val").html("");		
		$(".pwcheckMessage").html("");
		$("#idCheckVal_so").val("0");
		$("#pwCheckVal_Eng_so").val("0");
		$("#pwCheckVal_Num_so").val("0");
		$("#postCheckVal_so").val("0");
	}	
	}else{
	var deleteDomaeForm= confirm("기존에 작성하신 내용이 삭제됩니다.");
	if(deleteDomaeForm)	{
		$("#doId").val("");
		$("#dopw").val("");
		$("#dopwChk").val("");
		$("#doname").val("");
		$("#doemail").val("");
		$("#doemailAuth").val("");
		$("#doemailAuthChk").val("");
		$("#dohp").val("");
		$("#dopostcode").val("");
		$("#sample4_postcode_do").val("");
		$("#sample4_roadAddress_do").val("");
		$("#doaddr1").val("");
		$("#dosano").val("");
		$("#fName").html("");
		$(".IdcheckMessage").html("");
		$(".emailCheckMessage").html("");		
		$(".emailCheckMessage_val").html("");		
		$(".pwcheckMessage").html("");
		$(".sanoCheckMessage").html("");
		$("#idCheckVal_do").val("0");
		$("#pwCheckVal_Eng_do").val("0");
		$("#pwCheckVal_Num_do").val("0");
		$("#postCheckVal_do").val("0");
	}
	}		
	})
	
});	
</script>
<script>
//도매 / 소매 달라서 클릭한 버튼에 따라 form 체크 해줘야할듯
function joinCheck(clicked_id){
	if(clicked_id=="soJoinBtn"){
		var idCheckResult = $("#soidCheckClicked").val();
		if( $("#soId").val()==""){
			$("#soId").focus();
		}else if(idCheckResult=="0"){
		 alert("아이디 중복체크를 해주세요");
		 return;
		}else if($("#sopw").val()==""){
		 $("#sopw").focus();
		}else if($("#sopwChk").val()==""){
		 $("#sopwChk").focus();
		}else if($("#soname").val()==""){// 5글자이하
		 $("#soname").focus();
		}else if($("#soname").val().length >"5"){
		 $("#soname").focus();
		 $("#soname").val("");
		}else if($("#soemail").val()==""){ //이메일 규격
		 $("#soemail").focus();
		}else if($("#sohp").val()==""){//11자리
		 $("#sohp").focus();
		}else if($("#sohp").val().length != "11"){
		 $("#sohp").focus();
		}else if($("#soemail").val()==""){
		 $("#soemail").focus();
		}else if($("#soemailAuth").val()==""){
		 $("#soemailAuth").focus();
		}else if($("#postCheckVal_so").val() == "0"){
		 $("#soaddr1").focus();
		}else if($("#soaddr1").val()==""){
		 $("#soaddr1").focus();
		}else if($("#sopostcode").val()==""){
		 $("#sopostcode").focus();
		}else if($("#sobirth").val()==""){//6자리
		 $("#sobirth").focus();
		}else if($("#sobirth").val().length !="10"){//6자리
		 $("#sobirth").focus();
		}else{
		 alert("회원가입이 완료되었습니다.");
		 $("#soForm").submit();
		}
		// >>소매
	} else if(clicked_id=="doJoinBtn"){
		var idCheckResult = $("#doidCheckClicked").val();
		if( $("#doId").val()==""){
			$("#doId").focus();
		}else if(idCheckResult=="0"){
		 alert("아이디 중복체크를 해주세요");
		 return;
		}else if($("#dopw").val()==""){
		 alert("비밀번호를 입력해주세요")
		 $("#dopw").focus();
		}else if($("#dopwChk").val()==""){
		 $("#dopwChk").focus();
		}else if($("#doname").val()==""){
		 $("#doname").focus();
		}else if($("#doname").val().length >"5"){
		 $("#doname").focus();
		 $("#doname").val("");
		}else if($("#dohp").val()==""){
		 $("#dohp").focus();
		}else if($("#dohp").val().length != "11"){
		 $("#dohp").focus();
		}else if($("#doemail").val()==""){
		 $("#doemail").focus();
		}else if($("#doemailAuth").val()==""){
		 $("#doemailAuth").focus();
		}else if($("#postCheckVal_do").val() == "0"){
		 $("#doaddr1").focus();
		}else if($("#doaddr1").val()==""){
		 $("#doaddr1").focus();
		}else if($("#doaddr1").val().length > "40"){
		 $("#doaddr1").focus();
		}else if($("#dosano").val()==""){ //10자리
		 $("#dosano").focus();
		}else if($("#dosano").val().length !="10"){ //10자리

			$(".sanoCheckMessage").html("사업자 번호를 확인해주세요");
			$(".sanoCheckMessage").css("color","green");
			$(".sanoCheckMessage").css("font-weight","bold");
			$(".sanoCheckMessage").css("font-size","10px");
			$("#dosano").focus();
		}else if($("#fName").val()==""){
		 alert("사업자등록증을 첨부해주세요");
		}else{
		 alert("회원가입이 완료되었습니다.");
		 $("#doForm").submit();
		}
		// >>도매
	}
}
</script>
<script>
window.onload = function () { //이게 생년월일 날짜 막는거

    today = new Date();

    today.setDate(today.getDate());

    today = today.toISOString().slice(0, 10);

    document.getElementById("sobirth").setAttribute("max", today);

}
</script>
     
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block">
                    
                    <div  class="col-lg-5 d-none d-lg-block" style="height:80%; width:100%;">
			        <img src="${pageContext.request.contextPath}/resources/img/logo3.png" alt="KHerb" title="KHerb"  width="300%" height="100%">
					</div>
					<div class="col-lg-5 d-none d-lg-block">&nbsp;
			    	</div>
                    
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            
        <ul class="tabs">
		<li id = "first" class="tab-link current" data-tab="tab-1" value="소매">소매(개인)</li>
		<li id = "second" class="tab-link" data-tab="tab-2">도매</li>
     	</ul>
     	<div id="tab-1" class="tab-content">
		<!--  소매     -->
		<h2 class="text-center">회원 가입(소매)</h2>
     	 <form:form action="/kherb/admin/mem/join/so" class="user" id = "soForm"  commandName ="memberVO" method="post">
		 <form:errors path="*" cssClass ="errorMsg" element="div"/>
		 <div class="form-group" id="soIdTab">
		 <div class="form-group ">
         <form:input type="text" id="soId" class="form-control" name="id" path="id" required="required" value="${so_memberVO.id}" 
         placeholder="아이디(5~10자내로 기입해주세요)"  maxlength="11" autofocus = "autofocus" />
         <input type="hidden" value="0" id="idCheckVal_so" />
         </div>
         <div class="form-group" >
         <input type="button" value=" 중복  체크 "  class="btn btn-md btn-primary shadow-sm" onclick= "idCheck(this.id)" required="required">
         <input type="hidden" value="0" id="soidCheckClicked" />
         </div> 
         </div>
         <div class="form-group" >
         <span class="IdcheckMessage"></span>
         </div>             
         <div class="form-group" >
         <input type="password" class="form-control" id="sopw" name="pw" onkeydown="checkSpacebar()" pattern=".{3,}" required="required" maxlength="12" placeholder="비밀번호" >
         <input type="password" class="form-control" id="sopwChk" name="pwChk"  onkeydown="checkSpacebar()" pattern=".{3,}" required="required" maxlength="12" placeholder="비밀번호 확인">
         <input type="hidden" value="0" id="pwCheckVal_Eng_so" />
         <input type="hidden" value="0" id="pwCheckVal_Num_so" />
         </div>
         
         <div class="form-group" >
         <span class="pwcheckMessage"></span>
         </div>
         
         <div class="form-group">
         <input type="text" name="name" class="form-control" id="soname" value="${so_memberVO.name}" pattern="^[가-힣]+$" required="required" placeholder="이름"  maxlength="6">
         <input type="text" name="hp" class="form-control"  id="sohp" value="${so_memberVO.hp}"  required="required" 
          oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="휴대전화" maxlength = "11">
         </div>
         
         <div class="form-group" id="soEmailTab">
         <div class="form-group">
         <input type="text" name="email" class="form-control" id="soemail" value="${so_memberVO.email}" required="required" placeholder="이메일">
         </div>
         <div class="form-group">
         <input type="button" id = "emailChkButton_so" class="btn btn-md btn-primary shadow-sm" onclick="emailAuthfun()" value=" 인증 번호 ">
         </div>
         </div>
         <div class="form-group">
         <span class="emailCheckMessage_val"></span>
         </div>
         <div class="form-group">
         <input type="text" name="emailAuth" class="form-control"  id="soemailAuth" required="required" placeholder="인증번호를 입력해주세요.">
         <input type="hidden" name="emailAuthChk" class="form-control"   id="soemailAuthChk" required="required" placeholder="인증번호Chk"> 
         </div>
         
         
         <div class="form-group">
         <span class="emailCheckMessage"></span>
         </div>
      
         <div class="form-group" id="soPostcodeTab">
         <div class="form-group">
         <input type="text" id="sample4_postcode_so" class="form-control" name="postcode" value="${so_memberVO.postcode}" placeholder="우편 번호" readonly ="readonly">
         </div>
         <div class="form-group">
         <input type="button" class="btn btn-md btn-primary shadow-sm" onclick="sample4_execDaumPostcode_so()" value=" 우편 번호 "><br>
         <input type="hidden" value="0" id="postCheckVal_so" />
         </div>
         </div>
         <div class="form-group">
         <input type="text"  id="sample4_roadAddress_so" class="form-control" name="addr1" value="${so_memberVO.addr1}" placeholder="도로명주소" readonly ="readonly">
         <input type="text" name="addr2" class="form-control" id="soaddr1" value="${so_memberVO.addr2}" placeholder="상세주소" maxlength="40">
         </div>
         <div style="display:none">Mcode: <input type="text" name="mcode" class="form-control" value="S" required="required"></div>  
         <div style="display:none">Pass: <input type="text" name="pass" class="form-control" value="T" required="required"></div>
         <div class="form-group">
         <input type="date" name="birth" class="form-control" id="sobirth" value="${so_memberVO.birth}" required="required"  pattern="^[0-9_]{8}$" placeholder="생년월일(기호제외 8자리)" maxlength="8"> 
         </div>
         <div id = soSano style="display:none">사업자 등록번호: <input type="text" name="sano" class="form-control" value="개인(소매)" required="required"></div>
         <div class="form-group">
         <input type ="button" id="soJoinBtn" onclick="joinCheck(this.id)" class="btn btn-primary btn-block" value="회원가입"> 
         </div>
         </form:form>
         </div>
		 <!--도매 -->
	     <div id="tab-2" class="tab-content">             
         
         <h2 class="text-center">회원 가입(도매)</h2>
		 <form:form action="/kherb/admin/mem/join/do" id = "doForm" commandName ="memberVO" method="post" enctype="multipart/form-data">
		 <form:errors path="*" cssClass ="errorMsg" element="div"/>
		 
		 <div class="form-group" id="doIdTab">
		 <div class="form-group">
         <form:input type="text" id="doId" name="id" path="id" class="form-control" required="required" pattern="{5,10}$" value="${do_memberVO.id}"
         placeholder="아이디(5~10자내로 기입해주세요)" autofocus = "autofocus"  maxlength="11"/>
         <input type="hidden" value="0" id="idCheckVal_do" />
         </div>
         <div class="form-group">
         <input type="button" value=" 중복 체크 "  class="btn btn-md btn-primary shadow-sm" id="doidCheck" onclick= "idCheck(this.id)" required="required">
         <input type="hidden" value="0" id="doidCheckClicked" />
         </div> 
         </div>
         <div class="form-group" >
          <span class="IdcheckMessage"></span>
         </div>
        
         <div class="form-group" >
         <input type="password" class="form-control" id="dopw" name="pw" onkeydown="checkSpacebar()" pattern=".{3,}" required="required" maxlength="12" placeholder="비밀번호" >
         <input type="password" class="form-control" id="dopwChk" name="pwChk"  onkeydown="checkSpacebar()" pattern=".{3,}" required="required"  maxlength="12" placeholder="비밀번호 확인">
         <input type="hidden" value="0" id="pwCheckVal_Eng_do" />
         <input type="hidden" value="0" id="pwCheckVal_Num_do" />
         </div>
         <div class="form-group">
         <span class="pwcheckMessage"></span>
         </div>
         <div class="form-group">
         <input type="text" name="name" id = "doname" class="form-control" value="${do_memberVO.name}" pattern="^[가-힣]+$" required="required" placeholder="이름" maxlength="6">
         <input type="text" name="hp" id ="dohp" class="form-control" value="${do_memberVO.hp}" pattern=".{11}"required="required"
          oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="휴대전화" maxlength = "11">
         </div>
         <div class="form-group" id="doEmailTab">
         <div class="form-group">
         <input type="text" name="email" id = "doemail" class="form-control" value="${do_memberVO.email}" required="required" placeholder="이메일">
         </div>
         <div class="form-group">
         <input type="button" id = "emailChkButton_do" class="btn btn-md btn-primary shadow-sm" onclick="emailAuthfun()" value=" 인증 번호  ">
         </div>
         </div>
         <div class="form-group">
         <span class="emailCheckMessage_val"></span>
         </div>
         <div class="form-group">
         <input type="text" name="emailAuth" id ="doemailAuth" class="form-control"  required="required" placeholder="인증번호를 입력해주세요.">
         <input type="hidden" name="emailAuthChk" class="form-control"  required="required" placeholder="인증번호Chk"> 
         </div>
         <div class="form-group">
         <span class="emailCheckMessage"></span>
         </div>
      
         <div class="form-group" id="doPostcodeTab">
          <div class="form-group">
         <input type="text" id="sample4_postcode_do" class="form-control" name="postcode" value="${do_memberVO.postcode}" placeholder="우편번호" readonly ="readonly">
          </div>
          <div class="form-group">
         <input type="button" class="btn btn-md btn-primary shadow-sm" onclick="sample4_execDaumPostcode_do()" value=" 우편 번호 "><br>
         <input type="hidden" value="0" id="postCheckVal_do" />
         </div>
         </div>
         <div class="form-group">
         <input type="text"  id="sample4_roadAddress_do" class="form-control" name="addr1" value="${do_memberVO.addr1}" placeholder="도로명주소" readonly ="readonly">
         <input type="text" name="addr2" id ="doaddr1"class="form-control" value="${do_memberVO.addr2}" placeholder="상세주소" maxlength="40">
         </div>
         <div style="display:none">Mcode: <input type="text" name="mcode" class="form-control" value="D" required="required"></div>  
         <div style="display:none">Pass: <input type="text" name="pass" class="form-control" value="F" required="required"></div>
         <div id = doBirth style="display:none">생년 월일:<input type="date" name="birth" value="2022-04-27"required="required"></div>
         <div class="form-group">
         <input type="text" name="sano" id = "dosano" class="form-control" value="${do_memberVO.hp}" required="required" 
         placeholder="사업자 등록번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="10">
         </div>
         <div class="form-group">
         <span class="sanoCheckMessage"></span>
         </div>

         <div class="form-group" id="doSanoTab">
         <div class="form-group">
         <form:input type="text" path="mimg" class="form-control" value="${do_member.mimg}" id = "fName" readonly="true" placeholder ="사업자 등록증" />
         </div>
         <div class="form-group">
         <div style="display:none"><input type ="file" name="uploadFile" id = "img2" class="btn btn-main text-center" onchange = "fileCheck(this)" placeholder ="사업자 등록증">
         </div>
         <label id = "la" for="img2"><input type = "button" class="btn btn-md btn-primary shadow-sm" id = "imgbtn" value = " 첨부  파일 "/></label>
         </div>
         </div>
         <div class="form-group" >
         <input type ="button" id="doJoinBtn" onclick="joinCheck(this.id)" class="btn btn-primary btn-block" value="회원가입">
         </div>
         </form:form>
		 </div>
	
                            <hr>
                            <hr>
                            	<footer class="sticky-footer bg-white">
            				    <div class="container my-auto">
                    			<div class="copyright text-center my-auto">
                        		<span>Copyright &copy; KHerb, 2022<br><br>
                           		 박주영, 강승희, 이재준, 홍현택, 김도현, 김광한, 손종국</span>
                    			</div>
                				</div>
            					</footer>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/AdminChart/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/AdminChart/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/AdminChart/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/AdminChart/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/AdminChart/vendor/chart.js/Chart.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/AdminChart/js/chartjs-plugin-datalabels.esm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/AdminChart/js/chartjs-plugin-datalabels.js"></script>
	<script src="${pageContext.request.contextPath}/resources/AdminChart/js/chartt.js"></script>
      
    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/AdminChart/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/AdminChart/js/demo/chart-pie-demo.js"></script>
</html>