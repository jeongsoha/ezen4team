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
<title>홈대리점</title>

</head>



<body> 

  <%@include file="../include/header.jsp" %>


<div class="tabmenu">
  <ul>
    <li id="tab1" class="btnCon"><a class="btn " href="#tab1" >프리미엄 스토어</a>
      <div class="tabCon"  ><%@include file="jijumsch.jsp" %></div>
      
      


<li id="tab2" class="btnCon"><a class="btn" href="#tab2">전기자전거 서비스지정점</a>
      <div class="tabCon" ><%@include file="jijumsch3.jsp" %></div>
      
    </li> 
    
    <li id="tab3" class="btnCon"><a class="btn" href="#tab3">서비스지정점</a>
      <div class="tabCon" ><%@include file="jijumsch4.jsp" %></div>
      
    </li>
    
    <li id="tab4" class="btnCon"><a class="btn" href="#tab4">전기자전거취급점</a>
      <div class="tabCon" ><%@include file="jijumsch5.jsp" %>*7s</div>
      
    </li>
</ul>
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