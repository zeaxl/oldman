<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>매출 상세</title>


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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$(".saleMenu").addClass("active");
});
</script>
<script type="text/javascript">
function lo(data){
	
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/sale/1/info/'+ data + '/' + data,
        dataType:"json",
        success: function ajaxHtml(data){
        	  
           	
                     
        	   var html="";     	   
        	   var html="<table class='table table-bordered'>";
        	   html+="<tr>";
        	   html+="<th>상품번호</th>";
        	   html+="<th>상품명</th>";
        	   html+="<th>매출액</th>";
        	   html+="<th>판매량</th>";
        	   html+="<th>날짜</th>";  
        	   html+="</tr>";
        	  
        	   $.each(data,(index,obj)=>{
        		 html+="<tr>";
        		 html+="<td>"+obj.pno+"</td>";
        		 html+="<td>"+obj.pname+"</td>";
          	     html+="<td>"+obj.price+"</td>";
          	     html+="<td>"+obj.pcount+"</td>";
          	     html+="<td>"+obj.odate+"</td>";
          	    
          	     html+="</tr>";
        		 
        	 })
        	 html+="</table>";
        	 
        	 $("#to").html(html);
           },
        error:function(){alert("error");}
     });}
       
       
       
       
      
</script>
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
               
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                

                  <!--<button type="button" onclick = "location.href = '/kherb/admin/sale/1' ">뒤로가기</button>--> 
                    <button type="button"class="btn btn-primary" onclick="history.back();">뒤로가기</button>
                    <p class="mb-4"> </p>               

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                         <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">매출 상세</h6>
                        </div>                       
                        <div class="card-body">
                        
                            <div class="table-responsive" id="di">
                                <table class="table table-bordered" id="to" ><!-- id="dataTable" -->
                                    <thead>
                                        <tr>
                                        <th>상품번호</th>
                                         <th>상품명</th>
                                         <th>매출액</th>
                                          <th >판매량</th>
                                         <th>날짜</th>
                                        </tr>
                                    </thead>
                                    
                                   <c:forEach items="${SaleInfo}" var="SaleInfo">
									   <tr>
									   <td>${SaleInfo.pno}</td>
									   <td>${SaleInfo.pname}</td>
									    <td>${SaleInfo.price}</td>
									        <td>${SaleInfo.pcount}</td>
									        <td>${SaleInfo.odate}</td>
									        
									         
									     </tr>
									
									</c:forEach>
                                    </tbody>
                                </table>
                                 
                                      
                                  
<div class="col-sm-12 col-md-7">
<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
<ul class="pagination">

			<c:if test="${paging.startPage > paging.pageSize}">
			<li class="paginate_button page_item previous" id="dataTable_previous">
			<a onclick="lo('${pNo}');"
			aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
			</li>
			</c:if>
			<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${pNo ne paging.pageNo}">
			<li class="paginate_button page_item">
			<!-- <a href="javascript:void(0)" onClick="javascript:move(this)" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">[${pNo}]</a> -->
			<a  onclick="lo('${pNo}');" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
			</li>
			</c:if>
		
			<c:if test="${pNo eq paging.pageNo}">	<li class="paginate_button page_item">
			<a onclick="lo('${pNo}');"  aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
			</li></c:if>

			</c:forEach>
			<c:if test="${paging.endPage < paging.totalPages}">
			<li>
			<a onclick="lo('${pNo}');"
			aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
			</li></c:if>
</ul>
</div>
	</div>
  </div>	
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

           
         
   <!-- Footer -->
<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
     
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
</body>

</html>