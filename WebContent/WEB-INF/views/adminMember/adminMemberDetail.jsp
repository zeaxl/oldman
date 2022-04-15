<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:12px;}}
</style>
<script>
$(document).ready(function(){
	$(".memberMenu").addClass("active");
});
</script>
<script>
function moveAgreeExe(mno){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" +pNo + "/"+ "pass";
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	var mno = document.getElementById("mno").value ; 
	alert(urlFin);

	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", mno);
		
		
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
}
</script>

<script>
//상세보기 전달하는 값(검색/페이지값/mno) > 회원 수정 페이지로 이동
	function moveDetailUpd(obj){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" + pNo + "/" + "upd" ;
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	var mno = document.getElementById("mno").value ; 
	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", mno);
				
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
	}
</script>

<script>
//상세보기 전달하는 값(검색/페이지값/mno) > 회원 List로 이동
	function moveDetailList(obj){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" +pNo;
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	var mno = document.getElementById("mno").value ; 
	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", mno);
				
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
	}
</script>

<script>
//  삭제 후 > 회원 List로 이동
	function moveDetailDel(obj){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" +pNo +"/" +"del";
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	var mno = document.getElementById("mno").value ; 
	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", mno);
				
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
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
  
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 상세</h6>
                        </div>
                        
  
	<input type="hidden" id ="searchCondition" name="searchCondition" value="${search.searchCondition}">
	<input type="hidden" id ="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" >
	<input type ="hidden" id="pageNo" name ="pageNo" value="${page.pageNo}"> 
	<input type ="hidden" id="mno" name ="mno" value="${member.mno }"> 

                        <div class="card-body">
                            <div class="table-responsive">
 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
 
	<tr><th>회원번호</th><td>${member.mno }</td></tr>
	<tr><th>이름</th><td>${member.name }</td></tr>
	<tr><th>아이디</th><td>${member.id }</td></tr>
	<tr><th>이메일</th><td>${member.email }</td></tr>
	<tr><th>핸드폰번호</th><td>${member.hp }</td></tr>
	<tr><th>우편번호</th><td>${member.postcode }</td></tr>
	<tr><th>주소</th><td>${member.addr1 } ${member.addr2 }</td></tr>
	<tr><th>가입일</th><td>${member.joindate }</td></tr>

<c:choose>
<c:when test="${member.mcode eq 'S' }">
	<tr><th>구분</th><td>일반회원</td></tr>
	<tr><th>생년월일</th><td>${member.birth }</td></tr>
</c:when>
<c:when test="${member.mcode eq 'D' }">
	<tr><th>구분</th><td>사업자회원</td></tr>
	<tr><th>사업자등록번호</th><td>${member.sano }
	
		<c:if test="${member.pass eq 'F' }">
			&emsp;<a href="javascript:void(0)" onClick="javascript:moveAgreeExe(this)" id="btnPass"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">승인</a> 
		</c:if>
	
	</td></tr>
	<tr><th>사업자등록증</th><td><img alt="${member.mimg }"  style="max-width:100%; max-height:auto;" src="<spring:url value='/resources/memberImg/${member.mimg }'/>" /></td></tr>
</c:when>
</c:choose>
	
	<tr>
	<td colspan="2">
	<a class="d-inline-block btn btn-sm btn-primary shadow-sm" href="javascript:void(0)" onClick="javascript:moveDetailList(this)" >목록</a>
	<a class="d-inline-block btn btn-sm btn-primary shadow-sm" href="javascript:void(0)" onClick="javascript:moveDetailUpd(this)" >수정</a>
	<a class="d-inline-block btn btn-sm btn-primary shadow-sm" href="javascript:void(0)" onClick="javascript:moveDetailDel(this)" >삭제</a></td>
	 <!-- <input type="button" value="수정" onclick="location.href='../upd/${member.mno}'" /></td> 
		<td><input type="button" value="삭제" onclick="location.href='./del'" /></td> -->
	</tr>
</table>
             

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