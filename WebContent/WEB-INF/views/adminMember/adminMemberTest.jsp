<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

function ilban(clicked_value){

	var mcode=clicked_value;
	$.ajax({
		asysc : true,
		url : "admin/test",
		type: 'post',
		data : mcode,
		dataType :"json",
		contentType :"application/json; charset=UTF-8",
		success : function(result){
		
		alert("총 건수 : " + result.length);
		
		$("#doList").empty();
		
		if(mcode=="S"){
			$("#doList").append("<tr>"+
					"<th>회원번호</th>"+
					"<th>아이디</th>"+
					"<th>이름</th>"+
					"<th>생년월일</th>"+
					"<th>가입일</th>"+
				"</tr>");
			$.each(result, function(){
				$("#doList").append("<tr>" + 
						"<td>" + this.mno + "</td>" + 
	              		"<td><a href='./mem/detail/"+this.mno+"' >" + this.id + "</td>" +
	              		"<td>" + this.name + "</td>" +
	              		"<td>" + this.birth + "</td>" + 
	              		"<td>" + this.joindate + "</td>" +
	        		  	"</tr></tbody>");	
				});
			}
		else if(mcode=="D"){
			$("#doList").append("<tr>"+
					"<th>회원번호</th>"+
					"<th>아이디</th>"+
					"<th>이름</th>"+
					"<th>사업자번호</th>"+
					"<th>가입일</th>"+
				"</tr>");
			$.each(result, function(){
				$("#doList").append("<tr>" + 
						"<td>" + this.mno + "</td>" + 
	              		"<td><a href='./mem/detail/"+this.mno+"' >" + this.id + "</td>" +
	              		"<td>" + this.name + "</td>" +
	              		"<td>" + this.sano + "</td>" + 
	              		"<td>" + this.joindate + "</td>" +
	        		  	"</tr></tbody>");	
				});
			}
		else{
			$("#doList").append("<tr>"+
					"<th>회원번호</th>"+
					"<th>아이디</th>"+
					"<th>이름</th>"+
					"<th>전화번호</th>"+
					"<th>가입일</th>"+
				"</tr>");
			$.each(result, function(){
				$("#doList").append("<tr>" + 
						"<td>" + this.mno + "</td>" + 
	              		"<td><a href='./mem/detail/"+this.mno+"' >" + this.id + "</td>" +
	              		"<td>" + this.name + "</td>" +
	              		"<td>" + this.hp + "</td>" + 
	              		"<td>" + this.joindate + "</td>" +
	        		  	"</tr></tbody>");	
				});			
		}

		},
		error:function(error){			
			alert("Error 입니다.")
		}
	});
			
		
}
</script>

</head>
<body>

<button id="btnAll" value="A" onclick="ilban(this.value)" >전체</button>
<button id="btnS" value="S" onclick="ilban(this.value)" >일반</button>
<button id="btnD" value="D" onclick="ilban(this.value)" >사업자</button>

<!--  
<input type="button" value="일반" onclick="ilban()" />
<input type="button" value="사업자" onclick="ilban()" />
-->
 <table id="doList" border="1" >
<thead> 
 <tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>가입일</th>
		</tr>
	</thead>
<tbody id="tbody">
<c:forEach var="m" items="${member}">
		<tr>
			<td>${m.mno}</td>
			<td><a href="./mem/detail/${m.mno}" >${m.id}</a></td>
			<td>${m.name}</td>
			<td>${m.birth}</td>
			<td>${m.joindate}</td>
		</tr> 
		</c:forEach>
</tbody>	

 </table>

</body>
</html>