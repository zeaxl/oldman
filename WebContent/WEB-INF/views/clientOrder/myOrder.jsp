<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 결제내역</title>
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
</head>
<body>

<jsp:include page="/header.jsp"></jsp:include>


<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h3 class="page-name">나의 결제내역</h3>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="page-wrapper">
  	<div class="purchase-confirmation shopping">
    	<div class="container">
      		<div class="row">
      		
      		
 <div class="col-md-3">
<aside class="sidebar">
	<!-- Widget Category -->
	<div class="widget widget-category">
		<h4 class="widget-title">Menu</h4>
		<ul class="widget-category-list">
	        <li><a href="/my/order/1"><strong>내 결제내역</strong></a>
	        </li>
	        <li><a href="/my/info">내 가입정보</a>
	        </li>
	        <li><a href="/my/del">탈퇴하기</a>
	        </li>
	    </ul>
	</div> <!-- End category  -->
</aside>
</div>
      		
      		
<div class="col-md-8 col-md-offset-1">
          			<div class="block ">
            			<div class="purchase-confirmation-details">
<input type="hidden" name="id" value="${sessionMember.id }" />


<table id="purchase-receipt" class="table"> 
 <tr>
		    <th>주문번호</th>
		    <th>주문일자</th>
		    <th>상품명</th> 
			<th>최종가격</th>
		</tr>
		<c:forEach var="mo" items="${myOrder}">
		
		<tr>
		    <td style="cursor:pointer;" onclick="location.href='/my/order/${pageinfo}/${mo.payno}'">${mo.payno}</td> 
		    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mo.odate}"/></td>
		    <td>${mo.product }</td>
			<td><fmt:formatNumber pattern="###,###,###" value="${mo.totalprice}" /> 원</td>
		</tr>
		</c:forEach> 
	</table>
	
	<div class="pagebox">
<div class="row justify-content-md-center"> 
<div class="col-sm-12 col-md-7" align="right">
<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
<ul class="pagination">
<c:if test="${paging.startPage > paging.pageSize}">
	<li class="paginate_button page_item previous" id="dataTable_previous">
	<a href="/my/order/${paging.startPage - paging.pageSize}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	</li>
</c:if>
<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}">
<c:if test="${pNo!=param.pageNo}">
<li class="paginate_button page_item">
	<a href="/my/order/${pNo}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
</li>		
</c:if>
<c:if test="${pNo==param.pageNo}">
<li class="paginate_button page_item">
	<a href="/my/order/${pNo}" style="color:red;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">${pNo}</a>
	</li>
<a href="/my/order/${pNo}" style="color:red;">${pNo}</a>
</c:if>
</c:forEach>
<c:if test="${paging.endPage < paging.totalPages}">
<li class="paginate_button page_item">
	<a href="/my/order/${paging.startPage + paging.pageSize}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a>
</li>
</c:if>
</ul></div></div></div></div>
</div></div></div></div></div></div></div>

 
<jsp:include page="/footer.jsp"></jsp:include>
 
 
</body>
</html>
