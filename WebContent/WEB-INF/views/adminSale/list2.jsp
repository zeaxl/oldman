<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="forms/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="forms/css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body>
<h1>${cafeUserVO.name}환영합니다! ${userName}  님 </h1>
 <!-- Topbar Search -->
  <form action="list.do" method="post">
   
     <div class="input-group">
       <div class="col-sm-2 "> 
	   <select class="form-control  hidden-xs"  name="TITLE">
       <c:forEach items="${Search}" var="option">
       <option value="${option.value}">${option.key} </option>
    
    </c:forEach>      
        </select></div>
   <div class="col-sm-6"> 
   <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
    name="CONTENT" id="CONTENT">   </div>
    <button class="btn btn-primary" type="submit">
    <i class="fas fa-search fa-sm"></i>
    </button>
   
    </div>
    </form>
 
 
 <table border="1" cellpadding="0" cellspacing="0" width="700" style="text-align: center;">
 <tr>
   <th bgcolor="orange" width="100">상품명</th>
   <th bgcolor="orange" width="200">매출액</th>
   <th bgcolor="orange" width="150">판매량</th>
    <th bgcolor="orange" width="150">비율</th>
   
   </tr>
 <c:forEach items="${SaleInfo}" var="SaleInfo">
   <tr>
   <td>${SaleInfo.pno}</td>
   <td>${SaleInfo.pname}</td>
    <td>${SaleInfo.price}</td>
        <td>${SaleInfo.pcount}</td>
        <td>${SaleInfo.odate}</td>
        
         
     </tr>

</c:forEach>
    </table>
    
 
</body>
</html>