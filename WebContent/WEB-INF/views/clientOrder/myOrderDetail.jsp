<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 결제내역 상세</title>
<style type="text/css">

td {
 text-align : center !important;	
 vertical-align : middle !important;
}

th {
 text-align : center !important;
 vertical-align : middle !important;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function del() {
	
    var odate = new Date($("#odate").val())
	
	
    var oyear = odate.getFullYear();
    console.log(oyear);
	var omonth =  odate.getMonth() + 1;
	 console.log(omonth);
	var oday = odate.getDate();
	 console.log(oday);
	var odatesum =  oyear + omonth + oday;
	
	var delcon = confirm("주문을 취소하시겠습니까?");
	
	if(odatesum < (odatesum + 7)) {
		  
		if(delcon) {
			alert("주문 취소 완료");
			document.getElementById('orderDelete').submit();

		} else {
			
			alert("주문 취소 실패");
		}

	} else {
		alert("주문 이후 7일이 경과하여 취소가 불가능합니다.");
		return location.reload();
	}
  }
</script>
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
	        <li><a href="/my/order"><strong>내 결제내역</strong></a>
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
		    <th>주문자 성명</th>
		    <th>우편번호</th>
		    <th>주소</th>
		   <c:set var="sum" value="0" />
		</tr>
		<c:forEach var="d" items="${myOrderDetail}" end="">
		 <input type="hidden" value="${d.odate}" name="odate" id="odate">
		<tr>
		    <td>${d.payno}</td>
		    <td><fmt:formatDate value="${d.odate}" pattern="yyyy-MM-dd" /></td>
		    <td>${d.oname}</td>
		    <td>${d.opostcode}</td>
		    <td>${d.oaddr1} ${d.oaddr2}</td>
		 </tr>
		 </c:forEach>
		 </table>
		 </div></div></div>
		 <div class="col-md-8 col-md-offset-1">
         <div class="block ">
         <div class="purchase-confirmation-details">
       <table id="purchase-receipt" class="table"> 
        <tr>
		    <th>상품사진</th>
		    <th>상품명</th>
			<th>상품가격</th>
			<th>상품개수</th>
			<th>합계가격</th>
		</tr>
		
		<c:forEach var="d" items="${myOrderDetail}">
		<tr>
		    <td><img class="detail" width="80p" height="80p" src="<spring:url value='/resources/img/${d.pname}.png'/>" alt="${d.pname}" title="${d.pname}"/></td>
		    <td>${d.pname}</td>
		    <td>${d.price}</td>
		    <td>${d.pcount}</td>
			<td><fmt:formatNumber pattern="###,###,###" value="${d.pcount * d.price}" /> 원</td>
		</tr>
		<c:set var="sum" value="${sum + (d.price * d.pcount)}" />
		</c:forEach>
		</table>
		
		
		<div class="sum">
        <h4 align="right">결제금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</h4>
         </div>
		

	
</div></div></div>
</div></div></div></div>
<div align="center">
  <c:forEach var="d" items="${myOrderDetail }" end="0">
  <form action="/my/order/del" name="orderDelete" id="orderDelete" method="post">
  <input type="hidden" value="${d.payno }" id="payno" name="payno"/>
  <input type="button" value="주문취소" onclick="del()"/>
  </form>
  </c:forEach> 
  <button onclick="location.href='/my/order/${pageinfo}'">목록으로 </button>
 
</div>

<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>