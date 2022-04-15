<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head profile="http://www.w3.org/2005/10/profile">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Josefin+Sans">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>메인통계</title>
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/AdminChart/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   

</head>

<body id="page-top">
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0-rc.1/chartjs-plugin-datalabels.min.js" integrity="sha512-+UYTD5L/bU1sgAfWA0ELK5RlQ811q8wZIocqI7+K0Lhh8yVdIoAMEs96wJAIbgFvzynPm36ZCXtkydxu1cs27w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
var LineChart;
var Line;

$(document).ready(function(){
	loadJson();pieChart();BarChartDay();
});


function loadJson(){
	
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth4',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);     		     		    		
        	}          	 
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels:  ["04/01","04/02","04/03","04/04","04/05","04/06","04/07","04/08","04/09","04/10","04/11"
              	,"04/12","04/13","04/14","04/15","04/16","04/17","04/18","04/19","04/20","04/21",
            	"04/22","04/23","04/24","04/25","04/26","04/27","04/28","04/29","04/30"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data:sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);               	
                    }
                }}]
            },
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
     
function getSumListMonth3(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListDay',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["03/01","03/02","03/03","03/04","03/05","03/06","03/07","03/08","03/09","03/10","03/11"
              	,"03/12","03/13","03/14","03/15","03/16","03/17","03/18","03/19","03/20","03/21",
            	"03/22","03/23","03/24","03/25","03/26","03/27","03/28","03/29","03/30"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}

function load(){
	LineChart.destroy();
	
	 
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListYear',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].oneyear);
        		sum.push(data[i].twoyear);
        		sum.push(data[i].threeyear);
        		sum.push(data[i].fouryear);
        		sum.push(data[i].fiveyear);    		
        	}
        	
        	
        var ctx = document.getElementById("Chart1");

         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ["2018년","2019년","2020년","2021년","2022년"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
        },     
        
        error:function(){alert("error");}
        
     });}

function getSumListMonth(){
	LineChart.destroy();
	$.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].jan);
        		sum.push(data[i].feb);
        		sum.push(data[i].mar);
        		sum.push(data[i].apr);
        		sum.push(data[i].may);
        		sum.push(data[i].jun);
        		sum.push(data[i].jul);
        		sum.push(data[i].aug);
        		sum.push(data[i].sep);
        		sum.push(data[i].oct);
        		sum.push(data[i].nov);
        		sum.push(data[i].dece);     		
        	}       
        	 
        	
        var ctx = document.getElementById("Chart1");         
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}

function getSumListMonth1(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth1',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels:["01/01","01/02","01/03","01/04","01/05","01/06","01/07","01/08","01/09","01/10","01/11"
                	,"01/12","01/13","01/14","01/15","01/16","01/17","01/18","01/19","01/20","01/21",
                  	"01/22","01/23","01/24","01/25","01/26","01/27","01/28","01/29","01/30"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth2(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth2',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["02/01","02/02","02/03","02/04","02/05","02/06","02/07","02/08","02/09","02/10","02/11"
              	,"02/12","02/13","02/14","02/15","02/16","02/17","02/18","02/19","02/20","02/21",
              	"02/22","02/23","02/24","02/25","02/26","02/27","02/28"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}

function getSumListMonth5(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth5',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["05/01","05/02","05/03","05/04","05/05","05/06","05/07","05/08","05/09","05/10","05/11"
              	,"05/12","05/13","05/14","05/15","05/16","05/17","05/18","05/19","05/20","05/21",
              	"05/22","05/23","05/24","05/25","05/26","05/27","05/28","05/29","05/30","05/31"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth6(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth6',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["06/01","06/02","06/03","06/04","06/05","06/06","06/07","06/08","06/09","06/10","06/11"
                	,"06/12","06/13","06/14","06/15","06/16","06/17","06/18","06/19","06/20","06/21",
                	"06/22","06/23","06/24","06/25","06/26","06/27","06/28","06/29","06/30"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("에러입니다!!");}      
     });}
