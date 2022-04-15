<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
     <title>매출 목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$(".saleMenu").addClass("active");
});
</script>

<script>
	
	
	
	function ho(data){
		
		$.ajax({
			 type:"POST",
		        url:'${pageContext.request.contextPath}/admin/sale/login.do',
		        data: {"pname" : data},
		        dataType:"json",
			 
			success: function(result){
				
			},
			error:function(){  
	            //에러가 났을 경우 실행시킬 코드
			}
		});
	
	}
	$("#a").on('click', function() {
		console.log(data);
		sessionStorage.setItem("sangpum", data);
		});
</script>

<style>
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:12px;}}

#dataTable{
   text-align: center;
}
.pagination  {
   display: flex;
    /* flex-wrap: nowrap; */
    justify-content: center;
}
.input-group{
   display: flex;
   justify-content: center !important;
}
#mcodeArr{
float: right;
}
#memSearch{
float: left;
width: 93%;
padding-left: 7%;
}
#memJoinBtn{
float: right;
margin-top:5px;
margin-bottom:5px;

}
</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

          <!-- Sidebar -->
<jsp:include page="../adminIndex/adminSidebar.jsp"></jsp:include>
         <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
<jsp:include page="../adminIndex/adminTopbar.jsp"></jsp:include>
      

<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">매출 </h1>
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">매출 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                     
       <form action="${pageContext.request.contextPath}/admin/sale/search/1" method="post">      
                        <div class="input-group ">
                          <div class="col-sm-2"> 
	   <select class="form-control  hidden-xs col-sm-12"  name="title">
       <c:forEach items="${Search}" var="option">
       <option value="${option.value}">${option.key} </option>  
        </c:forEach>      
        </select></div>  
           <input type="text" class="form-control bg-light border-0 small col-sm-7" placeholder="Search for..."
                   	 name="content" id="content" />         
                   	 <div class="input-group-append">
                     <button class="btn btn-primary" type="submit">
                        <i class="fas fa-search fa-sm"></i>
                         </button>
                            </div>
                        </div>
                    </form>
            <div>&nbsp;</div>
            <div class="col-sm-2 offset-sm-10"> 
	   <select class="form-control  hidden-xs col-sm-12" onchange="if(this.value) location.href=(this.value);"  name="sort">
       <c:forEach items="${sort}" var="sort">
       <option value="${pageContext.request.contextPath}/admin/sale/sort/${sort.value}/1">${sort.key} </option>  
        </c:forEach>      
        </select></div>  
                                <table class="table table-bordered"  ><!-- id="dataTable" -->
                                    <thead>
                                        <tr>
                                        <th>상품번호</th>
                                         <th>상품명</th>
                                         <th>매출액</th>
                                          <th >판매량</th>
                                         <th>비율</th>
                                         <th>Action</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                      <c:forEach items="${SaleList}" var="SaleList">
                                          <tr>
                                         
                                      <td>${SaleList.pno}</td>
                                   
            <!-- <td> <a onclick="input()"
                href="/kherb/admin/sale/${paging.pageNo}/info/${SaleList.pname}/1">${SaleList.pname}</a></td>-->
                
                <td> <a onclick="ho('${SaleList.pname}');location.href='${pageContext.request.contextPath}/admin/sale/${paging.pageNo}/info/1'" 
              >${SaleList.pname}</a></td>
                <!-- location.href='/kherb/admin/sale/${paging.pageNo}/info/1' -->
                
                 <!--  <td> <a href= "javascript:void(0)" onClick="javascript:move(this)/${paging.pageNo}/info/1">${SaleList.pname}</a></td>-->  
    
                                      <td>${SaleList.price}</td>
                                      <td>${SaleList.pcount}</td>
                                      <td>${SaleList.sum}</td> 
                                  <td><button class="btn btn-primary" onclick="ho('${SaleList.pname}');location.href='${pageContext.request.contextPath}/admin/sale/${paging.pageNo}/info/1'" 
              						>상세보기</button></td>
                                         </tr>
                                        </c:forEach>
                                       
                                  
                                    </tbody>
                                </table>
                               
                         <div class="col-sm-12 col-md-7" style=" text-align : center; ">

<ul class="pagination">

			<c:if test="${paging.startPage > paging.pageSize}">
			<li class="paginate_button page_item previous" id="dataTable_previous">
			<a href="${pageContext.request.contextPath}/admin/sale/${paging.startPage - paging.pageSize}"
			aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
			</li>
			</c:if>
			<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${pNo ne paging.pageNo}">
			<li class="paginate_button page_item">
			<!-- <a href="javascript:void(0)" onClick="javascript:move(this)" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">[${pNo}]</a> -->
			<a href="${pageContext.request.contextPath}/admin/sale/${pNo}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
			</li>
			</c:if>
		
			<c:if test="${pNo eq paging.pageNo}">	<li class="paginate_button page_item">
			<a href="${pageContext.request.contextPath}/admin/sale/${pNo}" style="color:red;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
			</li></c:if>

			</c:forEach>
			<c:if test="${paging.endPage < paging.totalPages}">
			<li>
			<a href="${pageContext.request.contextPath}/admin/sale/${paging.startPage + paging.pageSize}"
			aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
			</li></c:if>
							</ul>
							</div>
							
							 
							                        
                </div>
                <!-- /.container-fluid -->

            </div>
         

 <!-- Footer -->
<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
     
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
	 	
</body>

</html>