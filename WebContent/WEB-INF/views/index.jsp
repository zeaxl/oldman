<!-- 
THEME: Aviato | E-commerce template
VERSION: 1.0.0
AUTHOR: Themefisher

HOMEPAGE: https://themefisher.com/products/aviato-e-commerce-template/
DEMO: https://demo.themefisher.com/aviato/
GITHUB: https://github.com/themefisher/Aviato-E-Commerce-Template/

WEBSITE: https://themefisher.com
TWITTER: https://twitter.com/themefisher
FACEBOOK: https://www.facebook.com/themefisher
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>index</title>


<script>
function all(cate, order, searchKeyword, page) {
	var f = document.all;

	f.cate.value = cate;
	f.order.value = order;
	f.searchKeyword.value = searchKeyword;
	f.page.value = page;
	f.action = "/pro/data"
	f.method = "get"
	f.submit();
};
</script>
<style>
.section {
    padding: 0 !important;
}
.hero-slider {
background-image: url("${pageContext.request.contextPath}/resources/memberImg/index_600.png");
background-repeat: no-repeat;
background-size: cover;

}

.product-thumb {
	width:100%;
	height:100%;
	border:1px solid #e9ebed;
	background-color:#EDCDED;
}
.product-item .product-thumb img {
	width:100%;
	height:100%;
}

@media (min-width:1200px){
            .product-thumb {
				width:358px;
				height:358px;
			}
			
			.product-item .product-thumb img {
				width:100%!important;
				height:100%!important;
			}
        }
        
@media (min-width:992px) and (max-width:1199px){
            .product-thumb {
				width:300px;
				height:300px;
			}
			
			.product-item .product-thumb img {
				width:100%!important;
				height:100%!important;
			}
        }
        
@media (max-width:991px){
            .product-thumb {
				width:100%;
				height:0;
				padding-top:100%;
				position:relative;
			}
			
			.product-item .product-thumb img {
				width:100%!important;
				height:100%!important;
				position:absolute;
				top:0;
				left:0;
			}
        }        
</style>
</head>

<body id="body">

<jsp:include page="/header.jsp" />

<div class="hero-slider">
  <div class="slider-item th-fullpage hero-area" >
    <div class="container">
      <div class="row">
        <div class="col-lg-8 text-center">
          <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">Product</p>
       		<h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">한약재를 파는 KHerb 입니다.</h1>
          <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="javascript:all('all','_','','1');">Shop Now</a>
        </div>
      </div>
    </div>
  </div>
  
</div>


<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h1>인기 상품</h1>
			</div>
		</div>
		<div class="row">
			
		<c:forEach var="p" items="${popularPro}">
			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb">
						<a href="${pageContext.request.contextPath}/pro/detail/${p.pno}"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/${p.img1}" alt="${p.img1}" title="${p.img1}"/></a>
					</div>
					<div class="product-content">
						<h4><a href="${pageContext.request.contextPath}/pro/detail/${p.pno}">${p.pname}</a></h4>
						<p class="price"><a href="${pageContext.request.contextPath}/pro/detail/${p.pno}">${p.price}</a></p>
					</div>
				</div>
			</div>
			</c:forEach>

		</div>
	</div>
</section>
<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h1>추천 상품</h1>
			</div>
		</div>
		<div class="row">
			
			<c:forEach var="p" items="${recomPro}">
			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb">
						<a href="${pageContext.request.contextPath}/pro/detail/${p.pno}"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/${p.img1}" alt="${p.img1}" title="${p.img1}"/></a>	
					</div>
					<div class="product-content">
						<h4><a href="${pageContext.request.contextPath}/pro/detail/${p.pno}">${p.pname}</a></h4>
						<p class="price"><a href="${pageContext.request.contextPath}/pro/detail/${p.pno}">${p.price}</a></p>
					</div>
				</div>
			</div>
			</c:forEach>

		</div>
	</div>
</section>
<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h1>새로나온 상품</h1>
			</div>
		</div>
		<div class="row" id="newProduct">
			
			<c:forEach var="p" items="${newProData}">
			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb">
						<a href="${pageContext.request.contextPath}/pro/detail/${p.pno}"><img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/${p.img1}" alt="${p.img1}" title="${p.img1}"/></a>	
					</div>
					<div class="product-content">
						<h4><a href="${pageContext.request.contextPath}/pro/detail/${p.pno}">${p.pname}</a></h4>
						<p class="price"><a href="${pageContext.request.contextPath}/pro/detail/${p.pno}">${p.price}</a></p>
					</div>
				</div>
			</div>
			</c:forEach>

		</div>
	</div>
</section>


<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>