<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".productMenu").addClass("active");
});
</script>
<style type="text/css">
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:15px;}}

</style>
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
                    <h1 class="h3 mb-2 text-gray-800">상품 </h1>
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품정보 추가</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
<div>
<form:form method="post" action="insert" modelAttribute="productVO" enctype="multipart/form-data">
<table class="table table-bordered" id="dataTable">
<tr>
  <td>분류 :</td><td><form:input path="ptype" /></td>
</tr><tr>
  <td>상품명 :</td><td><form:input path="pname" /></td>
</tr><tr>
  <td>가격 :</td><td><form:input path="price" /></td>
</tr><tr>
  <td>상세정보 :</td><td><form:textarea path="detail" style="width:100%;" rows="10" /></td>
</tr><tr>
  <td>썸네일 :</td><td><form:input type="file" path="uploadFile" /></td>
</tr>

<tr>
  <td colspan="2">
  	<input type="submit" value="등록" class="btn btn-primary"/>
  </td>
</tr>
<tr>
  <td colspan="2">
  	<a class="btn btn-primary" onclick="history.go(-1)">상품 리스트</a>
  </td>
</tr>

</table></form:form>

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