function getSumListMonth7(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth7',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["07/01","07/02","07/03","07/04","07/05","07/06","07/07","07/08","07/09","07/10","07/11"
              	,"07/12","07/13","07/14","07/15","07/16","07/17","07/18","07/19","07/20","07/21",
              	"07/22","07/23","07/24","07/25","07/26","07/27","07/28","07/29","07/30","07/31"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              spanGaps: true,
              data: sum,
            }],
          },
          options: {
        	  spanGaps: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth8(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth8',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["08/01","08/02","08/03","08/04","08/05","08/06","08/07","08/08","08/09","08/10","08/11"
                	,"08/12","08/13","08/14","08/15","08/16","08/17","08/18","08/19","08/20","08/21",
                	"08/22","08/23","08/24","08/25","08/26","08/27","08/28","08/29","08/30","08/31"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth9(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth9',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["09/01","09/02","09/03","09/04","09/05","09/06","09/07","09/08","09/09","09/10","09/11"
              	,"09/12","09/13","09/14","09/15","09/16","09/17","09/18","09/19","09/20","09/21",
              	"09/22","09/23","09/24","09/25","09/26","09/27","09/28","09/29","09/30"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth10(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth10',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["10/01","10/02","10/03","10/04","10/05","10/06","10/07","10/08","10/09","10/10","10/11"
                	,"10/12","10/13","10/14","10/15","10/16","10/17","10/18","10/19","10/20","10/21",
                	"10/22","10/23","10/24","10/25","10/26","10/27","10/28","10/29","10/30","10/31"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth11(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth11',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		        		    		
        	}       
        	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
        	  labels: ["11/01","11/02","11/03","11/04","11/05","11/06","11/07","11/08","11/09","11/10","11/11"
              	,"11/12","11/13","11/14","11/15","11/16","11/17","11/18","11/19","11/20","11/21",
              	"11/22","11/23","11/24","11/25","11/26","11/27","11/28","11/29","11/30",],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });    
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth12(){
	LineChart.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth12',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);       		        		    		
        	}               	
        var ctx = document.getElementById("Chart1");         
      
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ["12/01","12/02","12/03","12/04","12/05","12/06","12/07","12/08","12/09","12/10","12/11"
            	,"12/12","12/13","12/14","12/15","12/16","12/17","12/18","12/19","12/20","12/21",
            	"12/22","12/23","12/24","12/25","12/26","12/27","12/28","12/29","12/30"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });
      
        },          
        error:function(){alert("error");}      
     });}   
function getSumListMonth20(){
	LineChart.destroy();
	$.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth20',
        dataType:"json",
        success:function(data){
        	let sum=[];     	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].jan);
        		sum.push(data[i].feb);
        		sum.push(data[i].mar);
        		sum.push(data[i].apr);
        		sum.push(data[i].may);
        		sum.push(data[i].jun);
        		sum.push(data[i].jul);
        		sum.push(data[i].aug);
        		sum.push(data[i].sep);
        		sum.push(data[i].oct);
        		sum.push(data[i].nov);
        		sum.push(data[i].dece);     		
        	}             	
        var ctx = document.getElementById("Chart1");         
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              spanGaps: false,
              data: sum,
            }],
          },
          options: {
        	  spanGaps: false,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
           
          }
        });     
        },          
        error:function(){alert("error");}      
     });}
function getSumListMonth21(){
	LineChart.destroy();
	$.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListMonth21',
        dataType:"json",
        success:function(data){
        	let sum=[];       	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].jan);
        		sum.push(data[i].feb);
        		sum.push(data[i].mar);
        		sum.push(data[i].apr);
        		sum.push(data[i].may);
        		sum.push(data[i].jun);
        		sum.push(data[i].jul);
        		sum.push(data[i].aug);
        		sum.push(data[i].sep);
        		sum.push(data[i].oct);
        		sum.push(data[i].nov);
        		sum.push(data[i].dece);     		
        	}           	
        var ctx = document.getElementById("Chart1");         
         LineChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
            datasets: [{
              label: "매출",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
             
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
             
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: sum,
            }],
          },
          options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    display: true,
                    ticks: {
                    	 beginAtZero:true,
                         callback: function(value, index, values) {
                             return  number_format(value);                                    	
                    }}}]},
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },        
          }
        });     
        },          
        error:function(){alert("error");}      
     });}
