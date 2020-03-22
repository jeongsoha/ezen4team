<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>
<style>
/* #5483b1 */
#hbutton {
	border-top-right-radius:5px; 
	border-bottom-right-radius:5px; 
	margin-left:-3px;

}

#hdiv button {
	border:1px solid #5483b1;
	background-color: rgba(0,0,0,0);
	color:#5483b1;
	padding:5px;
	border-radius: 12px;
	width:120px;
	height:50px;
	float:right;
	margin-left:10px;
	
}

#hdiv button:hover{
	color:white; 
	background-color:#5483b1; 
}

.hdiv1 {
	
}

.context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
}

.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}

.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}

ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}

.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}

.table100 {
clear : both;
 	width : 1000px;
 	height : 300px;
	text-align:center;
	border:3px solid #ccc;


}
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>


</script>


<body> 


<%@ include file = "../include/header.jsp" %>

<section>

<div class="table100" >

배너 도는 공간 
</div>


<div class="table100" >

내용 도는 공간
</div>


</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>