<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<section class="page-wrapper success-msg">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-android-checkmark-circle"></i>
          <h2 class="text-center">주문이 정상적으로 완료되었습니다. 이용해 주셔서 감사합니다.</h2>
          <p></p>
          <input class="btn btn-main mt-20" type="button" value="메인으로" onclick="location.href='/'" />
          <input class="btn btn-main mt-20" type="button" value="주문내역 확인" onclick="location.href='../my/order'" />

        </div>
      </div>
    </div>
  </div>
</section><!-- /.page-warpper -->

<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>