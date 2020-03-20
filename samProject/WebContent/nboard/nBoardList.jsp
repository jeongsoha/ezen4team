<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>    
    
<%

String userid1 = (String) session.getAttribute("sessionUserId");

String sql = " SELECT "
          +    " bunq , "
         +    " title , "
         +    " userid , "
         +   " to_char(sysdate,'YYYY-MM-DD') sdate , "
         +    " hit "
         + " FROM pboard "
         + " ORDER BY "
         + " bunq desc ";

ResultSet rs = stmt.executeQuery(sql);
               
%>

<script>
function fn_write() {
	var f = document.frm;
	
	if(<%=userid1%> == null || "".equals("userid1")){
		alert("로그인을 해주세요.");
	} else{
		location='nBoardWrite.jsp';
	}
	f.submit();
}

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
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

.table1 {
         width:1100px;
         border:1px solid #555555;
         border-collapse:collapse;
      }
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<body> 
<%@ include file = "../include/header.jsp" %>

<section>

<section>
<br>
<br>
<h1 style="text-align:center;">공지사항</h1>
<br>
<br>
<br>



<table align="center" style="margin-right:700px; border-collapse: separate;border-spacing:0 10px;">

   <tr>
      <td><input type="button" value="공지사항" OnClick="location='../nboard/nBoardList.jsp'" style="width:100px;"></td>
      <td><input type="button" value="자유게시판" OnClick="location='../fboard/fBoardList.jsp'" style="width:100px;"></td>
   </tr>
   
   </table>
   
   <table class="table1" align="center" style="width:900px;" bgcolor="#ffffff">
            <tr align="center">
               <th width="10%" class="td1"></th>
               <th width="50%" class="td1">제목</th>
               <th width="15%" class="td1">작성자</th>
               <th width="15%" class="td1">작성일</th>
               <th width="10%" class="td1">조회수</th>
            </tr>
            
            <%
           int number = 1;
           while(rs.next()){
              String bunq = rs.getString("bunq");
              String title = rs.getString("title");
              String sdate = rs.getString("sdate");
              String hit = rs.getString("hit");
              
           %>
           <tr align="center">
              <td><%=bunq %></td>
              <td  style="text-align:left;"><a href="nBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
              <td>soha</td>
              <td><%=sdate %></td>
              <td><%=hit %></td>
           </tr>   
           <%      
              number++;
           }      
           %>
    </table>       
            
    <table align="center" style="margin-left:800px; border-collapse:separate; border-spacing:0 10px;">
   <tr>
      <td><input type="button" value="글쓰기" onClick="fn_write(); return false;" style="width:100px;"></td>  <!-- 글쓰기 버튼 -->
   </tr>
   </table>




<br>
<br>
<br>
<br>

</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>