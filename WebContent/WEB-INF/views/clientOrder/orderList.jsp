<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<style type="text/css">

	button.kakao {
	
	background: url( "resources/icon/카카오페이.png" ) no-repeat;
        border: none;
        width: 150px;
        height: 80px;
        cursor: pointer;
	
	}
</style>
<script>

function kakao() {
	
	
	var pnamearr = new Array();
	$('input[name=pname]').each(function() {
		pnamearr.push($(this).val());
	});
	console.log(pnamearr);
	var pname;
	if (pnamearr.length == 1) {
		pname = pnamearr.at(0);
	} else {
		pname = pnamearr.at(0) + " " + "외" + parseInt(pnamearr.length - 1)
				+ "건";
	}
	
	var pricearr = new Array();
	$('input[name=price]').each(function() {
		pricearr.push($(this).val());
	});
	console.log(pricearr);
	
	var pcountarr = new Array();
	$('input[name=pcount]').each(function() {
		pcountarr.push($(this).val());
	});
	console.log(pcountarr);
	
	var pnoarr = new Array();
	$('input[name=pno]').each(function() {
		pnoarr.push($(this).val());
	});
	console.log(pnoarr);
	
	var dpricearr = new Array();
	$('input[name=dprice]').each(function() {
		dpricearr.push($(this).val());
	});
	console.log(dpricearr);
	
	var idarr = new Array();
	$('input[name=id]').each(function() {
		idarr.push($(this).val());
	});
	console.log(dpricearr);
	
    var merchant_uid = 'merchant_' + new Date().getTime();
	
	var payno1 = new Date().getTime();
	var payno = String(payno1);
	console.log("payno " + payno);
	var oname = $("#oname").val();
	console.log("oname " + oname);
	var ohp = $("#ohp").val();
	console.log("ohp " + ohp);
	var oaddr1 = $("#oaddr1").val();
	console.log("oaddr1 " + oaddr1);
	var oaddr2 = $("#oaddr2").val();
	console.log("oaddr2 " + oaddr2);
	var addr = oaddr1 + oaddr2;
	var opostcode = $("#opostcode").val();
	console.log("opostcode " + opostcode);
	var pno = $("#pno").val();
	console.log("pno " + pno);
	var price = $("#price").val();
	console.log("price " + price);
	var pcount = $("#pcount").val();
	console.log("pcount " + pcount);
	var totalprice = $("#totalprice").val();
	console.log("totalprice " + totalprice);
	var mcode = $("#mcode").val();
	var totalprice = $("#totalprice").val();
	
	if($("#ohp").val() == ""){ 
		alert("핸드폰 번호를 입력해주세요"); 
		$("#ohp").focus(); 
		return false; 
		}
	
	if($("#oaddr1").val() == ""){ 
		alert("주소를 입력해주세요"); 
		$("#oaddr1").focus(); 
		return false; 
		}
	
	if($("#oaddr2").val() == ""){ 
		alert("상세주소를 입력해주세요"); 
		$("#oaddr2").focus(); 
		return false; 
		}

	var IMP = window.IMP;
	IMP.init('imp07345960');
	
	IMP.request_pay({
	    pg : 'kakao', 
	    pay_method : 'card',
	    merchant_uid : merchant_uid,
	    name : pname,
	    amount : totalprice,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : oname,
	    buyer_tel : ohp,
	    buyer_addr : addr,
	    buyer_postcode : opostcode,
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다';
			console.log("결제성공 " + msg);
			
			$.ajax({
				url : "/order/check",
				type : "POST",
				traditional : true,
				data : {
					payno : payno,
        			oname : oname,
        			ohp : ohp,
        			oaddr1 : oaddr1,
        			oaddr2 : oaddr2,
        			opostcode : opostcode,
        			pnoarr : pnoarr,
        			pnamearr : pnamearr,
        			pricearr : pricearr,
        			pcountarr : pcountarr,
        			dpricearr : dpricearr,
        			mcode : mcode,
        			totalprice : totalprice
				},
				success : function(result) {
					if (result != 0) {
						console.log("추가성공");
						
						location.href = "/order/result";
					} else {
						alert("pay 실패");
					}
				},
				error : function() {
					console.log("Insert ajax 통신 실패!!!");
				}
			});
		} else {
			var msg = '결제에 실패했습니다';
			msg += '에러 : ' + rsp.error_msg
		}
		console.log(msg);
	});
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
					<h1 class="page-name">결제하기</h1>
					<ol class="breadcrumb">
						
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
	
	
<div class="page-wrapper">
   <div class="checkout shopping">
      <div class="container">
         <div class="row">
            <div class="col-md-8">
            
               <div class="block billing-details">
                  <h3 class="widget-title">주문자 정보</h3>
                  <h5 style="color: red;">* 주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</h5>
                  <form class="checkout-form">
                     <div class="form-group">
                        <label for="oname">Full Name</label>
                        <input type="text" class="form-control" name="oname" id="oname" value="${member.name}">
						<input type="hidden" name="id" id="id" value="${member.id}">
						<input type="hidden" name="mcode" id="mcode" value="${member.mcode}">
                     </div>
                     <div class="form-group">
                        <label for="ohp">Phone</label>
                        <input type="text" class="form-control" id="ohp" name="ohp" required="required" size="11" maxlength="11" value="${member.hp}">
                     </div>
                     <div class="checkout-country-code clearfix">
                        <div class="form-group">
                           <label for="opostcode">Zip Code</label>
                           <input type="text" class="form-control" name="opostcode" id="opostcode" name="postcode" value="${member.postcode}">
                        </div>
                        <div class="form-group" >
                           <input type="button" class="btn btn-default btn-sm" id="searchAdd" onclick="execution_daum_address()" 
                           style= "text-align:center;" value="우편번호 찾기"><br>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="oaddr1">Address</label>
                        <input type="text" class="form-control" name="oaddr1" id="oaddr1" value="${member.addr1}">
                     </div>
                     <div class="form-group">
                        <label for="oaddr2">Detail Address</label>
                        <input type="text" class="form-control" name="oaddr2" id="oaddr2" value="${member.addr2}">
                     </div>
                  </form>
               </div>
             
            </div>
            <div class="col-md-4">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">주문 상세 내용</h4>
                     <c:set var="sum" value="0" />
                     <c:forEach var="o" items="${order}">
                     <div class="media product-card">
                        <a class="pull-left">
                           <img class="media-object" src="<spring:url value='/resources/img/${o.pname}.png'/>" alt="${o.pname}" title="${o.pname}"/>
                        </a>
                        <div class="media-body">
                           <h4 class="media-heading"><input type="hidden" value="${o.pname}" name="pname" id="pname">${o.pname}</h4>
                           <p class="price"><input type="hidden" value="${o.price}" name="price" id="price">${o.price}</p>
                           <p class="price"><input type="hidden" value="${o.pcount}" name="pcount" id="pcount">x${o.pcount}</p>
                           <input type="hidden" value="${o.pno}" name="pno" id="pno">
                           <input type="hidden" value="${o.price * o.pcount}" name="dprice" id="dprice">
                        </div>
                     </div>
                     <c:choose>
                     <c:when test="${member.mcode == 'D'}">
                     <ul class="summary-prices">
                        <li>
                           <span>Subtotal:</span>
                           <span class="price"><fmt:formatNumber pattern="###,###,###" value="${(o.price * o.pcount)}"/> 원</span>
                        </li>
                
                        <li>
                           <span style="color:red">Subtotal(20% 할인):</span>
                    
                           <span class="price"><fmt:formatNumber pattern="###,###,###" value="${(o.price * o.pcount) * 0.8}"/> 원</span>
                        </li>
                     </ul>
                     </c:when>
                     <c:otherwise>
                     <ul class="summary-prices">
                        <li>
                           <span>Subtotal:</span>
                           <span class="price"><fmt:formatNumber pattern="###,###,###" value="${o.price * o.pcount}"/> 원</span>
                        </li>
                     </ul>
                     </c:otherwise>
                     </c:choose>
                     <c:choose>
                     <c:when test="${member.mcode == 'D'}">
                     <c:set var="sum" value="${sum + (o.price * o.pcount) * 0.8}" />
                     </c:when>
                     <c:otherwise>
                     <c:set var="sum" value="${sum + (o.price * o.pcount)}" />
                     </c:otherwise>
                     </c:choose>
                     </c:forEach>
                     <div class="summary-total">
                        <span>Total</span>
                        <span><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</span>
                        <input type="hidden" value="${sum}" name="totalprice" id="totalprice">
                     </div>
                    <div class="block">
                  <h4 class="widget-title">Payment Method</h4>
                  <p></p>
                  <div class="checkout-product-details">
                     <div class="payment">
                        
                           
                              <button type="submit" class="kakao" name="kakao" onclick="kakao()"> </button>
                              
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
 

<script type="text/javascript">
		
		$(".back_btn").click(function(event) {
			event.preventDefault();
			location.assign("/product/show/" + productId);
		});
		
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_userid").val();
			
			location.assign("/member/read/" + userid);
		})
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if (logout) {
				location.assign("/member/logout");
			}
		});
		
		$("#go_to_adminPage").click(function(event) {
			event.preventDefault();
			
			location.assign("/admin/main");
		
		});
		
		$("#searchAdd").click(function(event) {
			event.preventDefault();
			postcode();

		});
		
		
		function execution_daum_address(){
	 		console.log("동작");
		   new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 	// 추가해야할 코드
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                      addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	             	// 제거해야할 코드
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#opostcode").val(data.zonecode);
	                $("#oaddr1").val(addr);				
	                // 커서를 상세주소 필드로 이동한다.
	                $("#oaddr2").attr("readonly", false);
	                $("#oaddr2").focus();	 
		            
		            
		        }
		    }).open();  	
		
	}
	
</script>

<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>
