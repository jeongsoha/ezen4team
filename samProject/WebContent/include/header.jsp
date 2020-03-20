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

function movein() {
	location = "../member/login.jsp";
}

function moveout() {
	location = "../member/logoutsub.jsp";
}

function moveboard() {
	location = "../fboard/fBoardList.jsp";
}

</script>


<body>


<header style="background-color:#2d3246;height:100px;width:1898px;">
   <div style="float:left;margin-left:100px;">
      <img style="width:250px;height:90px;" src="../images/logo.JPG">
   </div>
   <br>
   <br>
   <div id="hdiv" style="margin-right:100px;">
   
      <% if( sessionUserid == null){
    	  %> 
  
      <button id="hbutton">회원가입</button> 
      <button id="hbutton" onclick="movein()">로그인</button> 
      
      <%
       } else {
      %>
            
      <button id="hbutton">회원정보수정</button> 
      <button id="hbutton" onclick="moveout()">로그아웃</button> 
      
       <% } %>
   
      <button id="hbutton">회사소개</button> 
      <button id="hbutton" onclick="moveboard()">커뮤니티</button> 
      <button id="hbutton">제품소개</button> 
      <button id="hbutton">홈</button> 
   </div>
</header>

</body>
</html>