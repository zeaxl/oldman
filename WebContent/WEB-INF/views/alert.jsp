<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlertPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>

</head>
<body>

<script type ="text/javascript">
var message = "${msg}";
var url = "${url}";
var data = "${search.searchKeyword}";
var column = "${search.searchCondition}";
var pNo = "${page.pageNo}";
var del = "${del}";
var deldo = "${deldo}";
var delso = "${delso}";
var del1 = "${del1}";
var del2 = "${del2}";
var pass = "${pass}";
var pass1 = "${pass1}";
var memberNo = "${member}";
console.log(memberNo);
console.log(data);
console.log(column);
console.log(pNo);
console.log("del 값: " + del);
console.log("pass 값 :" + pass);

if(del == "del" && pass ==""){
	alert(message);
	console.log("del if 구문 ");
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE  + "/" +pNo;
	console.log(urlFin);	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/삭제 성공")
		
}else if (deldo == 1 && pass == ""){
	console.log("del if 구문 ");
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE
	alert(urlFin);	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/삭제 성공")
		
} else if (delso == 1 && pass == ""){
	console.log("del if 구문 ");
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE
	alert(urlFin);	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/삭제 성공")
		
} else if (del1 == "del1" && pass == ""){
	console.log("del if 구문 ");
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/삭제 성공")
		
} else if (del2 == "del2" && pass == ""){
	console.log("del if 구문 ");
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/삭제 성공")
		
		
}else if (del != "del" && pass == ""){
	console.log("del else 구문");
	alert(message);
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE  + "/" +pNo;
	console.log(urlFin);	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/삭제 실패")
	
	} else if (pass == "pass" && del == ""){
	
	alert(message);
	console.log("pass if 구문 ");
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE  + "detail";
	//var urlFin = urlE  + "/" +pNo +"/"+"detail";
	console.log(urlFin);	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
	
	
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/승인 성공")

	} else if (pass !="pass" && del ==""){
		console.log("pass else 구문");
	alert(message);
	var urlD = document.location.href.split(/\:|8080$/)[2];
	var urlE = urlD.substring(4,20);
	var urlFin = urlE  + "/" +pNo +"/"+"detail";
	alert(urlFin);	
	var Form = document.createElement('form');
		Form.name ='Form';
		Form.method='post';
		Form.action =urlFin;
		
	var input1 = document.createElement('input');
	var input2 = document.createElement('input');
	var input3 = document.createElement('input');
		
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "searchKeyword");
		input1.setAttribute("value", data);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "searchCondition");
		input2.setAttribute("value", column);
		input3.setAttribute("type", "hidden");
		input3.setAttribute("name", "mno");
		input3.setAttribute("value", memberNo);

		
		Form.appendChild(input1);
		Form.appendChild(input2);
		Form.appendChild(input3);
		
		document.body.appendChild(Form);
		Form.submit();
		console.log("post 방식 전송 완료/승인 실패")
	}
</script>
</body>
</html>