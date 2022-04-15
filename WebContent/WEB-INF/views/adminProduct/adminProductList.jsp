<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>상품목록</title>
  <meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script>
		$(document).ready(function(){
			$(".productMenu").addClass("active");
		});
	</script>

  <script>
	function proDelete(pno, page){
		if(confirm('해당상품을 삭제하시겠습니까?')){
			location.href = '/admin/pro/del?pno=' + pno + '&page=' + page;
		}
	}
</script>
<style>
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:15px;}}
.empty  {
	text-align: center;
	vertical-align:middle;
	height:600px;
	font-size:30px;
}
.input-group{
	display: flex;
	justify-content: center !important;
}
#memSearch{
	float: left;
	width: 93%;
	padding-left: 7%;
}
#dataTable{
	text-align: center;
}
.box{
	display: flex;
	flex-wrap: nowrap;
}
@media (max-width: 600px) {
  .container-fluid {
   	margin:0;
  }
}
.pageBox {
	display: flex;
	justify-content: center;
}
.btnBox{
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
}
.btn{
	font-size: 2rem;
    text-align: center;
    font-weight: 600;
    color: gray;
    background-color: white;
    border: 0;
    outline: 0;
    padding: 0;
    -webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
}
.checkbtn{
	font-size: 1.2rem;
    text-align: center;
    font-weight: 600;
    color: #777;
    background-color: white;
    border: 0;
    outline: 0;
    padding: 0;
    -webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
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
 <h6 class="m-0 font-weight-bold text-primary">상품 목록</h6>
  </div>
<div class="card-body">
<div class="table-responsive">
<!-- 검색 -->
<div id="memSearch">
  <form action="${pageContext.request.contextPath}/admin/pro/data" method="get">		
<!-- <input type ="text" value="/kherb/admin/pro/${paging.pageNo}/${search.searchCondition}/${search.searchKeyword}"> -->
<div id="selectdiv" class="input-group">
	<div class="col-xm-2">
		<select name="searchCondition" class="form-control" id = "column" onchange="select(this.obj);">
			<c:choose>
				<c:when test="${searchCondition == 'pname'}"> 
					<option value="pname" selected="selected">상품명</option>
				</c:when>
				<c:when test="${searchCondition == '_'}"> 
					<option value="pname" selected="selected">상품명</option>
				</c:when>
				<c:otherwise>
					<option value="pname">상품명</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${searchCondition == 'pno'}"> 
					<option value="pno" selected="selected">상품번호</option>
				</c:when>
				<c:otherwise>
					<option value="pno">상품번호</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${searchCondition == 'ptype'}"> 
					<option value="ptype" selected="selected">분류</option>
				</c:when>
				<c:otherwise>
					<option value="ptype">분류</option>
				</c:otherwise>
			</c:choose>
		</select>
	</div>	
		<input type="text" id="searchData" name="searchKeyword" class="form-control bg-light border-0 small col-sm-7" placeholder="Search for..." />
		<input type="hidden" name="page" value="1">
		<input type="submit" class="btn btn-primary" value="검색" />

</div>                            
</form>
</div> 
<div id="memJoinBtn" class="d-block">
  <a href="${pageContext.request.contextPath}/admin/pro/insert"><button type="button" class="btn btn-primary">상품 추가</button></a>
  </div>   
  <c:choose>
<c:when test="${empty proList}">
	<div class=empty><div>검색 결과가 없습니다.</div></div>
</c:when>
<c:otherwise>         
  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
      <tr>
        <th class="d-none d-sm-table-cell">상품번호</th>
        <th class="d-table-cell">분류</th>
        <th class="d-table-cell">상품명</th>
        <th class="d-table-cell">상품가격</th>
        <th class="d-none d-sm-table-cell">썸네일</th>
        <th class="d-none d-sm-table-cell">삭제</th>
        
      </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${ proList }">
      <tr>
        <td class="d-none d-sm-table-cell">${p.pno}</td>
        <td class="d-table-cell">${p.ptype}</td>
        <td class="d-table-cell"><a href="${pageContext.request.contextPath}/admin/pro/${pageInfo}/detail/${p.pno}">${p.pname }</a></td>
        <td class="d-table-cell">${p.price}</td>
        <td class="d-none d-sm-table-cell">${p.img1}</td>
        <td class="d-none d-sm-table-cell">
        <a href="javascript:proDelete(${p.pno},${pageInfo})"><button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">삭제</button></a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</c:otherwise>
</c:choose> 
</div></div></div></div>
<c:choose>
<c:when test="${empty proList}">
</c:when>
<c:otherwise>
<div class="row justify-content-md-center"> 
		<div class="col-sm-12 col-md-7">
  					<div  class="pageBox">
						<c:if test="${paging.startPage > paging.pageSize}">
							<form action="${pageContext.request.contextPath}/admin/pro/data" method="get">
								<input type="hidden" name="searchCondition" id="searchCondition" value="${searchCondition}"/>
								<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
								<button class="page-link" type="submit" name="page" id="page" value="${paging.startPage - paging.pageSize}">Previous</button>
							</form>
						</c:if>
						<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}">
							<c:if test="${pNo!=param.pageNo}">
								<form action="${pageContext.request.contextPath}/admin/pro/data" method="get">
									<input type="hidden" name="searchCondition" id="searchCondition" value="${searchCondition}"/>
									<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
									<button class="page-link" type="submit" name="page" id="page" value="${pNo}">[${pNo}]</button>
								</form>
							</c:if>
							<c:if test="${pNo==param.pageNo}">
								<li class="paginate_button page_item">
								<form action="${pageContext.request.contextPath}/admin/pro/data" method="get">
									<input type="hidden" name="searchCondition" id="searchCondition" value="${searchCondition}"/>
									<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
									<button class="page-link" type="submit" name="page" id="page" value="${pNo}" style="color:red;">[${pNo}]</button>
								</form>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage < paging.totalPages}">
							<form action="${pageContext.request.contextPath}/admin/pro/data" method="get">
								<input type="hidden" name="searchCondition" id="searchCondition" value="${searchCondition}"/>
								<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
								<button class="page-link" type="submit" class="btn" name="page" id="page" value="${paging.startPage + paging.pageSize}">Next</button>
							</form>
						</c:if>
					</div>
		</div>
  	</div>
</c:otherwise>  	
  	</c:choose>				
</div>
	<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 	
  <!-- End of Main Content -->
 <!-- Footer -->
      </div>
 <!-- End of Content Wrapper -->
 </div>
 <!-- End of Page Wrapper -->
	 	

</body>
</html>