function pieChart(){	
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListPie',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	let pname=[];       	      	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		pname.push(data[i].pname);       		         		    		
        	}            	
        var cvx = document.getElementById("pieChart");               
         LinePie = new Chart(cvx, {
      //  plugins:[ChartDataLabels],     	 
          type: 'doughnut',     
          data: {
            labels: pname,    
            datasets: [{        
                backgroundColor: ['#dfa54e','yellow', '#afdf4e','#4edfda'],           
              data: sum,
              datalabels:{  
            	  formatter: function(value, context) { return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "%"; },
            	  color: '#white'       		  
                }          
            }],    
          },
          options: { 
        	  
        	  maintainAspectRatio: false,   	 
        	    tooltips: {
        	      backgroundColor: "rgb(255,255,255)",
        	      bodyFontColor: "#858796",
        	      borderColor: '#dddfeb',
        	      borderWidth: 1,
        	      
        	      xPadding: 15,
        	      yPadding: 15,
        	      displayColors: false,
        	      caretPadding: 10,   	    	  
              }
            },       
          }
        );},          
        error:function(){alert("error");}      
     });}
function pieChartDay(){
	LinePie.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListPieDay',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	let pname=[];        	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		pname.push(data[i].pname);      		         		    		
        	}            	
        var cvx = document.getElementById("pieChart");     
         LinePie = new Chart(cvx, {
     //  plugins:[ChartDataLabels],      	 
          type: 'doughnut',        
          data: {
            labels: pname,    
            datasets: [{        
                backgroundColor: ['#dfa54e','yellow', '#afdf4e','#4edfda'],             
              data: sum,
              datalabels:{  
            	  formatter: function(value, context) { return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "%"; },
            	  color: '#4e73df'          		  
                }          
            }],       
          },
          options: {          	  
        	  maintainAspectRatio: false,   	 
        	    tooltips: {
        	      backgroundColor: "rgb(255,255,255)",
        	      bodyFontColor: "#858796",
        	      borderColor: '#dddfeb',
        	      borderWidth: 1,
        	      xPadding: 15,
        	      yPadding: 15,
        	      displayColors: false,
        	      caretPadding: 10,    	    	  
              }
            },       
          }
        );},          
        error:function(){alert("error");}      
     });}
function pieChartMonth(){
	LinePie.destroy();
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListPieMonth',
        dataType:"json",
        success:function(data){
        	let sum=[];
        	let date=[];
        	let pname=[];	
        	for(let i=0; i<data.length;i++){
        		sum.push(data[i].sum);
        		date.push(data[i].date);
        		pname.push(data[i].pname);       		         		    		
        	}             	
        var cvx = document.getElementById("pieChart");                    
         LinePie = new Chart(cvx, {
     //   plugins:[ChartDataLabels],     	 
          type: 'doughnut',        
          data: {
            labels: pname,    
            datasets: [{        
              backgroundColor: ['#dfa54e','yellow', '#afdf4e','#4edfda'],  
              
              data: sum,
              
              datalabels:{            	  
            	  formatter: function(value, context) { return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "%"; },
            	  color:'#4e73df'		  
                }          
            }],
        
          },
          options: {   
        	  
        	  maintainAspectRatio: false,   	 
        	    tooltips: {
        	      backgroundColor: "rgb(255,255,255)",
        	      bodyFontColor: "#858796",
        	      borderColor: '#dddfeb',
        	      borderWidth: 1,
        	      xPadding: 15,
        	      yPadding: 15,
        	      displayColors: false,
        	      caretPadding: 10,  	  
              }
            },       
          }
        );},          
        error:function(){alert("error");}      
     });}
 
function BarChartDay(){	
    $.ajax({
        type:"POST",
        url:'${pageContext.request.contextPath}/admin/getSumListBarDay',
        dataType:"json",
        success:function(data){
        	let mcode=[];
        	let date=[];
        	let pname=[];
        	let sum=[];
        	
        	let somae=[];
        	let domae=[];
        	
        	
        	for(let i=0; i<data.length;i++){     		
        		sum.push(data[i].sum);     		
        		mcode.push(data[i].mcode);
        		date.push(data[i].date);
        		pname.push(data[i].pname);
        		
        		         		    		
        	}       
        	somae.push(data[0].sum);
        	somae.push(data[2].sum);
        	somae.push(data[4].sum);
        	domae.push(data[1].sum);
        	domae.push(data[3].sum);
        	domae.push(data[5].sum);
    		
        var cvx = document.getElementById("Bar");
                
       
         Bar = new Chart(cvx, {
       
        	 
        	 type: 'bar',
          
          data: {
        	 // '#4e73df','#36b9cc', '#858796','#f6c23e'
            labels: ["오늘 판매량","이번주 판매량","이번달 판매량"],    
            datasets: [
            	{
               
               label: '소매',
               data: somae,
               backgroundColor: ['#4eacdf','#4eacdf','#4eacdf'],  
            	},{
                    
                    label: '도매',
                    data: domae,
                    backgroundColor: ['#df4e7e','#df4e7e','#df4e7e'],  
                 	},
            	
            ],
           
          },
          
          options: {   
        	  
        	  maintainAspectRatio: false,   	 
        	    tooltips: {
        	      backgroundColor: "rgb(255,255,255)",
        	      bodyFontColor: "#858796",
        	      borderColor: '#dddfeb',
        	      borderWidth: 1,
        	      xPadding: 15,
        	      yPadding: 15,
        	      displayColors: false,
        	      caretPadding: 10,
        	     

        	    	  
              }
            },       
          }
        );},          
        error:function(){alert("error");}      
     });}
