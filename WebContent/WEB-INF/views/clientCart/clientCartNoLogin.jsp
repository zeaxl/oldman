<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>K-Herb</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../../resources/css/tablestyle.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  <script>
  //수량변경-------------------------------------------------------------
  	function plus(obj) {
	  	var hm = $(obj).parent().children('input[id=pcount]');
		var hmv = $(obj).parent().children('input[id=pcount]').val();
		var pr = $(obj).parent().parent().children().children('input[id=price]');
		var prv = $(obj).parent().parent().children().children('input[id=price]').val();
		var sum = $(obj).parent().parent().children().children('input[id=tprice]');
		var sumv = $(obj).parent().parent().children().children('input[id=tprice]').val();
		
		if (hmv < 20) {
		 var pcount1 = Number(hmv) + 1 //수량1씩추가
		 var pcount2 = hm.val(pcount1); //1추가된걸 hm에 담아
		 var price1 =  prv.substring(0,prv.length-1); // 16,000
		 var price2 = price1.replace(/\,/g,""); //16000 콤마를 없애준거
		 var tprice1 = pcount1 * Number(price2) //수량*단가
		 var tprice2 = String(tprice1).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
		 var tprice3 = sum.val(tprice2);
			}
	}

	function minus (obj2) {
		var hm = $(obj2).parent().children('input[id=pcount]');
		var hmv = $(obj2).parent().children('input[id=pcount]').val();
		var pr = $(obj2).parent().parent().children().children('input[id=price]');
		var prv = $(obj2).parent().parent().children().children('input[id=price]').val();
		var sum = $(obj2).parent().parent().children().children('input[id=tprice]');
		var sumv = $(obj2).parent().parent().children().children('input[id=tprice]').val();
			if (hmv > 1) {
				var pcount1 = Number(hmv) - 1 
				var pcount2 = hm.val(pcount1); 
				var price1 =  prv.substring(0,prv.length-1); 
				var price2 = price1.replace(/\,/g,""); 
				var tprice1 = pcount1 * Number(price2) 
				var tprice2 = String(tprice1).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
				var tprice3 = sum.val(tprice2);
			}
	}

	function plus2 (obj3) {
		var hm = $(obj3).parent().children('input[id=pcount]');
		var hmv = $(obj3).parent().children('input[id=pcount]').val();
		var pr = $(obj3).parent().parent().children().children('input[id=price]');
		var prv = $(obj3).parent().parent().children().children('input[id=price]').val();
		var sum = $(obj3).parent().parent().children().children('input[id=tprice]');
		var sumv = $(obj3).parent().parent().children().children('input[id=tprice]').val();

		if (hmv < 100) {
			 var pcount1 = Number(hmv) + 10 
			 var pcount2 = hm.val(pcount1); 
			 var price1 =  prv.substring(0,prv.length-1); 
			 var price2 = price1.replace(/\,/g,""); 
			 var tprice1 = pcount1 * Number(price2) * 0.8;
			 var tprice2 = String(tprice1).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
			 var tprice3 = sum.val(tprice2);
				}
	}

	function minus2 (obj4) {
		var hm = $(obj4).parent().children('input[id=pcount]');
		var hmv = $(obj4).parent().children('input[id=pcount]').val();
		var pr = $(obj4).parent().parent().children().children('input[id=price]');
		var prv = $(obj4).parent().parent().children().children('input[id=price]').val();
		var sum = $(obj4).parent().parent().children().children('input[id=tprice]');
		var sumv = $(obj4).parent().parent().children().children('input[id=tprice]').val();
			if (hmv > 30) {
				var pcount1 = Number(hmv) - 10 
				var pcount2 = hm.val(pcount1); 
				var price1 =  prv.substring(0,prv.length-1); 
				var price2 = price1.replace(/\,/g,""); 
				var tprice1 = pcount1 * Number(price2) * 0.8;
				var tprice2 = String(tprice1).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
				var tprice3 = sum.val(tprice2);
			}
	}
	
	//삭제(장바구니비우기, 개별삭제, 선택삭제)------------------------------------------
  	function deleteCart(cno){
		if(confirm('해당상품을 삭제하시겠습니까?')){
			location.href = 'cart/del?cno=' + cno;
		}
	}
  	function deleteAll(){
		if(confirm('장바구니를 비우시겠습니까?')){
			location.href = 'cart/del/all';
		}
	}
  	  	
  	$(function(){
  		var chkObj = document.getElementsByName("RowCheck");
  		var rowCnt = chkObj.length;
  		
  		$("input[name='allCheck']").click(function(){
  			var checkinglist = $("input[name='RowCheck']:checked");
  			var chk_listArr = $("input[name='RowCheck']");
  			for (var i = 0; i < chk_listArr.length; i++){
  				chk_listArr[i].checked = this.checked;
  			}
  			
  			if($("input[name='RowCheck']:checked").length == 0){
  				document.getElementById('sumprice').innerHTML="<h2>전체 상품 금액 : 0원";
  			} else if($("input[name='RowCheck']:checked").length > 0){
  				var checkinglist = $("input[name='RowCheck']:checked");
  	  			if(checkinglist){
  		  			var checkinglistLen =  checkinglist.length; 
  		  			if (checkinglistLen > 0){
  			  				var sumtp3 = 0;
  			  				checkinglist.each(function(e){
  		  					var sumtp = $(this).parent().parent().children().find('input[id=tprice]').val();
  		  					var sumtp1 = sumtp.substring(0,sumtp.length-1).replace(/\,/g,"");
  		  					var sumtp2 = Number(sumtp1);
  		  					sumtp3 += sumtp2;
  		  				});  				
  		  				  	var sumtp4 = String(sumtp3).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
  		  			}
  		  				document.getElementById('sumprice').innerHTML="<h2>전체 상품 금액 : "+ sumtp4;
  	  			}
  				
  			}
  			

  		});
  		
  		$("input[name='RowCheck']").click(function(){
  			var checkinglist = $("input[name='RowCheck']:checked");
  			if(checkinglist){
	  			var checkinglistLen =  checkinglist.length; 
	  			if (checkinglistLen > 0){
		  				var sumtp3 = 0;
		  				checkinglist.each(function(e){
	  					var sumtp = $(this).parent().parent().children().find('input[id=tprice]').val();
	  					var sumtp1 = sumtp.substring(0,sumtp.length-1).replace(/\,/g,"");
	  					var sumtp2 = Number(sumtp1);
	  					sumtp3 += sumtp2;
	  				});  				
	  				  	var sumtp4 = String(sumtp3).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
	  			}
	  				document.getElementById('sumprice').innerHTML="<h2>선택 상품 금액 : "+ sumtp4;
  			}
  			

  			if($("input[name='RowCheck']:checked").length == rowCnt){
  				$("input[name='allCheck']")[0].checked = true;	
  			} else {
  				$("input[name='allCheck']")[0].checked = false;
  			}
  			
  			if($("input[name='RowCheck']:checked").length == 0){
  				document.getElementById('sumprice').innerHTML="<h2>선택 상품 금액 : 0원";
  			} 
  			
  			
  		});
  	});

  	function deleteValue(){
  		//var url = "/del/cho";
  		var valueArr = new Array();
  		var list = $("input[name='RowCheck']");
 
  		for (var i = 0; i < list.length; i++){
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			}
  		if(valueArr.length == 0){
  			alert("선택된 상품이 없습니다.");
  		}else{
  			var chk = confirm('선택한 상품을 삭제하시겠습니까?');
  			if(chk == true) {
  				$("#cnoArray").val(valueArr);
  				$("#delAction").submit();				
  
  				/*$.ajax({
  	  				url : "/del/cho",
  	  				type : 'GET',
  	  				traditional : true,
  	  				data : {valueArr : valueArr},
  	  				success: function(jdata){
  	  					if(jdata = 1){
  	  						alert("삭제 성공");
  	  						location.replace("cart")
  	  					} else {
  	  						alert("삭제 실패");
  	  					}
  	  				}
  	  			});*/
  			}
  			
  		} 
  	}
  	//선택상품주문-----------------------------------------------------
  	function cartorder(){
  		var url = "/order"; 
  		var valueArr = new Array();
  		var list = $("input[name='RowCheck']");
 
  		for (var i = 0; i < list.length; i++){
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			}
  		if(valueArr.length == 0){
  			alert("선택된 상품이 없습니다.");
  		}else{
  			var chk = confirm('선택한 상품을 주문하시겠습니까?');
  			if(chk == true) {
  				$("#valueArray").val(valueArr);
  				$("#orderAction").submit();				
  			}
  		} 
  	}
  	</script>
  	
  	<script>
  		//장바구니 처음 전체상품금액----------------------------------
		$(document).ready(function() {
			var checkinglist = $("input[name='RowCheck']:checked");
  			if(checkinglist){
	  			var checkinglistLen =  checkinglist.length; 
	  			if (checkinglistLen > 0){
		  				var sumtp3 = 0;
		  				checkinglist.each(function(e){
	  					var sumtp = $(this).parent().parent().children().find('input[id=tprice]').val();
	  					var sumtp1 = sumtp.substring(0,sumtp.length-1).replace(/\,/g,"");
	  					var sumtp2 = Number(sumtp1);
	  					sumtp3 += sumtp2;
	  				});  				
	  				  	var sumtp4 = String(sumtp3).replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원"
	  				  $('#sumprice h2').text("전체 상품 금액 : "+ sumtp4);
	  			} else if($("input[name='RowCheck']:checked").length == 0) {
	  				$('#sumprice h2').text("전체 상품 금액 : 0원");
	  			} 
	  				
  			}
		});
	</script>
  	
  <style>
  	.img {width:100px; height:100px;}
  	img {width:100%; height:100%;}
  	.count_btn {width:25px; height:25px; border:1px solid #767676; background-color:#fff; text-align:center;"}
  	.btn-main {background:#365902!important; color:#fff;}
  	
  	@media (min-width:768px) and (max-width:991px) {

		.proSearch {
		    padding:10px 23px;
		    width:250px;
		}
		.form-control {
			float:left;
			width:140px;
			height:30px;
	  	}
	  	
  
  </style>
</head>
<body>
    <jsp:include page="../../../header.jsp" />
    <section class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h1 class="page-name">장바구니</h1>
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li class="active">cart</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <button style="background-color:#365902;" type="button" class="btn btn-main" onclick="deleteValue();" style="margin-right: 5px;">선택상품삭제</button>
        <button style="background-color:#365902;" type="button" class="btn btn-main" onclick="deleteAll();">장바구니비우기</button>
    </div>
    <!-- 선택삭제  -->
    <form action="cart/del/cho" method="post" id="delAction">
        <input type="hidden" name="valueArr" id="cnoArray" />
    </form>
    <!-- 선택상품주문  -->
    <form action="order" method="post" id="orderAction">
        <input type="hidden" name="valueArr" id="valueArray" />
    </form>
    <!--<form method="post">-->
              
              
<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12" class="cart-table-div">
					<div class="table-wrap">
						<table class="table table--block carttable">
						  <thead class="thead-primary">
						    <tr style="background-color:#365902;">
						    	<th class="all_check_input_div"><input type="checkbox" name="allCheck" id="allCheck" checked /></th>
						    	<th>&nbsp;</th>
						        <th>상품명</th>
						        <th>단가</th>
						        <th>수량</th>
						        <th>가격</th>
						        <th>&nbsp;</th>
						    </tr>
						  </thead>
						  <c:forEach var="c" items="${ cartList }">
						  <tbody style="height:12rem;">
						  	
						    <tr class="alert" role="alert">
						    
						    	<form:form method="post" action="cart/upd" id="updAction" name="updform">
						    	<td>
						    		<input type="checkbox" name="RowCheck" class="chBox" value="${c.pno }" checked />
									<input type="hidden" id="cno" name="cno" value="${c.pno }" />
						    	</td>
						    	<td>
						    		<div class="img">
						    		<a href="${pageContext.request.contextPath}/pro/${pageInfo }/detail/${c.pno}"><img src="${pageContext.request.contextPath}/resources/img/${c.img1}" alt="${c.img1}" title="${c.img1 }입니다"/></a>
						    		</div>
						    	</td>
						      <td>
						      	<div class="email">
						      		<a href="/pro/1/detail/${c.pno}">${c.pname }</a>
						      	</div>
						      </td>
						      <td>
						      	<input style="border:none; font-size:14px;" type="text" id="price" value="<fmt:formatNumber value="${c.price}" pattern="#,###,###원"/>" readonly />
						      </td>
						      <td>
					        			<input type="button" class="count_btn" onclick="minus(this)" value="-">
					  					<input style="width:40px;" type="number" name= "pcount" id="pcount" value="${c.pcount }" min="1" max="20" readonly required/>
					  					<input type="button" class="count_btn" onclick="plus(this)" value="+">
					  					<button style="background-color:#365902; padding:7px 10px; height:25px; line-height:1px;" type="submit" class="btn btn-main">변경</button>	
				          	  </td>
				          	  </form:form>
				         	 <td>
								<input style="border:none; font-size:14px;" type="text" id="tprice" value="<fmt:formatNumber value="${c.price * c.pcount}" pattern="#,###,###원"/>" readonly />
							</td>
						      <td><a class="btn btn-outline-danger" href="javascript:deleteCart(${c.pno})"><i class="fa fa-close"></i></a></td>
						    </tr>
						  </tbody>
						  </c:forEach>
						</table>
						    <c:if test="${empty cartList}">
								<div id="emptycart" style="text-align:center; margin:50px auto;">
								<span style="font-size:230px; font-weight:800; color:" >텅</span>
								<h2>장바구니가 비어있습니다.</h2>
								</div>
								<script>
									$(document).ready(function() {
									    console.log( "ready!" );
									    $('.table').css('display', 'none');
									});
								</script>
						    </c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
    <div class="container" style="margin-bottom:20px; width:100%; height:120px;">
        <div id="sumprice">
            <h2>전체 상품 금액 : <fmt:formatNumber value="${sumPrice }" pattern="#,###,###원" /></h2>
        </div>
        <div id="orderBtn" style="margin:20px 0;">
            <button style="background-color:#365902;" type="button" class="btn btn-main pull-right" onclick="cartorder();">주문</button>
        </div>
    </div>
	
	<!-- --------------------------------위는 템플릿 아래는 원래상태------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->




<script src="../../../../resources/js/tablemain.js"></script>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>