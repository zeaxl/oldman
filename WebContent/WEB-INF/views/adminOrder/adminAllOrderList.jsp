<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
<style>
.pagination {
justify-content: center;

}

</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".orderMenu").addClass("active");
});
</script>
<script>
$(document).ready(function(){

	//현재 데이터를 콘솔로 보기위해 만들어 놓음.
	$("#searchData").on("propertychange change keyup paste input", function() {

		var data = document.getElementById("searchKeyword").value
		console.log("searchData: "+ data);
		var column = document.getElementById("searchCondition").value
		console.log("column:" +column);	
		})
});
</script>
<script>
$(document).ready(function(){
	//현재 데이터를 콘솔로 보기위해 만들어 놓음. 
	var url = document.location.href;
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,22);
	var urlAfter = document.getElementById("startPage").value;
	
	console.log(urlD);
	console.log(urlE);
	console.log(urlAfter);
	//여기까지
	
	var arr = new Array();
	<c:forEach items='${conditionMap}' var="option">
	arr.push({key:'${option.key}', value:'${option.value}'});
	</c:forEach>
	for(var i = 0; i<arr.length; i ++){
	console.log(" 배열key: " +arr[i].key
				+" 배열value: " +arr[i].value);
	}
	

	// 컬럼 value 유지 / 이해가 잘안감
	// 이번에 리스트로 이동할 때 들어 온 '${search.searchCondition}'(id, name) 둘 중 하나를,
	// > id 가  column 인 select value에 넣어서 속성값이 이전페이지에서 현재 페이지도 유지 할 수 있게 해준다.
	// prop는 javascript의 '속성(변화)'에 초점을 맞춘 부분이라서, 이번에 사용하였다. 
	// select 속성은 페이지가 로드 될 때 옵션중 미리 선택되어지는 옵션.
	var columnKeep = '${search.searchCondition}';
	$("#column").val(columnKeep).prop("selected", true);
	
	$("#searchData").on("propertychange change keyup paste input", function() {
		console.log("실행");
		var data = $("#searchData").val();
		document.getElementById("searchKeyword").value = data;
		console.log(data);
// 		var sel = document.getElementById("sel").innerText =document.getElementById("searchCondition").value;
// 		console.log("MemberList 처음 이동 시 컬럼의 값: " +sel);
		
	})		
	console.log("완료");
});
</script>
<script>
//검색어 컬럼 바뀌었을 때, 동작 시 > 컬럼의 값이 input tag searchCondition로 이동
function select(obj){	
	var column = document.getElementById("column").value
	console.log(column);	
	document.getElementById("searchCondition").value = column;
	
	}
