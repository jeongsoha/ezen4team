<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%
    String header_sessionUserid = (String) session.getAttribute("sessionUserid");
    String header_adminConfirm = (String) session.getAttribute("adminConfirm");
       
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바 </title>
</head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel ="stylesheet" href="../css/menubar.css">


<style>
.header_container{
   width: 1000px;   /* 헤더 중앙에 위치할 px width 값*/
   margin: 0px auto;  /*중앙정렬*/
     
}

</style>

<body>

<header style="background-color:#ffa6cf;height:100px;width:1920px;">
  <div class="header_container"> 
  
  <!-- 배너 좌측에서부터 150px 간격 -->
   <div style="float:left;">   
      <img style="margin-left:-150px;width:100px;height:100px;" src="../images/logo3.JPG" onclick="location='../main/home.jsp'">
   </div>
   <br>
   <br>
    
   <div class="menubar">
   <ul>
      
      <li><a href="#" onclick="location='../jijum/jijum4.jsp'">대리점</a>
      <ul>
         
           <li><a href="#">대리점찾기</a></li>
           <li><a href="#">온라인구매</a></li>
           <li><a href="#">대량구매</a></li>
           
         </ul>
      <li><a href="#" onclick="location='../fboard/fBoardList.jsp'">커뮤니티</a>
       <ul>
         
           <li><a href="#" onclick="location='../nboard/nBoardList.jsp'">공지사항</a></li>
           <li><a href="#" onclick="location='../fboard/fBoardList.jsp'">자유게시판</a></li>
           
           
          </ul>
      <li><a href="../imgboard/imgBoardList.jsp">제품소개</a></li>
      
      
       
        <% if( header_adminConfirm != null){
         %> 
         
      <li><a href="#" onclick="location='../admin/adminBoard.jsp'"> ADMIN메뉴 </a> </li>
              
     
     <%
       }
      
       if( header_sessionUserid == null){
         %> 
         
      <li><a href="#" onclick="location='../member/login.jsp'">로그인</a> </li>
      <li><a href="#" onclick="location='../member/memberWrite.jsp'">회원가입</a></li>
        
        
     
     <%
       } else {
      %>
      
      <li><a href="#" onclick="location='../member/userModify.jsp'">회원정보</a> </li>
      <li><a href="#" onclick="location='../member/logoutsub.jsp'">로그아웃</a></li>
      
       <% } %>
     
   </ul>
</div>
</div>


</header>

</body>
</html>