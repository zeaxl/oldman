<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
th {vertical-align:middle!important}

.inputDiv {
	position: relative;
}

.inputDiv button {
	position: absolute;
	right: 10px;
	top: 10px;
	border: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
function pwCheck(){
	var pw = $("#pw").val().trim();
	var pw1 = $("#pw1").val().trim();
	var pw2 = $("#pw2").val().trim();
	if(pw==""){
		$("#pw").focus();	
	} else if(pw1==""){
		$("#pw1").focus();
	} else if(pw2==""){
		$("#pw2").focus();
	} else {
		$.ajax({
			asysc: true,
			url:"/my/pwd",
			type: 'post',
			data: {
				pw : pw,
				pw1 : pw1
			},
			success:function(result){
				if(result){
					alert("비밀번호 변경이 완료되었습니다.");
					window.location.href='/my/info';
				} else {
					alert("비밀번호가 일치하지 않습니다");
					$("#pw").val("");
					$("#pw1").val("");
					$("#pw2").val("");
					$("#pw").focus();
				}
			},
			error:function(error){			
				alert("Ajax 동작 Error")
			}
		});
	}
}
</script>
<script>
$(function(){
    $("#pw2").keyup(function(){
        var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
	    if(pw1==pw2){
	        $("#pwCheck").text("일치합니다.");
	        $("#pwCheck").css("color","blue");
	        $("#pwBtn").attr("disabled", false);
	    } else {
	        $("#pwCheck").text("새 비밀번호가 일치하지 않습니다.");
	        $("#pwCheck").css("color","red");
	        $("#pwBtn").attr("disabled", true);
	    }
	});
});
</script>
<script>
$(function(){
	$("#pw1").change(function(){
		var pw1 = $("#pw1").val();
		var reg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,10}$/;

		if(!reg.test(pw1)){
			$("#pwFormChk").text("새 비밀번호는 4자리 이상, 영문과 숫자의 조합이어야 합니다.");
			$("#pw1").focus();
			$("#pwFormChk").css("color","red");
		    $("#pwBtn").attr("disabled", true);
		} else{
			$("#pwFormChk").text("사용 가능한 비밀번호입니다.");
			$("#pwFormChk").css("color","blue");
		}
	});
});

</script>
<script>
	// 비번 숨겼다 보이기
	$(function() {
		$('#pwShow').on('click', function() {
			if ($("#icon").hasClass('tf-ion-eye-disabled')) {
				$("#icon").removeClass('tf-ion-eye-disabled');
				$("#icon").addClass('tf-ion-eye');
				$(".pwInput").attr('type', 'text');
			} else {
				$("#icon").removeClass('tf-ion-eye');
				$("#icon").addClass('tf-ion-eye-disabled');
				$(".pwInput").attr('type', "password");
			}
		});

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
 <form action="pwd" method="post" >
 <input type="hidden" name="id" value="${sessionMember.id }" />
<table id="purchase-receipt" class="table">
<tr><th colspan="2" class="text-center" ><h3>비밀번호 변경</h3></th></tr>
<tr><th>현재 비밀번호</th><td>
<div class="inputDiv">
<input type="password" name="pw" id="pw" required class="form-control pwInput" />
															<button type="button" id="pwShow">
																<i id="icon" class="tf-ion-eye-disabled"></i>
															</button>
														</div></td></tr>
<tr><th>새 비밀번호</th><td><input type="password" name="pw1" id="pw1" required class="form-control pwInput"  />
	<span id="pwFormChk" ></span>
</td></tr>
<tr><th>새 비밀번호 확인</th><td><input type="password" name="pw2" id="pw2" required class="form-control pwInput"  />
	<span id="pwCheck" ></span>
</td></tr>
<tr><td colspan="2" class="text-center"><input type="button" id="pwBtn" onclick="pwCheck()" class="btn btn-main" value="비밀번호 변경" />
	&emsp;<input type="button" value="취소" onclick="location.href='./info'"  class="btn btn-main" /></td></tr>
				            </table>
</form>
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