</script>
<script>
//상세보기 전달하는 값(검색/페이지값)
	function moveDetail(mno){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,22);
	var pNo = document.getElementById("pageNo").value;
	var payno = document.getElementById("payno").value;
	
	var urlFin = urlE  + "/" +pNo + "/"+ "detail";
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	var mnoF = mno.parentNode;
	var mnoS = mnoF.parentNode;
	var mnoD = mnoS.childNodes[1].innerHTML;
	console.log(mnoD);
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
		input3.setAttribute("name", "payno");
		input3.setAttribute("value", payno);
		
		
		
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
}
</script>
<script>
//검색 전달하는 값(검색/페이지)
	function move(mv){
	var urlD = document.location.href.split(/ga/)[1];
	var urlE = urlD.substring(4,22);
	var urlBF = mv.innerText.substring(1,2);
	var urlAF = urlBF.substring(0,1);
	var urlFin = urlE  + "/" +urlAF;
	
	var data = document.getElementById("searchKeyword").value
	var column = document.getElementById("searchCondition").value
		
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
	function moveBefore(mvb){
		
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,22);
	var urlBefore = document.getElementById("startPage").value;
	urlBefore = Number(urlBefore);
	var urlFin = urlE  + "/" +(urlBefore-5);
	alert(urlFin);
	var data = document.getElementById("searchKeyword").value
	var column = document.getElementById("searchCondition").value
		
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
	function moveAfter(mva){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,22);
	var urlAfter = document.getElementById("startPage").value;
	urlAfter = Number(urlAfter); 
	var urlFin = urlE  + "/" +(urlAfter+5);
	alert(urlFin);
	
	var data = document.getElementById("searchKeyword").value
	var column = document.getElementById("searchCondition").value
		
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
                    <h1 class="h3 mb-2 text-gray-800">결제내역</h1>
                    <p class="mb-4"> </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">결제 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
    <input type="hidden" id ="searchCondition" name="searchCondition" value="${search.searchCondition}">
	<input type="hidden" id ="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" >
	<input type ="hidden" id="startPage" name ="startPage" value="${paging.startPage}">
	<input type ="hidden" id="endPage" name ="endPage" value="${paging.endPage}">
	<input type ="hidden" id="pageNo" name ="pageNo" value="${paging.pageNo}"> 
	
<form action="/kherb/admin/order/1" method="post">		
<input type ="hidden" value="/kherb/admin/order/${paging.pageNo}/${search.searchCondition}/${search.searchKeyword}">
<div id="selectdiv">
		<select name="searchCondition" class="txt" id = "column" onchange="select(this);" >
			<c:forEach items="${conditionMap}" var="option"  varStatus="status">
			<option value="${option.key}" >${option.value}</option>
			</c:forEach>
		</select>
		<input type="text" id="searchData" name="searchKeyword" class="selecttext" value="${search.searchKeyword}" />
		<input type="submit" value="검색" />
</div>                            
</form> 
<table class="table table-bordered" id="dataTable">
 
		<tr>
		    <th>주문번호</th>
		    <th>주문일자</th>
		    <th>주문자 ID</th>
			<th>상품명</th>
			<th>최종가격</th>
			
		</tr>
		<c:if test="${allOrder != null }">
		<c:forEach var="ao" items="${allOrder}">
		<input type ="hidden" id = "payno" name ="payno" value="${ao.payno}">
		<tr>
		    <td><a href="javascript:void(0)" onClick="javascript:moveDetail(this)" id="payno">${ao.payno}</a></td>
		    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ao.odate}"/></td>
		    <td>${ao.id}</td> 
			<td>${ao.product}</td>
			<td>${ao.totalprice}</td>
		</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty allOrder }">
			<tr>
			<td></td>
			<td></td>
			<td>주문 내역이 없습니다</td>
			<td></td>
			<td></td>
			<td></td>
			</tr>
			</c:if>
	</table>
</div></div></div></div>
                <!-- /.container-fluid -->
<div class="row justify-content-md-center"> 
<div class="col-sm-12 col-md-7">
<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
<ul class="pagination">
	<c:if test="${paging.startPage > paging.pageSize}">
	<li class="paginate_button page_item previous" id="dataTable_previous">
		<a href="javascript:void(0)" onClick="javascript:moveBefore(this)" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	</li>
	</c:if>
	<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}">
		<c:if test="${pNo!=param.pageNo}">
		<li class="paginate_button page_item">
			<a href="javascript:void(0)" onClick="javascript:move(this)" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
		<%-- <a href="/kherb/admin/mem/${pNo}/">[${pNo}]</a> --%>
		</li>
		</c:if>
<!-- 		
	<c:if test="${pNo==param.pageNo}">	<li class="paginate_button page_item">
	<a href="/kherb/admin/mem/${pNo}" style="color:red;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">[${pNo}]</a>
	</li></c:if>
 -->
	</c:forEach>
		<c:if test="${paging.endPage < paging.totalPages}">
		<li>
		<a href="javascript:void(0)" onClick="javascript:moveAfter(this)"  aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
		</li></c:if>	
</ul>
</div>
	</div>
  </div>
	 	


<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
</body>
</html>