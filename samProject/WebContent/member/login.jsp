<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
/* #5483b1 */
#hbutton {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
}

#hdiv button {
	border: 1px solid #5483b1;
	background-color: rgba(0, 0, 0, 0);
	color: #5483b1;
	padding: 5px;
	border-radius: 7px; //
	width: 70px; //
	height: 50px;
	float: right;
	margin-left: 10px;
}

#hdiv button:hover {
	color: white;
	background-color: #5483b1;
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
	font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI",
		Roboto, "Helvetica Neue", Arial, sans-serif;
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

.mtd {
	height: 30px;
}

.textBox1 {
	height: 40px;
	width: 100%;
}

.container {
	width: 1200px;
	height: 400px;
	text-align: center;
	margin: 0 auto;
	margin-top: 130px;
}

.logbutton {
	border-radius: 20px border:none;
	border-bottom: 4px solid #23ae60;
	margin-top: 30px;
}

.caption {
	margin-top: 20px;
	text-align: center;
}

.caption a {
	fotn-size: 15px;
	color: #999;
	text-decoration: none;
}

.login-form {
	position: relative;
	z-index: 2;
}

.login-form h1 {
	font-size: 32px;
	color: black;
	text-align: center;
	margin-bottom: 20px;
}

<
script> $( function () { $( "#birthday " ).datepicker( { changeMonth:true,
	changeYear : true
	
}

);
}
);
function fn_memberSubmit () {
	/* 데이터 유효성 체크    */ var f = document.frm;if (f.userid.value == "") {
	alert("아이디를 입력해주세요.");return false;
	
}
if
(f
.pwd
.value
 
"")
{
alert
("패스워드를
 
입력해주세요
.");

        
return
 
false
;

     
}
f
.submit
();

  
}
</
script
>
</style>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>




<body> 

<%@ include file = "../include/header.jsp" %>




		<div class="container">


			<form name="frm" method="post" action="loginsub.jsp">
				<h1>LOGIN</h1>
				<div>
					<input type="text" name="userid" placeholder="아이디를 입력하세요.">
				</div>
				<div>
					<input type="pwd" name="pwd" placeholder="비밀번호를 입력하세요.">

				</div>
				<tr>
					<th><input type="submit" value="로그인"
						onclick="fn_memberSubmit(); return false;"> <input
						type="reset" value="취소" onclick="home.jsp"> <input
						type="button" value="회원가입" onclick="location='memberWrite.jsp'""></th>
					<div class="caption">
						<a href="">Forgot password?</a>
					</div>
				</tr>
			</form>
		</div>


	</section>
	<br>
	<br>
	<br>
	<br>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>