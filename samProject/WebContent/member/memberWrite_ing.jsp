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
	margin-top: 50px;
	display: inline;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	text-weight: bold;
}

.li {
	text-align: center;
	margin-top: 7px;
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
$(function(){
$("#birthday").datepicker({
	changeMonth :true,
	changeYear :true
});
});

</script>

<script>

function fn_mailchack() {
   /* 데이터 유효성체크 */
   var f = document.frm;
   
   
   
   //성별 유효성은 패스 (공백으로 넘어가면 save 에서 막음)
   
   // 이메일 유효성체크 했음. body에는 서밋 말고 버튼으로 진행할 것 (정규표현식)
    // alert(document.getElementById("emailc").value);  id가 emailc 의 요소값을 엘럿 함.
       var email = document.getElementById("mail").value;
       var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
               if(exptext.test(email)==false){  //test 는 첨보네
           //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우         
           alert("E-mail 형식이 올바르지 않습니다.");
          
           document.addjoin.email.focus();
           
           return false;
       } else {
              alert("E-mail 형식이 올바릅니다.");}
               
            f.submit();
   
}
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
			alert("비밀번호를 확인해주세요.");
			f.pwd1.focus();
			return false;
		}
	
		if (f.username.value == "") {
			alert("이름을 입력해주세요");
			f.username.focus();
			return false;
		}
		if (f.hiredate.value == "") {
			alert("생년월일을 입력해주세요");
			f.hiredate.focus();
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
		if (f.gender.value == "") {
			alert("성별를 입력해주세요");
			f.gender.focus();
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
				
			<li class="li"><input type="text" name="birth"
				placeholder="생년월일 입력하세요"></li>
				
			<li class="li"><input type="email" name="mail"
				id="mail" placeholder="E-mail입력하세요."></li>
				
			<li class="li"><input type="tel" name="tel"
				placeholder="전화번호를 입력하세요."></li>
				
			<li class="li"><label><input type="radio" name="gender"
					value="M">남</label> <label> <input type="radio"
					name="gender" value="F">여
			</label></li>
			
		
			<li class="li">관심사를 선택하세요.<br> 
			
                  <select style="width:200px;height:40px;" name="inter" > 
                  <option value="0">&nbsp; -- 선 택 --   <!-- 이상태로 넘어가면, 미선택 0 으로 세팅-->
                  <option value="1">&nbsp; 자전거 <!-- 참고기능  selected -->
                  <option value="2">&nbsp; 킥보드 <!-- 참고기능  selected -->
                  </select>
                
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