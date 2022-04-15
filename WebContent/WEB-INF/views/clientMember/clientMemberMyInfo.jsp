<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가입정보</title>
<style>
th {vertical-align:middle!important}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	let id = "${sessionMember.id}";
	if(id.indexOf("@") != -1){
		$(".check").attr('style', 'display:none;');
	} 
});


</script>

</head>

<body>

<jsp:include page="/header.jsp"></jsp:include>


<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h3 class="page-name">나의 가입정보</h3>
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
	        <li><a href="order">내 결제내역</a>
	        </li>
	        <li><a href="info"><strong>내 가입정보</strong></a>
	        </li>
	        <li><a href="del">탈퇴하기</a>
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
	<tr><th>이름</th><td>${member.name }</td></tr>
	<tr class="check"><th>아이디</th><td>${member.id }</td></tr>
	<tr class="check"><th>비밀번호</th><td><input type="button" class="btn btn-main btn-small" value="비밀번호 변경" onclick="location.href='./pwd'" /></td></tr>								
	<tr><th>이메일</th><td>${member.email }</td></tr>
	<tr><th>핸드폰번호</th><td>${member.hp }</td></tr>
	<tr><th>우편번호</th><td>${member.postcode }</td></tr>
	<tr><th>주소</th><td>${member.addr1 } ${member.addr2 }</td></tr>
	<tr><th>가입일</th><td>${member.joindate }</td></tr>

<c:choose>
<c:when test="${member.mcode eq 'S' }">
	<tr><th>구분</th><td>일반회원</td></tr>
	<tr><th>생년월일</th><td>${member.birth }</td></tr>
</c:when>
<c:when test="${member.mcode eq 'D' }">
	<tr><th>구분</th><td>사업자회원</td></tr>
	<tr><th>사업자등록번호</th><td>${member.sano }</td></tr>
</c:when>
</c:choose>
	
	<tr><td colspan="2" class="text-center"><input type="button" value="정보수정" class="btn btn-main" onclick="location.href='./upd'" /></td>
		</tr>
</table>
              			</div>
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>

<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>