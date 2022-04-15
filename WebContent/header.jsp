<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>


  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
 
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/themefisher-font/themefisher-font-style.css">

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
     <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap 3.1 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- Main Js File -->
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
    
    <script src="https://kit.fontawesome.com/d87a968af3.js" crossorigin="anonymous"></script>
    
    
    
    
    
<script>
	function all(cate, order, searchKeyword, page) {
		var f = document.all;
		var path = location.pathname.substring(0,7);
	
		f.cate.value = cate;
		f.order.value = order;
		f.searchKeyword.value = searchKeyword;
		f.page.value = page;
		f.action = path + "pro/data"
		f.method = "get"
		f.submit();
		alert(path);
	};
</script>
<style>
    .proSearch {
        padding: 10px 23px;
        width: 300px;
    }

    .form-search {
        float: left;
        width: 180px;
        height: 30px;
    }

    @media (min-width:768px) and (max-width:991px) {
        .proSearch {
            padding: 10px 23px;
            width: 220px;
        }

        .form-search {
            float: left;
            width: 110px;
            height: 30px;
        }
        .carttable td:nth-child(5) input {width:4rem;}
        .carttable td:nth-child(7) input {width:7rem;}
    }

    @media (max-width:767px) {    
    	.carttable td input {font-size:12px!important;}
    	
	    .carttable td:nth-child(3) div {
	    	width:80px;
	    	height:80px;
	    }
	    .carttable td:nth-child(3) img {
	    	width:100%;
	    	height:100%;
	    } 
	    .carttable td:nth-child(4) div {
	    	width:80px;
	     	font-size:12px;
	    }
	    .carttable th:nth-child(4) {display:none;}
	    .carttable td:nth-child(5) {display:none;}
	    .carttable td:nth-child(6) {
	    	display:block;

	    	border:0;
	    	width:100px;
	    	height:60px;
	    	position:relative;
	    } 
	    .carttable td:nth-child(6) #pcount {
	    	width:36.5px!important;
	    	height:20px;
	    } 
		.count_btn {width:20px; height:20px; text-align:center;}
		.carttable td:nth-child(6) button {
			position:absolute;
			bottom:0;
			left:23px;
			
		}
	    .carttable td:nth-child(7) input {width:8rem;}

	    

    }

    @media (max-width:576px) {
        #sumprice {
            text-align: center !important;
        }
    }
    
    @media (max-width:519px) {
	    .carttable td:nth-child(3) div {
	    	width:70px;
	    	height:70px;
	    }
	    .carttable td:nth-child(3) img {
	    	width:100%;
	    	height:100%;
	    } 	    
		.carttable td:nth-child(7) input {width:7rem;}
		.table-wrap {overflow-x: auto; }
    }    
    
</style>

</head>
<body>
<form name="all">
	<input type="hidden" name="cate">
	<input type="hidden" name="order">
	<input type="hidden" name="searchKeyword">
	<input type="hidden" name="page">
</form>

<!-- Start Top Header Bar -->
<section class="top-header">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="${pageContext.request.contextPath}/">
						<!-- replace logo here -->
						<svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink">
							<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="40"
								font-family="AustinBold, Austin" font-weight="bold">
								<g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
									<text id="AVIATO">
										<tspan x="108.94" y="325">KHerb</tspan>
									</text>
								</g>
							</g>
						</svg>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Cart -->
				<ul class="top-menu text-right list-inline">
					<li class="dropdown cart-nav dropdown-slide">
						<a href="/cart" ><i class="tf-ion-android-cart"></i>Cart</a>
					</li><!-- / Cart -->

<c:choose>
<c:when test="${sessionMember.id eq null }" >
					<!-- Login -->
					<li class="">
						<a href="${pageContext.request.contextPath}/login" ><i class="tf-ion-log-in"></i>Login</a>
					</li><!-- / Login -->

					<!-- Join -->
					<li class="">
						<a href="${pageContext.request.contextPath}/join" ><i class="tf-ion-android-person-add"></i>Join</a>
					</li><!-- / Join -->
</c:when>
<c:when test="${sessionMember.id != null }" >
					<!-- Login -->
					<li class="">
						<a href="${pageContext.request.contextPath}/my/order" ><i class="tf-ion-person"></i>${sessionMember.name }</a>
					</li><!-- / Login -->

					<!-- Join -->
					<li class="">
	<c:choose>
	<c:when test="${sns=='kakao' }">
		<a href="https://kauth.kakao.com/oauth/logout?client_id=498e27eb054a07c095df9b6443e32aef&logout_redirect_uri=http://localhost:8080/logout">
		<i class="tf-ion-log-out"></i>Logout</a>
	</c:when>
	<c:when test="${sns=='naver' }">
		<a href="${pageContext.request.contextPath}/logout" >	
		<i class="tf-ion-log-out"></i>Logout</a>
	</c:when>
	<c:otherwise>
			<a href="${pageContext.request.contextPath}/logout" ><i class="tf-ion-log-out"></i>Logout</a>			
	</c:otherwise>
	</c:choose>			
					</li><!-- / Join -->
</c:when>
</c:choose>


				</ul><!-- / .nav .navbar-nav .navbar-right -->
			</div>
		</div>
	</div>
</section><!-- End Top Header Bar -->


<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<div class="navbar-header">
				<h2 class="menu-title">Main Menu</h2>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

			</div><!-- / .navbar-header -->

			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<!-- Home -->
					<li class=" ">
						<a href="${pageContext.request.contextPath}/">Home</a>
					</li><!-- / Home -->

						<!-- Elements -->
					<li class="dropdown">
						<a href="javascript:all('all','_','','1');">전체보기</a>
					</li><!-- / Elements -->
					
					<li class="dropdown">
						<a href="javascript:all('raw','_','','1');">원물</a>
					</li><!-- / Elements -->

					<li class="dropdown">
						<a href="javascript:all('tea','_','','1');">액기스/티백</a>
					</li><!-- / Elements -->

					<li class="dropdown">
						<a href="javascript:all('pill','_','','1');">환</a>
					</li><!-- / Elements -->

					<li class="dropdown">
						<a href="javascript:all('powder','_','','1');">분말</a>
					</li><!-- / Elements -->


					<li class="">
					<div class="proSearch">
				<form method="get" action="/pro/data" id="proSearch" >
				<input type="hidden" name="order" id="order" value="_"/>		
				<input type="hidden" name="cate" id="cate" value="all"/>
				<input type="hidden" name="page" id="page" value="1"/>
				<c:choose>	
					<c:when test = "${searchKeyword == ''}">
						<input type="text" class="form-control form-search" id="searchKeyword" name="searchKeyword" placeholder="상품명 검색" >
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control form-search" id="searchKeyword" name="searchKeyword" value="${searchKeyword}"  placeholder="상품명 검색" >
					</c:otherwise>
				</c:choose>	
				<button type="submit" class="btn btn-main" style="padding:10px 15px; font-size:16px;"><i class="fa-solid fa-magnifying-glass"></i></button>	
<!-- <a href="javascript:;" onclick="document.getElementById('proSearch').submit();"><i class="tf-ion-search"></i></a> -->
		</form></div>
					</li><!-- / Elements -->

				</ul><!-- / .nav .navbar-nav -->

			</div>
			<!--/.navbar-collapse -->
		</div><!-- / .container -->
	</nav>
</section>



</body>
</html>