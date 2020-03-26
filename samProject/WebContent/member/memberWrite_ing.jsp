<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="../include/dbcon2.jsp"%>




<!DOCTYPE html>

<html>
<style>
.ul {
	margin-top: 20px;
	display: inline;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	text-weight: bold;
}

.li {
	text-align: center;
	margin-top: 5px;
	text-weight: bold;
}

#btn_up {
	width: 75px;
	border: 1px solid skyblue;
	background-color: #ffffff;
	color: gray;
	padding: 5px;
}

#btn_up:hover {
	border: 1px solid skyblue;
	color: red;
	padding: 5px;
}
</style>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script>

	function fn_action() {
		var f = document.frm;

		if (f.userid.value == "" ) {
			alert("아이디를 입력해주세요");
			f.userid.focus();
			return false;
		}
		if (f.pwd.value == "") {
			alert("비밀번호를 입력해주세요");
			f.pwd.focus();
			return false;
		}if (f.pwd1.value == "") {
			alert("비밀번호를 입력해주세요");
			f.pwd1.focus();
			return false;
		}
	

		if (f.username.value == "") {
			alert("이름을 입력해주세요");
			f.username.focus();
			return false;
		}
		if (f.gender.value == "") {
			alert("성별를 입력해주세요");
			f.gender.focus();
			return false;
		}

		
		if (f.mail.value == "") {
			alert("이메일을 입력해주세요");
			f.mail.focus();
			return false;
		}

		
		if (f.tel.value == "") {
			alert("전화번호를 입력해주세요");
			f.tel.focus();
			return false;
		}

		
		if (f.inter.value == "") {
			alert("관심사를 입력해주세요");
			f.inter.focus();
			return false;
		}

	
		if (f.hiredate.value == "") {
			alert("생년월일을 입력해주세요");
			f.hiredate.focus();
			return false;
		}

		f.submit();
	}
	
</script>


<body>
	<%@ include file="../include/header.jsp"%>


	<form name="frm" method="post" action="memberSave.jsp">

		<!--  표 위치를 가운데로 오도록 만듬 / 테이블 범위확인 -->



		<ul class="ul">
			<li class="li"><input type="text" name="userid"
				placeholder="아이디를 입력하세"></li>
				
			<li class="li"><input type="password" name="pwd"
				placeholder="비밀번호 입력하세요"></li>
				
			<li class="li"><input type="password" name="pwd1"
				placeholder="비밀번호확인하세요."></li>
				
			<li class="li"><input type="text" name="username"
				placeholder="이름을 입력하세요"></li>
				
			<li class="li"><input type="text" name="hiredate"
				placeholder="생년월일 입력하세요"></li>
				
			<li class="li"><input type="email" name="email"
				placeholder="E-mail입력하세요."></li>
				
			<li class="li"><input type="tel" name="tel"
				placeholder="전화번호를 입력하세요."></li>
				
			<li class="li"><label><input type="radio" name="gender"
					value="M">남</label> <label> <input type="radio"
					name="gender" value="F">여
			</label></li>
			
			<li class="li">관심사를 선택하세요.<br> 
			<label><input type="checkbox" name="inter">성인자전거</label> 
			<label><input type="checkbox" name="inter">어린이자전거</label> 
			<label><input type="checkbox" name="inter">전기자전거</label></li>
			
			<li><input type="submit" value="저장"
				onclick="fn_action(); return false;" id="btn_up"> 
				<input type="reset" value="취소" id="btn_up"></li>
				
		</ul>


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