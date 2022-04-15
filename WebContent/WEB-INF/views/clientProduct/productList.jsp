<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>productList</title>
<style type="text/css">
.productsrow {
	text-align: center;
}
.empty  {
	text-align: center;
	vertical-align:middle;
	height:600px;
	font-size:30px;
}
#productListArea {
	flex: 1; 
	margin-right:18%;
	margin-left:18%;
	background-color: white;
	height: 1200px;
}
@media (max-width: 600px) {
  #productListArea {
   	margin-right:5%;
	margin-left:5%;
	height: 100%;
  }
}
.btnBox{
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
}
.title{
	text-align: center; 
}
.btnBox{
	display: flex;
	flex-wrap: nowrap;
}
.searchBox {
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
	margin-bottom: 10px;
}
.pageBox {
	display: flex;
	flex-wrap: nowrap;
	justify-content: flex-end;
}
.search {
	margin-right: 3px;
}
.searchText {
	width: 400px;
	height: 34px;
	font-size: 1.2rem;
	border-radius: 3px;
	border: 2px solid #666666;
	color: #2B2B2B;
}
.btnSearch {
	width: 100px;
	height: 40px;
	font-size: 1.2rem;
	border: 2px solid #666666;
	color: #000000;
	border-radius: 3px;
	font-weight: bold;
}
.procontainer {
  display: grid;
  grid: '. . .';
  gap: 16px; /* ⬅️ */
  /* row-gap: 16px; */
  /* column-gap: 16px; */
  grid-template-rows: 300px;
  text-align: center;
  margin:0 auto;
  width:100%;
  background-color: white;
}
.item { 
  padding: 0px;
  background: white; 
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
.btn{
	font-size: 2rem;
    text-align: center;
    font-weight: 600;
    color: gray;
    background-color: white;
    border: 0;
    outline: 0;
    padding: 0;
    -webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
}
.pagebtn{
	font-size: 1.5rem;
    text-align: center;
    font-weight: 300;
    color: gray;
    background-color: white;
    border: 0;
    outline: 0;
}
.checkbtn{
	font-size: 2rem;
    text-align: center;
    font-weight: 600;
    color: #777;
    background-color: white;
    border: 0;
    outline: 0;
    padding: 0;
    -webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
}
#productbox {
	text-align: center;
	width: 100%;
	height: 300px;
	padding: 0;
}
.price {
	font-size: 1.5rem;
    text-align: center;
    color: #222;
    font-weight: 600;
    text-decoration: none;
}
img.main {
	border: 1px solid #e9ebed;
	width: 350px;
	height: 350px;
	margin: 20px;
	position: relative;
}
@media (max-width: 600px) {
  img.main {
   	width: 250px;
	height: 250px;
	margin: 10px;
  }
}
table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
};
.slider{
	 background-color: white;
}
</style>
</head>
<body id="body">
<header>
<jsp:include page="../../../header.jsp" />
</header>
<form name="detail">
	<input type="hidden" name="cate">
	<input type="hidden" name="order">
	<input type="hidden" name="searchKeyword">
	<input type="hidden" name="page">
</form>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
<c:choose>
<c:when test="${searchKeyword ne '' }">
	<h3 class="page-name">'${searchKeyword }' 검색결과 : ${paging.total} 건</h3>
</c:when>
<c:when test="${cate eq 'all' }">
	<h3 class="page-name">전체 (${paging.total }개)</h3>
</c:when>
<c:when test="${cate eq 'raw' }">
	<h3 class="page-name">원물 (${paging.total }개)</h3>
</c:when>
<c:when test="${cate eq 'tea' }">
	<h3 class="page-name">액기스/티백 (${paging.total }개)</h3>
</c:when>
<c:when test="${cate eq 'pill' }">
	<h3 class="page-name">환 (${paging.total }개)</h3>
</c:when>
<c:when test="${cate eq 'powder' }">
	<h3 class="page-name">가루 (${paging.total }개)</h3>
</c:when>
</c:choose>
				</div>
			</div>
		</div>
	</div>
</section>
<c:choose>
<c:when test="${empty pro}">
	<div class=empty><div>검색 결과가 없습니다.</div></div>
</c:when>
<c:otherwise>
<div id="productListArea">
<div class="col-md-1" style="background-color:white">
<aside class="sidebar">
	<!-- Widget Category -->
	<div class="widget widget-category">
		<h4 class="widget-title">Menu</h4>
	</div> <!-- End category  -->