function Select(obj) {
	
    if(obj.value == 1){
    	var con = document.getElementById("month");
    	con.style.display = 'none';
    	var con = document.getElementById("con");
    	con.style.display = 'block';
    	loadJson(); des();
    } else if(obj.value == 2){
    	var con = document.getElementById("con");
    	con.style.display = 'none';
    	var con = document.getElementById("month");
    	con.style.display = 'block';
    	getSumListMonth(); destroy();
    }else if(obj.value == 3){
    	var con = document.getElementById("con");
    	con.style.display = 'none';
    	var con = document.getElementById("month");
    	con.style.display = 'none';
    	load();destroy();
    }
}
function Selectt(obj) {
	
    if(obj.value == 1){
    	getSumListMonth1();des();
    } else if(obj.value == 2){
    	getSumListMonth2();des();
    }else if(obj.value == 3){
    	getSumListMonth3(); des();
    }else if(obj.value == 4){
    	loadJson();des();
    }else if(obj.value == 5){
    	getSumListMonth5();des();
    }else if(obj.value == 6){
    	getSumListMonth6();des();
    }else if(obj.value == 7){
    	getSumListMonth7();des();
    }else if(obj.value == 8){
    	getSumListMonth8();des();
    }else if(obj.value == 9){
    	getSumListMonth9();des();
    }else if(obj.value == 10){
    	getSumListMonth10();des();
    }else if(obj.value == 11){
    	getSumListMonth11();des();
    }else if(obj.value == 12){
    	getSumListMonth12();des();
    }
}
function Selecttt(obj) {
	
    if(obj.value == 3){
    	getSumListMonth(); destroy();
    } else if(obj.value == 2){
    	getSumListMonth21();destroy();
    }else if(obj.value == 1){
    	getSumListMonth20();destroy();
    	
    }
}
function PieSelect(obj) {
	
    if(obj.value == 1){
    	pieChartDay();pie();
    } else if(obj.value == 2){
    	pieChartMonth();pie();
    }else if(obj.value == 3){
    	pieChart();pie();    	
    }
   
}

function des(){
	LineChart.destroy();
}
function pie(){
	LinePie.destroy();
}
</script>
<script>

