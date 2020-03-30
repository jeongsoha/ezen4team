<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbcon2.jsp" %>

<%
String userid1 = (String) session.getAttribute("sessionUserId");
%>   

<script>
function fn_write() {
	var f = document.frm;
	f.submit();
}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">

<style>
/* #5483b1 */
#hbutton {
   border-top-right-radius:5px; 
   border-bottom-right-radius:5px; 
   margin-left:-3px;

}

#hdiv button {
   border:1px solid #5483b1;
   background-color: rgba(0,0,0,0);
   color:#ffffff;
   padding:5px;
   border-radius: 12px;
   width:5%;
   height:20%;
   float:right;
   margin-left:10px;
   
}

#hdiv button:hover{
   color:white; 
   background-color:#5483b1; 
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
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
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

</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<body> 
<%@ include file = "../include/header.jsp" %>
<section>

<section>

<br><br>
<h1 style="text-align:center;">공지사항</h1>
<br><br>
<br>
   <form name="frm" method="post" action="nBoardWriteSave.jsp">
   <div align="center">
<table style="border-collapse: separate; border-spacing: 0 10px;">
    
   <tr>
      <th>
         제목 <br>
      </th>
   </tr>
   <tr>
      <td>
         <input type="text" name="title" style="width:600px;"> <br>
      </td>
   </tr>
   
   <tr>
      <br>
   </tr>
   <tr>
      <th>
         내용 <br>
      </th>
   </tr>
   <tr>
      <td>
         <textarea name="content" style="width:600px;height:300px;"></textarea>
      </td>
   </tr>
   <table style="margin-left:260px;">
       <tr>
          <th> 
             <select name="pub">
               
                   <option value="1" selected >공개</option>
                   <option value="2">비공개</option>
                </select> &nbsp;&nbsp;
                
             <input type="button" value="등록" class="btn btn-secondary" onClick="fn_write(); return false;" style="width:100px;">
             <input type="button" value="취소" class="btn btn-secondary" onClick="location='nBoardList.jsp'" style="width:100px; ">
          </th>
       </tr>
   </table>
   </table>  

   </div>
   </form>
   






<br>
<br>
<br>
<br>

</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>