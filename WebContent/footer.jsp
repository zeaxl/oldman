<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<footer class="footer section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="footer-menu text-uppercase">
						<c:choose>
						<c:when test="${sessionMember eq null }">
							<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						</c:otherwise>
						</c:choose>			
						<li><a href="${pageContext.request.contextPath}/admin/login">관리자 로그인</a></li>
					</ul>
					<p class="copyright-text">Copyright &copy;2022, Developed by 
						<a href="${pageContext.request.contextPath}/">KHerb</a><br>
						박주영, 강승희, 이재준, 홍현택, 김도현, 김광한, 손종국
					</p>
				</div>
			</div>
		</div>
	</footer>



</body>
</html>