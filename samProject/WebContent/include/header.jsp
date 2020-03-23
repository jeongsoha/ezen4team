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
  
      <button id="hbutton" onclick="location='../member/memberWrite.jsp'">회원가입</button> 
      <button id="hbutton" onclick="location='../member/login.jsp'">로그인</button> 
      
      <%
       } else {
      %>
            
      <button id="hbutton">회원정보</button> 
      <button id="hbutton" onclick="location='../member/logoutsub.jsp'">로그아웃</button> 
      
       <% } %>
   
      <button id="hbutton" onclick="location='../jijum/jijum3.jsp'">회사소개</button> 
      <button id="hbutton" onclick="location='../fboard/fBoardList.jsp'">커뮤니티</button> 
      <button id="hbutton">제품소개</button> 
      <button id="hbutton" onclick="location='../main/home.jsp'">홈</button> 
      
      
   </div>
   </div>
   
</header>

</body>
</html>