<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/AdminChart/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/AdminChart/css/sb-admin-2.min.css" rel="stylesheet">
	<script>
	function product(searchCondition, searchKeyword, page) {
		var f = document.product;
	
		f.searchCondition.value = searchCondition;
		f.searchKeyword.value = searchKeyword;
		f.page.value = page;
		f.action = "/admin/pro/data"
		f.method = "get"
		f.submit();
	};
	</script>
</head>
<body>
<form name="product">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="searchKeyword">
	<input type="hidden" name="page">
</form>

<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/info">
                <div class="sidebar-brand-text mx-3">K-Herb</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item infoMenu">
                <a class="nav-link" href="/admin/info">
                    <i class="fas fa-fw fa-chart-line"></i>
                    <span>메인 통계</span></a>
            </li>
            
         

            <!-- Divider 
            <hr class="sidebar-divider">    -->

            <!-- Heading 
            <div class="sidebar-heading">
                메뉴
            </div>
-->
            <!-- Nav Item - 상품 -->
            <li class="nav-item productMenu">
                <a class="nav-link" href="javascript:product('_','','1')">
                    <i class="fab fa-fw fa-product-hunt"></i>
                    <span>상품</span></a>
            </li>

            <!-- Nav Item - 회원 -->
            <li class="nav-item memberMenu">
                <a class="nav-link" href="/admin/mem">
                    <i class="fas fa-address-card"></i>
                 <!--   <i class="fas fa-address-book"></i> -->
                    <span>회원</span></a>
            </li>

            <!-- Nav Item - 매출 -->
            <li class="nav-item payMenu">
                <a class="nav-link" href="/admin/sale/1">
                    <i class="fas fa-donate"></i>
                    <span>매출</span></a>
            </li>

            <!-- Nav Item - 결제내역 -->
            <li class="nav-item orderMenu">
                <a class="nav-link" href="/admin/order">
                    <i class="fas fa-fw fa-credit-card"></i>
                    <span>결제내역</span></a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

        

        </ul>
        <!-- End of Sidebar -->
        
        

</body>
</html>