<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%
    String sessionUserid = (String) session.getAttribute("sessionUserid");
    String adminConfirm = (String) session.getAttribute("adminConfirm");
       
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script>

function moveIn() {
	location = "../member/login.jsp";
}

function moveOut() {
	location = "../member/logoutsub.jsp";
}

function movefBoard() {
	location = "../fboard/fBoardList.jsp";
}

function moveHome() {
	location = "../main/home.jsp";
}

function moveUp() {
	location = "../member/memberWrite.jsp";
}

</script>


<body>


<header style="background-color:#2d3246;height:100px;width:1920px;">

<div class="container">
   <div style="float:left;margin-left:10px;">
      <img style="width:200px;height:90px;" src="../images/logo.JPG">
   </div>
   <br>
   <br>
   <div id="hdiv" style="margin-right:100px;">
   
      <% if( sessionUserid == null){
    	  %> 
  
      <button id="hbutton" onclick="moveUp()">회원가입</button> 
      <button id="hbutton" onclick="moveIn()">로그인</button> 
      
      <%
       } else {
      %>
            
      <button id="hbutton">회원정보수정</button> 
      <button id="hbutton" onclick="moveOut()">로그아웃</button> 
      
       <% } %>
   
      <button id="hbutton">회사소개</button> 
      <button id="hbutton" onclick="movefBoard()">커뮤니티</button> 
      <button id="hbutton">제품소개</button> 
      <button id="hbutton" onclick="moveHome()">홈</button> 
   </div>
   </div>
   
</header>

</body>
</html>