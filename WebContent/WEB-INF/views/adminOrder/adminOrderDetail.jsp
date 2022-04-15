<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
td {
 text-align : center !important;	
 vertical-align : middle !important;
}

th {
 text-align : center !important;
 vertical-align : middle !important;
}

</style>

<script>
$(document).ready(function(){
	$(".orderMenu").addClass("active");
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
//상세보기 전달하는 값(검색/페이지값/mno) > 회원 List로 이동
	function moveDetailList(obj){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,22);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" +pNo;
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	
	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
				
		Form.appendChild(input1);
		Form.appendChild(input2);
		
		
		document.body.appendChild(Form);
		Form.submit();
	}
</script>

<script>
function del() {
	
	
	if(!confirm("주문을 취소하시겠습니까?")) {
		
	} else {
		alert("주문 취소 완료");
		document.getElementById('orderDelete').submit();
	}
	
	
}

</script>

</head>
<body>
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
                    <h1 class="h3 mb-2 text-gray-800">결제 </h1>
  
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">결제 상세</h6>
                        </div>

<input type ="hidden" id="pageNo" name ="pageNo" value="${page.pageNo}"> 
<input type="hidden" id ="searchCondition" name="searchCondition" value="${search.searchCondition}">
<input type="hidden" id ="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" >
<c:forEach var="ao" items="${allOrderD}" end="">
<input type="hidden" id ="payno" name="payno" value="${ao.payno}" >
</c:forEach>


<div class="card-body">
<div class="table-responsive">
                            
 <table class="table table-bordered" id="dataTable" >
    <c:set var="sum" value="0" />
	<c:forEach var="ao" items="${allOrderD}" end="">
	<tr><th width="198p">주문번호</th><td>${ao.payno}</td></tr>
	<tr><th>주문자 성명</th><td>${ao.oname}</td></tr>
	<tr><th>우편번호</th><td>${ao.opostcode}</td></tr>
	<tr><th>주소</th><td>${ao.oaddr1}${ao.oaddr2}</td></tr>
	
	
	</c:forEach>
	</table>
	
<table class="table table-bordered" id="dataTable">
	<c:forEach var="ao" items="${allOrderD}">
	<tr>
	<th width="198p">상품명</th>
	<th>상품가격</th>
	<th>상품개수</th>
	</tr>
	<tr>
	<td>${ao.pname}</td>
	<td>${ao.price}</td>
	<td>${ao.pcount}</td>
	</tr>
	<c:set var="sum" value="${sum + (ao.price * ao.pcount)}" />
	</c:forEach>
	</table>
	<table class="table table-bordered" id="dataTable">
    <tr><th>결제금액</th></tr>
    <tr><td><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</td></tr>
    </table>


<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="javascript:void(0)" onClick="javascript:moveDetailList(this)" >목록</a>

<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="javascript:void(0)" onClick="javascript:del()">
        <c:forEach var="ao" items="${allOrderD }" end="0">
        <form action="/admin/order/del" name="orderDelete" id="orderDelete" method="post">
        <input type="hidden" value="${ao.payno }" id="payno" name="payno"/>
        </form></c:forEach>주문취소</a>
	
             

</div></div></div></div></div>
<!-- Footer -->
<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
     
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
</body>
</html>