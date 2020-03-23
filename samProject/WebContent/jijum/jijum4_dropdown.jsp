<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
     <%
    String sessionUserid = (String) session.getAttribute("sessionUserid");
    String adminConfirm = (String) session.getAttribute("adminConfirm");
       //set
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈대리점</title>

</head>



<style>
 <%@include file="../css/menu_down.css"%>
 </style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>





<body> 

  <%@ include file="../include/header.jsp" %>

</header>

<div class="tabmenu">
  <ul>
    <li id="tab1" class="btnCon"><a class="btn first" href="#tab1">프리미엄 스토어</a>
      <div class="tabCon" >1</div></li>


<li id="tab2" class="btnCon"><a class="btn" href="#tab2">전기자전거 서비스지정점</a>
      <div class="tabCon" >234</div>
      
    </li> 
    
    <li id="tab3" class="btnCon"><a class="btn" href="#tab3">서비스지정점</a>
      <div class="tabCon" >789</div>
      
    </li>
    
    <li id="tab4" class="btnCon"><a class="btn" href="#tab4">전기자전거취급점</a>
      <div class="tabCon" >456</div>
      
    </li>
</ul>
</div>
</div>








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

<%@include file="../include/footer.jsp" %>
   
</body>
</html>