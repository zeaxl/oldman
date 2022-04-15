<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<style>
.red {
	color: red
}

th {
	vertical-align: middle !important
}

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	function delCheck() {
		var pw = $("#pw").val().trim();
		if (pw == "") {
			$("#pw").focus();
		} else {
			var delConfirm = confirm("정말 탈퇴하시겠습니까?");
			if (delConfirm) {
				$.ajax({
					asysc : true,
					url : "/my/del",
					type : 'post',
					data : {
						pw : pw,
					},
					success : function(result) {
						if (result) {
							alert("탈퇴가 완료되었습니다.");
							window.location.href = '/kherb';
						} else {
							alert("비밀번호가 일치하지 않습니다");
							$("#pw").val("");
							$("#pw").focus();
						}
					},
					error : function(error) {
						alert("Ajax 동작 Error")
					}
				});
			}
		}
	}
</script>
<script>
	// 비번 숨겼다 보이기
	$(function() {
		$('#pwShow').on('click', function() {
			if ($("#icon").hasClass('tf-ion-eye-disabled')) {
				$("#icon").removeClass('tf-ion-eye-disabled');
				$("#icon").addClass('tf-ion-eye');
				$("#pw").attr('type', 'text');
			} else {
				$("#icon").removeClass('tf-ion-eye');
				$("#icon").addClass('tf-ion-eye-disabled');
				$("#pw").attr('type', "password");
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
						<h3 class="page-name">탈퇴하기</h3>
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
									<li><a href="order">내 결제내역</a></li>
									<li><a href="info">내 가입정보</a></li>
									<li><a href="del"><strong>탈퇴하기</strong></a></li>
								</ul>
							</div>
							<!-- End category  -->
						</aside>
					</div>




					<div class="col-md-8 col-md-offset-1">
						<div class="block ">
							<div class="purchase-confirmation-details">
								<form action="del" method="post" name="delForm">
									<input type="hidden" name="id" value="${sessionMember.id }" />
									<table id="purchase-receipt" class="table">
										<c:choose>
											<c:when test="${delDate eq '1' }">
												<tr>
													<th colspan="2"><i class="tf-ion-checkmark"> </i>탈퇴는 <span
														class="red">마지막 결제일로부터 7일</span> 이후부터 가능합니다.<br>
													<br> <i class="tf-ion-checkmark"> </i>"${sessionMember.name }"
														님은 현재 마지막 결제일로부터 7일이 경과하지 않았기 때문에 탈퇴가 불가합니다.<br>
														&emsp;마지막 결제일을 확인 후 다시 시도해주세요.</th>
												</tr>
												<tr>
													<th colspan="2"></th>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<th colspan="2">
														<h3>탈퇴 안내</h3> 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>
													<br> <i class="tf-ion-checkmark"> </i>사용하고 계신 아이디(<span
														class="red">${sessionMember.id }</span>)는 탈퇴할 경우 재사용 및 복구가
														불가능합니다.<br> <span class="red">&nbsp;&nbsp;탈퇴한
															아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.<br>
													<br> <i class="tf-ion-checkmark"> </i>탈퇴 후 회원정보 및 서비스
														이용기록은 모두 삭제됩니다.<br> &emsp;회원정보 및 배송기록 등 서비스 이용기록은 모두
														삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
													<br>
													</th>
												</tr>
												<tr>
													<th colspan="2"><h3>정말 탈퇴하시겠습니까?</h3> &emsp;비밀번호를 다시 한
														번 입력해주세요.</th>
												</tr>

												<tr>
													<!-- <th id="thMiddle">비밀번호 확인</th> -->
													<td colspan="2">
														<div class="inputDiv">
															<input type="password" id="pw" name="pw" required
																autofocus class="form-control" />
															<button type="button" id="pwShow">
																<i id="icon" class="tf-ion-eye-disabled"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="2" class="text-center"><input
														type="button" value="탈퇴하기" onclick="delCheck()"
														class="btn btn-main" />&emsp; <input type="button"
														value="취소" onclick="location.href='./info'"
														class="btn btn-main" /></td>
												</tr>
											</c:otherwise>
										</c:choose>

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