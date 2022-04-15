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
	function proDelete(pno){
		if(confirm('해당상품을 삭제하시겠습니까?')){
			location.href = 'pro/del?pno=' + pno;
		}
	}
</script>
<script>
<!-- 페이징 -->
function pagination() {
	var req_num_row = 10;
	var $tr = $('tbody tr');
	var total_num_row = $tr.length;
	var num_pages = 0;
	if (total_num_row % req_num_row == 0) {
		num_pages = total_num_row / req_num_row;
	}
	if (total_num_row % req_num_row >= 1) {
		num_pages = total_num_row / req_num_row;
		num_pages++;
		num_pages = Math.floor(num_pages++);
	}
	$('.pagination').empty();
//	$('.pagination').append("<li><a class=\"prev\">Previous</a></li>");
	for (var i = 1; i <= num_pages; i++) {
		$('.pagination').append("<li> <a>" + i + "</a> </li>&nbsp;&nbsp;");
		$('.pagination li:nth-child(2)').addClass("active");
		$('.pagination a').addClass("pagination-link");
	}
//	$('.pagination').append("<li><a class=\"next\">Next</a></li>");
	$tr.each(function(i) {
		$(this).hide();
		if (i + 1 <= req_num_row) {
			$tr.eq(i).show();
		}
	});
	$('.pagination a').click('.pagination-link', function(e) {
		e.preventDefault();
		$tr.hide();
		var page = $(this).text();
		var temp = page - 1;
		var start = temp * req_num_row;
		var current_link = temp;
		$('.pagination li').removeClass("active");
		$(this).parent().addClass("active");
		for (var i = 0; i < req_num_row; i++) {
			$tr.eq(start + i).show();
		}
		if (temp >= 1) {
			$('.pagination li:first-child').removeClass("disabled");
		} else {
			$('.pagination li:first-child').addClass("disabled");
		}
	});
	$('.prev').click(function(e) {
		e.preventDefault();
		$('.pagination li:first-child').removeClass("active");
	});
	$('.next').click(function(e) {
		e.preventDefault();
		$('.pagination li:last-child').removeClass("active");
	});
}
$('document').ready(function(){
    pagination();
  $('.pagination li:first-child').addClass("disabled");
});
</script>

<script>
function clickedCno(clicked_value){
	var cno = clicked_value;
	alert(cno);
	
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
  <h1 class="h3 mb-2 text-gray-800">상품 </h1>
<p class="mb-4"> </p>
 <!-- DataTales Example -->
 <div class="card shadow mb-4">
  <div class="card-header py-3">
 <h6 class="m-0 font-weight-bold text-primary">상품 목록</h6>
  </div>
<div class="card-body">
<div class="table-responsive">

  <div>
  <a href="pro/insert"><button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">상품 추가</button></a>
  </div>
  
<!-- 검색 -->
  <form action="/kherb/admin/pro/${paging.pageNo}/" method="post">		
<!-- <input type ="text" value="/kherb/admin/pro/${paging.pageNo}/${search.searchCondition}/${search.searchKeyword}"> -->
<div id="selectdiv">
<select name="searchCondition" class="txt" id = "column" onchange="select(this.obj);">
			<c:forEach items="${conditionMap}" var="option" >
				<option  value="${option.value}" >${option.key}
			</c:forEach>
		</select>
		<input type="text" id="searchData" name="searchKeyword" class="selecttext" />
		<input type="submit" value="검색" />

</div>                            
</form>             
  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
      <tr>
        <th>상품번호</th>
        <th>상품타입</th>
        <th>상품명</th>
        <th>상품가격</th>
        <th>썸네일</th>
        <th>상세이미지</th>
        <th>삭제</th>
        
      </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${ proList }">
      <tr>
        <td>${p.pno }</td>
        <td>${p.ptype }</td>
        <td><a href="pro/info?pno=${p.pno}">${p.pname }</a></td>
        <td>${p.price }</td>
        <td>${p.img1 }</td>
        <td>${p.img2 }</td>
        <td>
        <a href="javascript:proDelete(${p.pno})"><button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">삭제</button></a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  	<ul class="pagination">
		</ul>
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