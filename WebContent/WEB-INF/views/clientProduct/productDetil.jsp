<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
	var sell_price;
	var amount;

	function init () {
		sell_price = document.getElementById('price').value;
		amount = document.getElementById('count').value;
		document.getElementById('tprice').value = sell_price;
		change();
	}

	function add () {
		hm = document.getElementById('count');
		sum = document.getElementById('tprice');
			if (hm.value < 20) {
				hm.value ++ ;
				sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	}

	function del () {
		hm = document.getElementById('count');
		sum = document.getElementById('tprice');
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	}

	function add2 () {
		hm = document.getElementById('count');
		sum = document.getElementById('tprice');
			if (hm.value < 100) {
				hm.value = parseInt(hm.value) + 10 ;
				sum.value = (parseInt(hm.value) * sell_price * 0.8).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	}

	function del2 () {
		hm = document.getElementById('count');
		sum = document.getElementById('tprice');
			if (hm.value > 30) {
				hm.value = parseInt(hm.value) - 10 ;
				sum.value = (parseInt(hm.value) * sell_price * 0.8).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	}

	function change () {
		hm = document.getElementById('count');
		sum = document.getElementById('tprice');

			if (hm.value < 0) {
				hm.value = 0;
			}
			if (${mem.mcode == 'D'}){
				sum.value = (parseInt(hm.value) * sell_price * 0.8).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			} else {
				sum.value = (parseInt(hm.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
	}  
	
	
	
</script>
<script>//--------------------------------------------도매일때 가격 넘기는거
	$(document).ready(function(){
		var mcodeD = "<c:out value='${mem.mcode}'/>";
		var dprice = "<c:out value='${p.price}' />";
		var dpricenum = Number(dprice)*0.8;
		if(mcodeD == 'D'){
			$('#price').val(dpricenum);
		}
	});	
</script>
<title>productDetail</title>
<style type="text/css">
@media (max-width:359px){html{font-size:8px;}}

@media (min-width:360px) and (max-width:768px){html{font-size:9px;}}
/* 768보다 큰 px */
@media (min-width:769px) and (max-width:992px){html{font-size:10px;}}

@media (min-width:993px) and (max-width:1200px){html{font-size:11px;}}

@media (min-width:1201px){html{font-size:12px;}}
.cart {
	width: 300px;
	text-align: center;
}
#center {
	text-align: center; 
}
.title{
	text-align: center; 
}
#details {
	border:1px solid #e9ebed;
	width:770px;
	margin-up:10%;
	padding:10px;
}
@media (max-width: 600px) {
  #details {
   	width:100%;
  }
}
#productDetailArea {
	margin-right:30%;
	margin-left:30%;
}
@media (max-width: 600px) {
  #productDetailArea {
   	margin-right:5%;
	margin-left:5%;
  }
}
.productBox {
	display: flex;
	flex-wrap: nowrap;
	justify-content: center;
	margin-bottom:5%;
}
#imgbox {
	width: 450px;
	height: 450px;
	border: 5px solid #e9ebed;
	border-radius: 5px;
	box-shadow: 2px 3px 5px 0px;
	display: inline-block;
	position: relative;
}
#countbox {
	display: flex;
	flex-wrap: nowrap;
}
#basicinfo {
	width: 30%;
	height: 300px;
	margin-right:10%;
	margin-left:10%;
	display: inline-block;
	position: relative;
}
#detailinfo {
	width: 100%;
	padding:2%;
	border: 5px solid #e9ebed;
	border-radius: 5px;
	box-shadow: 2px 3px 5px 0px;
	display: inline-block;
	position: relative;
}
#detailimgbox {
	display: flex;
	flex-wrap: nowrap;
}
img.main {
	border: 1px solid #e9ebed;
	width: 450px;
	height: 450px;
	margin: 0 auto;
	position: relative;
}
img.detail {
	border: 1px solid #e9ebed;
	width: 250px;
	height: 250px;
	margin: 0 auto;
	position: relative;
}
.basicContent {
	font-size: 1.5rem;
}

.detailContent {
	font-size: 1.2rem;
}
a {
	font-size: 1.5rem;
    text-align: center;
    font-weight: 400;
    text-decoration: none;
}
a:link { color: brown; }
a:visited { color: brown; }
a:hover { color: coral; }
a:active { color: khaki; }
#btnbox {
	margin-top:5%;
	text-align: center;
}
.buttonlist{
	width: 100px;
	height: 40px;
	font-size: 1.2rem;
	border: 3px solid #e9ebed;
	border-radius: 3px;
	background-color: white;
	font-weight: bold;
}
</style>
</head>
<body onload="init();">
<jsp:include page="../../../header.jsp" />
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h3 class="page-name">상품 정보</h3>
				</div>
			</div>
		</div>
	</div>
