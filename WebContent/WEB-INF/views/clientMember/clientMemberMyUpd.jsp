<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	.errorMsg {color:red;}
	.smallInput {
    	width: 50%!important;
	}
th {vertical-align:middle!important}

</style>

<title>내 정보 수정</title>
<%
LocalDate now = LocalDate.now();
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.   
                 document.getElementById('zipCode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
$(document).ready(function(){
$("#imgbtn").on("click",function(){
	console.log("이미지 버튼");
	$("#la").click();
	
})
});

//스페이스바 입력 방지
function checkSpacebar(){
	var kcode=event.keyCode;
	if(kcode==32) event.returnValue=false;
}
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

</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h3 class="page-name">나의 가입정보</h3>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="page-wrapper">
  	<div class="purchase-confirmation shopping">
    	<div class="container">
      		<div class="row">
      		
      		
 <div class="col-md-3">
<aside class="sidebar">
	<!-- Widget Category -->
	<div class="widget widget-category">
		<h4 class="widget-title">Menu</h4>
		<ul class="widget-category-list">
	        <li><a href="order">내 결제내역</a>
	        </li>
	        <li><a href="info"><strong>내 가입정보</strong></a>
	        </li>
	        <li><a href="del">탈퇴하기</a>
	        </li>
	    </ul>
	</div> <!-- End category  -->
</aside>
</div>      		
      		
        		<div class="col-md-8 col-md-offset-1">
          			<div class="block ">
            			<div class="purchase-confirmation-details">
<form:form method="POST" commandName="memberVO" action="upd" enctype="multipart/form-data">
 <input type="hidden" name="id" value="${sessionMember.id }" />
 <input type="hidden" name="mcode" value="${sessionMember.mcode } " />
<table id="purchase-receipt" class="table">
<tr><th>이름</th><td><form:input path="name" value="${member.name }" onkeydown="checkSpacebar()" cssClass="form-control" /></td></tr>
<tr><th>이메일</th><td><form:input path="email" value="${member.email }"  onkeydown="checkSpacebar()" cssClass="form-control" /></td></tr>
<tr><th>핸드폰번호</th><td><form:input path="hp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${member.hp }" cssClass="form-control" /></td></tr>
<c:if test="${member.mcode eq 'S' }">
	<tr><th>생년월일</th><td><form:input type="date" path="birth" value="${member.birth }" max="<%=now%>"  cssClass="form-control smallInput" /></td></tr>
	<input type="hidden" name="sano" value="${member.sano }"/>
	<input type="hidden" name="mimg" value="${member.mimg }"/>
	<div style="display:none">사업자등록증/이미지<form:input type="file" id="inIt" path="uploadFile" value="${member.mimg}" onchange = "fileCheck(this)" /></div>
</c:if>
<c:if test="${member.mcode eq 'D' }">
	<tr><th>사업자 등록번호</th><td><form:input type="text" path="sano" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${member.sano}" cssClass="form-control"  /></td></tr>
	<tr><th>사업자등록증/파일명</th>
	<td><c:if test="${!empty member.mimg}">
	
 <div style="float: left; width:50%;"><form:input type="text" path="mimg" value="${member.mimg}" id = "fName" readonly="true" cssClass="form-control" /></div></c:if>
	
 <div style="float: left; width:50%;"><label id = "la" for="inIt"><input type = "button"  id = "imgbtn" value = "첨부"  class="btn btn-main"/></label></div></td></tr>
	<div style="display:none">사업자등록증/이미지<form:input type="file" id="inIt" path="uploadFile" value="${member.mimg}" onchange = "fileCheck(this)" /></div>
	<form:hidden path="birth" value="${member.birth }" />
</c:if>

<tr><th rowspan="3">주소</th><td>
 <div style="float: left; width:50%;">
<form:input id="zipCode" size="7" value="${member.postcode}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" path="postcode" cssClass="form-control"  />
</div> <div style="float: left;"><input type="button" onclick="sample6_execDaumPostcode()" value="주소검색"  class="btn btn-main"></div>
</td></tr>
<tr><td>
<form:input id="sample6_address" value="${member.addr1}" path="addr1" cssClass="form-control" /></td></tr><tr>
<td><form:input id="sample6_detailAddress" value="${member.addr2}" path="addr2" cssClass="form-control" />
</td></tr>

<tr><td colspan="2" class="text-center"><input type="submit" value="수정하기" onclick="location.href='./upd'"  class="btn btn-main"/>
&emsp;<input type="button" value="취소" onclick="location.href='./info'"  class="btn btn-main" /></td></tr>
</table>

</form:form>


              			</div>
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>

<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>