</script>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
     
       <jsp:include page="../adminIndex/adminSidebar.jsp"></jsp:include>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

    <jsp:include page="../adminIndex/adminTopbar.jsp"></jsp:include>
               
                   

                      

                      
                       
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800"> &nbsp;</h1>
                        <a href="#" ><i
                                class="fas fa-download fa-sm text-white-50"></i> &nbsp; </a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                     <c:set var="Today" value="${SumToday}" />
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                                                                     일간 매출 (원)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Today.summ} 원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <c:set var="Month" value="${SumMonth}" />
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                                                                     월간 매출 (원)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Month.summ} 원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <c:set var="Year" value="${SumYear}" />
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                                                                        년간 매출 (원)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Year.summ} 원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pending Requests Card Example -->
                      <c:set var="account" value="${Sum}" />
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                                                                        매출총액 (원)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${account.summ} 원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">
                      <div class="col-xl-12 col-lg-9">
                            <div class="card shadow mb-4">
                                <div class="card-header py-1 d-flex  align-items-center flex-row  "> <!--justify-content-between -->
                                    <h6 class="m-0 font-weight-bold text-primary">매출 실적</h6>
                                    <div class="col-sm-2 col-sm-offset-9">
                                     <select class="form-control "   name="title" onchange="javascript:Select(this);">				       
								       <option value="1">일간 매출</option> 
								        <option  value="2">월간 매출</option>
								          <option  value="3">년간 매출</option>								        		             
								        </select>
								        </div>
								        <div class="col-sm-1 col-sm-offset-9" style="display:block" id="con" >
                                     <select class="form-control "  name="title" onchange="javascript:Selectt(this);">				       								       
									       <option  value="1">1월</option> 
									       <option  value="2">2월</option>
									       <option  value="3">3월</option>									    
									       <option selected value="4" >4월</option> 
									       <option  value="5">5월</option>
									       <option  value="6">6월</option>
									       <option  value="7">7월</option> 
									       <option  value="8">8월</option>
									       <option  value="9">9월</option>
									       <option  value="10">10월</option> 
									       <option  value="11">11월</option>
									       <option  value="12">12월</option>								        		             
								        </select>
								        </div>
								      <div class="col-sm-2 col-sm-offset-9" style="display:none" id="month" >
                                     <select class="form-control "  name="title" onchange="javascript:Selecttt(this);">				       
									       <option  value="3">2022년</option>
									       <option  value="2">2021년</option> 
									       <option  value="1">2020년</option>									    
									       						        		             
								        </select>
								        </div>
								        
                                    <div class="dropdown "> 
  
                                            <div class="dropdown-divider"></div>                
                                   
                                    </div>
                                </div>
                                
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="Chart1"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <!-- Area Chart -->
                       </div>
                     
                   <!--  꺽은선 그래프 --> 
                       <div class="row">
                      <div class="col-xl-8 col-lg-7">
                            <div class="card shadow ">
                                  <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">도매 소매 판매량</h6>
                                    
                                    <div class="dropdown ">
                                   
                                                                    
                                       
                                        <div class="dropdown-menu dropdown-menu-right "
                                            aria-labelledby="dropdownMenuLink">
                                  
                                            <div class="dropdown-divider"></div>

                                        </div>
                                    </div>
                                </div> <!-- Card Header - Dropdown -->
                               
                                
                                
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="Bar"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-1 d-flex flex-row align-items-center ">
                                    <h6 class="m-0 font-weight-bold text-primary">제품 판매량</h6>
                                    
                                         <div class="col-sm-7 col-sm-offset-6">
                                     <select class="form-control "   name="title" onchange="javascript:PieSelect(this);">				       
								       <option value="1">오늘 판매량</option> 
								        <option selected value="2">이번달 판매량</option>
								          <option  value="3">이번년도 판매량</option>								        		             
								        </select>
								        </div>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            
                                            <a class="dropdown-item"  onclick="pieChartDay();pie();">오늘 판매량</a>
                                            <a class="dropdown-item"  onclick="pieChartMonth();pie();">이번달 판매량</a>
                                           <a class="dropdown-item"  onclick="pieChart();pie();">이번년 판매량 </a>
                                            
                                        </div>
                                   
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                           
                                        </span>
                                        <span class="mr-2">
                                         
                                        </span>
                                        <span class="mr-2">
                                            
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   <!--  꺽은선 그래프  -->  
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">인기 상품</h6>
                                </div>
                                <div class="card-body">
                                <c:forEach var="SumListRank" items="${SumListRank}" varStatus="status">

                                    <h4 class="small font-weight-bold">${SumListRank.pname}<span
                                            class="float-right">${SumListRank.sum} 개 판매</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: ${SumListRank.sum}%"
                                            aria-valuenow="${SumListRank.sum}" aria-valuemin="0" aria-valuemax="500"></div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">하위 상품</h6>
                                </div>
                                <div class="card-body">
                                <c:forEach var="SumListRankD" items="${SumListRankD}" varStatus="status">

                                    <h4 class="small font-weight-bold">${SumListRankD.pname}<span
                                            class="float-right">${SumListRankD.sum} 개 판매</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${SumListRankD.sum}%"
                                            aria-valuenow="${SumListRankD.sum}" aria-valuemin="0" aria-valuemax="500"></div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>

                        </div></div></div></div>
            <!-- Footer -->
           
    <jsp:include page="../adminIndex/adminFooter.jsp"></jsp:include> 
    

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/AdminChart/js/demo/chart-area-demo.js"></script> 
  
   </div></div>
</body>
</html>