</aside>
</div>
	<div class="btnBox">
		<form action="${pageContext.request.contextPath}/pro/data" method="get">
			<div class="orderbtn">
				<c:choose>
					<c:when test="${order == 'pno'}">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="checkbtn" name="order" id="order" value="pno"><strong>> 신상순</strong></button>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="btn" name="order" id="order" value="pno">> 신상순</button>
					</c:otherwise>
				</c:choose>			
			</div>
		</form>
		<form action="${pageContext.request.contextPath}/pro/data" method="get">
			<div class="orderbtn">
				<c:choose>
					<c:when test="${order == 'hot'}">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="checkbtn" name="order" id="order" value="hot"><strong>> 인기순</strong></button>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="btn" name="order" id="order" value="hot">> 인기순</button>
					</c:otherwise>
				</c:choose>			
			</div>
		</form>
		<form action="${pageContext.request.contextPath}/pro/data" method="get">
			<div class="orderbtn">
				<c:choose>
					<c:when test="${order == 'pname'}">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="checkbtn" name="order" id="order" value="pnamed"><strong>> 품명순+</strong></button>
					</c:when>
					<c:when test="${order == 'pnamed'}">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="checkbtn" name="order" id="order" value="pname"><strong>> 품명순-</strong></button>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="btn" name="order" id="order" value="pname">> 품명순-</button>
					</c:otherwise>
				</c:choose>	
			</div>
		</form>
		<form action="${pageContext.request.contextPath}/pro/data" method="get">
			<div class="orderbtn">
				<c:choose>
					<c:when test="${order == 'price'}">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="checkbtn" name="order" id="order" value="priced"><strong>> 가격순+</strong></button>
					</c:when>
					<c:when test="${order == 'priced'}">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="checkbtn" name="order" id="order" value="price"><strong>> 가격순-</strong></button>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<input type="hidden" name="page" id="page" value="1"/>
						<button type="submit" class="btn" name="order" id="order" value="price">> 가격순-</button>
					</c:otherwise>
				</c:choose>	
			</div>
		</form>
	</div><br><br>
<section class="products section">
	<div class="productscontainer">
		<div class="productsrow">
		 	<c:forEach var="p" items="${pro}">
			<div class="col-md-4">
				<div class="product-item">
						<a href="${pageContext.request.contextPath}/pro/${pageInfo}/detail/${p.pno}"><img class="main" style="max-width:100%; max-height:auto;" src="<spring:url value='/resources/img/${p.img1}'/>" alt="${p.img1}" title="${p.img1}"/></a>
					<div class="product-content">
						<h4><a href="${pageContext.request.contextPath}/pro/${pageInfo}/detail/${p.pno}">${p.pname}</a></h4>
						<p class="price"><a href="/pro/${pageInfo}/detail/${p.pno}"><fmt:formatNumber type="number" maxFractionDigits="0"  value="${p.price}" />원</a></p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div><br>
	<div class="col-md-12">
	<table>		
		<tr>
			<td><div class="pageBox">
				<c:if test="${paging.startPage > paging.pageSize}">
					<form action="${pageContext.request.contextPath}/pro/data" method="get">
						<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
						<input type="hidden" name="order" id="order" value="${order}"/>
						<input type="hidden" name="cate" id="cate" value="${cate}"/>
						<button type="submit" class="pagebtn" name="page" id="page" value="${paging.startPage - paging.pageSize}">[이전]</button>
					</form>
				</c:if>
					<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}">
						<c:if test="${pNo!=param.pageNo}">
							<form action="${pageContext.request.contextPath}/pro/data" method="get">
								<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
								<input type="hidden" name="order" id="order" value="${order}"/>
								<input type="hidden" name="cate" id="cate" value="${cate}"/>
								<button type="submit" class="pagebtn" name="page" id="page" value="${pNo}">[${pNo}]</button>
							</form>
						</c:if>
						<c:if test="${pNo==param.pageNo}">
							<form action="${pageContext.request.contextPath}/pro/data" method="get">
								<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
								<input type="hidden" name="order" id="order" value="${order}"/>
								<input type="hidden" name="cate" id="cate" value="${cate}"/>
								<button type="submit" class="pagebtn" name="page" id="page" value="${pNo}" style="color:red;">[${pNo}]</button>
							</form>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.totalPages}">
						<form action="${pageContext.request.contextPath}/pro/data" method="get">
							<input type="hidden" name="searchKeyword" id="searchKeyword" value="${searchKeyword}" />
							<input type="hidden" name="order" id="order" value="${order}"/>
							<input type="hidden" name="cate" id="cate" value="${cate}"/>
							<button type="submit" class="pagebtn" name="page" id="page" value="${paging.startPage + paging.pageSize}">[다음]</button>
						</form>
					</c:if>
				</div>
			</td>
		</tr>
	</table>
</div>
</section>
</div>
</c:otherwise>
</c:choose>
<footer>
	<jsp:include page="../../../footer.jsp" />
</footer>
</body>
</html>