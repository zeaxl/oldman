<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>   
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
<script>
$(document).ready(function(){
	$(".memberMenu").addClass("active");
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
	var urlE = urlD.substring(4,20);
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
//상세보기 전달하는 값(검색/페이지값/mno)
	function moveDetail(mno){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
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
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", mnoD);
		
		
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
}
</script>
<script>
//상세보기 승인 버튼(검색/페이지값/mno)
	function moveAgree(mno){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" +pNo + "/"+ "detail" + "#btnPass" ;
	
	var data = document.getElementById("searchKeyword").value ;
	var column = document.getElementById("searchCondition").value ;
	var mnoF = mno.parentNode;
	var mnoS = mnoF.parentNode;
	var mnoD = mnoS.childNodes[1].innerHTML;
	console.log(urlFin);
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
		input3.setAttribute("value", mnoD);
		
		
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
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlBF = mv.innerText.substring(1,mv.innerText.length-1);
	var urlFin = urlE  + "/" +urlBF;
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
	var urlE = urlD.substring(4,20);
	var urlBefore = document.getElementById("startPage").value;
	urlBefore = Number(urlBefore);
	var urlFin = urlE  + "/" +(urlBefore-5);
	console.log(urlFin);
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
	var urlE = urlD.substring(4,20);
	var urlAfter = document.getElementById("startPage").value;
	urlAfter = Number(urlAfter); 
	var urlFin = urlE  + "/" +(urlAfter+5);
	console.log(urlFin);
	
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
//  삭제 후 > 회원 List로 이동
	function moveListDel(mno){
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var pNo = document.getElementById("pageNo").value ;
	
	var urlFin = urlE  + "/" +pNo +"/" +"del";
	
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
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", mnoD);
				
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
  
  <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
     
  <!-- JS 회원리스트 -->
  <div class="col-xm-2" id ="mcodeArr">
  <select class="form-control  hidden-xs col-sm-12" id="list" name="list" onchange="location.href=this.value">
  <option value="http://localhost:8080/admin/mem" selected>전체회원</option>
  <option value="http://localhost:8080/admin/mem/so/1" >일반회원</option>
  <option value="http://localhost:8080/admin/mem/do/1" >사업자회원</option>
  </select>
  </div>
  
  </div>
<div class="card-body">
<div class="table-responsive">

<!-- ?? --> 
	
	<input type="hidden" id ="searchCondition" name="searchCondition" value="${search.searchCondition}">
	<input type="hidden" id ="searchKeyword" name="searchKeyword" value="${search.searchKeyword}" >
	<input type ="hidden" id="startPage" name ="startPage" value="${paging.startPage}">
	<input type ="hidden" id="endPage" name ="endPage" value="${paging.endPage}">
	<input type ="hidden" id="pageNo" name ="pageNo" value="${paging.pageNo}"> 

<!-- 검색 시작 -->
<div id="memSearch">
<form action="/admin/mem/1" method="post">		
<input type ="hidden" value="/admin/mem/${paging.pageNo}/${search.searchCondition}/${search.searchKeyword}">
<div id="selectdiv" class="input-group">
	<div class="col-xm-2">
		<select name="searchCondition" class="form-control" id = "column" onchange="select(this);" >
			<c:forEach items="${conditionMap}" var="option"  varStatus="status">
			<option value="${option.key}" >${option.value}</option>
			</c:forEach>
		</select>
		</div>
		<input type="text" id="searchData" name="searchKeyword" class="form-control bg-light border-0 small col-sm-7" value="${search.searchKeyword}" placeholder="Search for..."  />
		<input type="submit" class="btn btn-primary" value="검색" />
</div>                            
</form> 
</div>
 <div id="memJoinBtn" class="d-block"><a href ="/admin/mem/join"><button class="btn btn-primary">회원등록</button></a></div>            
 
 <div>&nbsp;</div>
 <table class="table table-bordered" id="dataTable">
 <thead>
<tr>
			<th class="d-none d-sm-table-cell">회원번호</th>
			<th class="d-table-cell">아이디</th>
			<th class="d-table-cell">이름</th>
			<th class="d-none d-sm-table-cell">생년월일</th>
			<th class="d-none d-md-table-cell">주소</th>
			<th class="d-none d-md-table-cell">상세주소</th>
			<th class="d-table-cell">연락처</th>
			<th class="d-none d-md-table-cell">가입일</th>
			<th class="d-none d-md-table-cell">승인여부</th>
			<th class="d-table-cell">회원분류</th>
			<th class="d-none d-md-table-cell">삭제</th>
		</tr>
<tbody>
<c:choose>
<c:when test="${empty member}">
<tr>
 		<td colspan="11">검색된 회원이 없습니다.</td>
 	</tr>
</c:when>
<c:otherwise>

<c:forEach var="m" items="${member}">
<input type ="hidden" id = "mno" name ="mno" value="${m.mno}">
	
		<tr>
			<td class="d-none d-sm-table-cell">${m.mno}</td>
			<td class="d-table-cell"><a href="javascript:void(0)" onClick="javascript:moveDetail(this)">${m.id}</a></td>
			<td class="d-table-cell">${m.name}</td>
			<td class="d-none d-sm-table-cell">${m.birth}</td>
			<td class="d-none d-md-table-cell">${m.addr1}</td>
			<td class="d-none d-md-table-cell">${m.addr2}</td>
			<td class="d-table-cell">${m.hp}</td>
			<td class="d-none d-md-table-cell">${m.joindate}</td>
<c:choose>
<c:when test="${m.pass eq 'F' }">
	<td class="d-none d-md-table-cell"><a href="javascript:void(0)" onClick="javascript:moveAgree(this)" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">승인</a></td>
</c:when>
<c:when test="${m.pass eq 'T' }">
	<td class="d-none d-md-table-cell">완료</td>
</c:when>
</c:choose>
<c:choose>
<c:when test="${m.mcode eq 'S' }">
	<td class="d-table-cell">일반</td>
</c:when>
<c:when test="${m.mcode eq 'D' }">
	<td class="d-table-cell">사업자</td>
</c:when>
</c:choose>
			<td class="d-none d-md-table-cell"><input type="button" value="삭제" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"onclick="javascript:moveListDel(this)" /></td>
		</tr> 
		</c:forEach>
	
</c:otherwise></c:choose>
</tbody>
</table>


   </div>
  </div>
</div>
 </div>
 
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
			<a href="javascript:void(0)" onClick="javascript:move(this)" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">[${pNo}]</a>
		<%-- <a href="/admin/mem/${pNo}/">[${pNo}]</a> --%>
		</li>
		</c:if>
<!-- 		
	<c:if test="${pNo==param.pageNo}">	<li class="paginate_button page_item">
	<a href="/admin/mem/${pNo}" style="color:red;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">[${pNo}]</a>
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
  <!-- End of Main Content -->

 <!-- Footer -->
<jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
      </div>
 <!-- End of Content Wrapper -->
 </div>
 <!-- End of Page Wrapper -->
	 	</div>
</body>
</html>