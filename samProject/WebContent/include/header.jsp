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
   width: 1400px;   /* 헤더 중앙에 위치할 px width 값!! 탑메뉴 이동*/     
   margin: 0px auto;  /*중앙정렬*/
     
}

</style>

<body>

<header style="background-color:#006633;height:120px;width:1920px;">    <!-- 헤더바탕색 -->
  <div class="header_container"> 
  
  <!-- 배너 좌측에서부터 150px 간격 -->
   <div style="float:left; border-radius: 12px;">   
      <img style="margin-left:-30px;margin-top:20px;width:120px;height:80px;" src="../images/logo2.PNG" onclick="location='../main/home.jsp'">
   </div>                                                           <!-- 헤더 로고 -->
   <br>
   <br>
    
   <div class="menubar">
   <ul style=margin-top:10px; border-radius: 12px;>
      
      <li><a href="#" onclick="location='../jijum/jijum4.jsp'">대리점</a>
      <ul>
         
           <li><a href="#" onclick="location='../jijum/jijum4.jsp'">대리점찾기</a></li>
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