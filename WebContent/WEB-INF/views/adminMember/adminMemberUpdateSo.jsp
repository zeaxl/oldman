<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:15px;}}
</style>

<script>
$(document).ready(function(){
	$(".memberMenu").addClass("active");
});
</script>
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

<body id="page-top">
   <!-- Page Wrapper -->
    <div id="wrapper">


<!-- Sidebar -->        
<jsp:include page="../adminIndex/adminSidebar.jsp"></jsp:include>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
        
<!-- Topbar -->
<jsp:include page="../adminIndex/adminTopbar.jsp"></jsp:include>



 <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">회원 </h1>
    <input type="hidden" name="pageNo" value="${paging.pageNo }" />
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원정보 수정</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                           
 <form:form method="POST" commandName="memberVO" action="../${page.pageNo}/detaiI" enctype="multipart/form-data">
<input type="hidden" id ="searchCondition" name="searchCondition" value="${search.searchCondition}">
<input type="hidden" id ="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" >
<input type="hidden" name="mno" value="${member.mno }" /> 

 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<tr><th>이름</th><td><form:input path="name" value="${member.name }" /></td></tr>
<tr><th>아이디</th><td>${member.id }</td></tr>
<tr><th>이메일</th><td><form:input path="email" value="${member.email }"  /></td></tr>
<tr><th>핸드폰번호</th><td><form:input path="hp" value="${member.hp }"/></td></tr>
<c:if test="${member.mcode eq 'S' }">
	<tr><th>구분</th><td>일반회원</td></tr>
	<tr><th>생년월일</th><td><form:input type="date" path="birth" value="${member.birth }" /></td></tr>
	<input type="hidden" name="sano" value="${member.sano }"/>
	<input type="hidden" name="mimg" value="${member.mimg }"/>
	<div style="display:none">사업자등록증/이미지<form:input type="file" id="inIt" path="uploadFile" value="${member.mimg}" onchange = "fileCheck(this)" /></div>
</c:if>
<c:if test="${member.mcode eq 'D' }">
	<tr><th>구분</th><td>사업자회원</td></tr>
	<tr><th>사업자 등록번호</th><td><form:input type="text" path="sano" value="${member.sano}" /></td></tr>
	<tr><th>사업자등록증/파일명</th>
	<td><c:if test="${!empty member.mimg}"><form:input type="text" path="mimg" value="${member.mimg}" id = "fName" readonly="true" /></c:if>
	<label id = "la" for="inIt"><input type = "button"  id = "imgbtn" value = "첨 부"/></label></td></tr>
	<tr><td><div style="display:none">사업자등록증/이미지<form:input type="file" id="inIt" path="uploadFile" value="${member.mimg}" onchange = "fileCheck(this)" /></div></td></tr>
	<form:hidden path="birth" value="${member.birth }" />
</c:if>
<tr><th rowspan="3">주소</th><td>
<form:input id="zipCode" size="7" value="${member.postcode}" path="postcode" />
<input type="button" onclick="sample6_execDaumPostcode()" value="주소검색" ></td></tr>
<tr><td>
<form:input id="sample6_address" value="${member.addr1}" path="addr1" /></td></tr><tr>
<td><form:input id="sample6_detailAddress" value="${member.addr2}" path="addr2" />
</td></tr>

	<tr>
	<td colspan="2">

	 <input type="submit" value="수정" class="btn btn-primary"/>
		<input type="button" value="취소" onclick="history.back();" class="btn btn-primary"/></td> 
	</tr>
</table>

</form:form>
 
         

</div></div></div></div></div>
<!-- End of Main Content -->


 <!-- Footer -->
<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
     
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

</body>
</html>