<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>상품상세</title>
  <meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
	function proDelete(pno,page){
		if(confirm('해당상품을 삭제하시겠습니까?')){
			location.href = '/admin/pro/del?pno=' + pno + '&page=' + page;
		}
	}
	function detail(searchCondition, searchKeyword, page) {
		var f = document.detail;
	
		f.searchCondition.value = searchCondition;
		f.searchKeyword.value = searchKeyword;
		f.page.value = page;
		f.action = "/admin/pro/data"
		f.method = "get"
		f.submit();
	};
</script>
<script>
$(document).ready(function(){
	$(".productMenu").addClass("active");
});
</script>
<style>
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:15px;}}
#cartimg {width:100px; height:100px; border:1px solid #000; }
  	img {width:100px; height:100px;}
</style>
</head>
<body id="page-top">
<form name="detail">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="searchKeyword">
	<input type="hidden" name="page">
</form>
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
                    <h1 class="h3 mb-2 text-gray-800">상품 </h1>
  
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 상세</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                              
  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
      <tr><th>번호</th><td>${proInfo.pno }</td></tr>
      <tr><th>이름</th><td>${proInfo.pname }</td></tr>
      <tr><th>분류</th><td>${proInfo.ptype }</td></tr>
      <tr><th>가격</th><td>${proInfo.price }</td></tr>
      <tr><th>설명</th><td>${proInfo.detail }</td></tr>
      <tr><th>썸네일</th>
    	<td>      		
      		<div id="cartimg">
      		<img src="<spring:url value='/resources/img/${proInfo.img1}'/>" alt="${proInfo.img1}" title="${proInfo.img1 }"/>
    		</div>      	
    	</td>
     </tr>
  </table>
<div>
	<!-- 목록으로 갈 때 링크 고쳐야함 controller에서 restful로 바꿀 때 -->
  <a class="btn btn-primary" href="javascript:detail('${data.searchCondition}','${data.searchKeyword}','${data.page}')">목록</a>
  <a class="btn btn-primary" href="/admin/pro/${pageInfo}/upd/${proInfo.pno}">수정</a>
  <a class="btn btn-primary" href="javascript:proDelete(${proInfo.pno},${pageInfo})">삭제</a>
</div></div></div></div></div></div></div></div>
<!-- End of Main Content -->

<!-- Footer -->
<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
     
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

</body>
</html>