</section>
<section id="productDetailArea">
<form:form method="post" action="${pageContext.request.contextPath}/cart/insert" modelAttribute="productVO" enctype="multipart/form-data">
<input type="hidden" name="pno" value="${p.pno }" />
<input type="hidden" name="img1" value="${p.img1 }" />
<input type="hidden" name="pname" value="${p.pname}" />
		<section class="single-product">
	<div class="container">
		<div class="row mt-20">
			<div class="col-md-5">
				<div class='carousel-outer'>
				<!-- me art lab slider -->
					<div class='carousel-inner '>
							<img class="main" style="max-width:100%; max-height:auto;" src="<spring:url value='/resources/img/${p.img1}'/>" alt="${p.img1}"/>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
					<h2>품 명: ${p.pname}</h2>
					<p class="product-price">분 류 : ${p.ptype}</p><br><br><br>
					<div class="product-quantity">
						<span>개당 가격 :</span>
						<div class="product-quantity-slider">
							<input type="text" name="vprice" class="basicContent" id="vprice" value="<fmt:formatNumber value="${p.price}" pattern="#,###" />" readonly required>
							<c:choose>
								<c:when test="${mem.mcode == 'D'}">
									<input type="hidden" name="price" id="price" value="${p.price}" />
								</c:when>
								<c:otherwise>
									<input type="hidden" name="price" id="price" value="${p.price}" />
								</c:otherwise>
							</c:choose>	
						</div>
					</div>
						<div class="product-quantity">
							<span>수 량 :</span>
						<div class="product-quantity-slider">
						<c:choose>
  							<c:when test="${mem.mcode == 'D'}"> 
  								<input type="button" value=" - " onclick="del2();">
  								<input type="text" name="pcount" class="basicContent" id="count" value="30" size="4" readonly/>
  								<input type="button" value=" + " onclick="add2();">
  							</c:when>
  							<c:otherwise>
  								<input type="button" value=" - " onclick="del();">
  								<input type="text" name="pcount" class="basicContent" id="count" value="1" size="4" readonly/>
  								<input type="button" value=" + " onclick="add();">
  							</c:otherwise>
  						</c:choose>
  						</div>
					</div>
					<div class="product-quantity">
						<c:choose>
  							<c:when test="${mem.mcode == 'D'}">
								<span>총 액(20%할인):</span>
							</c:when>
							<c:otherwise>
								<span>총 액 :</span>
							</c:otherwise>
						</c:choose>	
						<div class="product-quantity-slider">
							<c:choose>
  								<c:when test="${mem.mcode == 'D'}">	
  									<div><input type="text" name="tprice" class="basicContent" id="tprice" value="<fmt:formatNumber value="${p.price*24}" pattern="#,###" />" onkeyup= "inputNumberFormat(this)" readonly required></div>
  								</c:when>
  								<c:otherwise>
  									<div><input type="text" name="tprice" class="basicContent" id="tprice" value="<fmt:formatNumber value="${p.price}" pattern="#,###" />" readonly required></div>
  								</c:otherwise>
  							</c:choose>
						</div>
					</div>
						<div class="cart"><br><br><br>
							<button type="submit" class="btn-main" value="insert">담 기</button>
						</div>
				</div>	
			</div>
			<br>
		</div>
		</div>
</section> 
</form:form>
		<br>
		<div class="row">
			<div class="tab-content patternbg">
				<div id="details" class="tab-pane fade active in">
					<h2>
<span>PRODUCT DESCRIPTION</span> INFO</h2>
					<h3>상세 설명</h3>
					<div class="fright up_box"><a href="#">위로가기</a></div>
					<p>${p.detail}</p>
					<p id="center">
					<!--  
					<img class="detail" src="<spring:url value='/resources/img/${p.img1}'/>" alt="${p.img1}" title="${p.img1}"/>
					<img class="detail" src="<spring:url value='/resources/img/${p.img2}'/>" alt="${p.img2}"/>-->
					</p>
					<jsp:include page="./exchangeInfo.jsp"/>
				</div>
			</div>
		</div>  
</section>
<form method="get" action="/pro/data">
	<div id="btnbox">
    	<button type="submit" class="btn-main" style="margin-bottom:20px;">목록</button>
    	<input type="hidden" name="cate" value="${data.ptype}">
		<input type="hidden" name="order" value="${data.order}">
		<input type="hidden" name="searchKeyword" value="${data.searchKeyword}">
		<input type="hidden" name="page" value="${data.page}">	
    </div>	
</form>  
<jsp:include page="../../../footer.jsp" />    	
</body>
</html>