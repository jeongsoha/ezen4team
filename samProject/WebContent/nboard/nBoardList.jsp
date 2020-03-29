<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>    
    
<%
String admin = (String) session.getAttribute("adminConfirm");

int unit = 10;
String viewPage = request.getParameter("viewPage");
if( viewPage == null ){
	viewPage = "1";
}
String totalSql = "";
if("Y".equals(admin)) {
	totalSql = " select count(*) total from pboard where gubun='1' ";
}else{
	totalSql = " select count(*) total from pboard where pub='1' and gubun='1' ";
}
ResultSet rs2 = stmt.executeQuery(totalSql);
rs2.next();
int total = rs2.getInt("total");
int totalPage = (int)Math.ceil((double)total/unit);
// 1(viewPage)->1 2->11 3->21
int startNo = ( Integer.parseInt(viewPage) - 1 ) * unit +1;
int endNo = startNo + unit-1;

String sql = "";
if("Y".equals(admin)) {
	sql = " select b.* from ( "
		       + " 	select rownum rn, a.* from( "
			   + " select bunq,title,userid,to_char(sysdate,'YYYY-MM-DD') sdate ,hit,pub" 
			   + " from pboard where gubun='1' "
			   + " order by bunq asc ) a ) b "
	         + " where rn >= "+startNo+"  and rn <= "+endNo+" ";
}else {
	sql = " select b.* from ( "
		       + " 	select rownum rn, a.* from( "
			   + " select bunq,title,userid,to_char(sysdate,'YYYY-MM-DD') sdate ,hit,pub" 
			   + " from pboard where pub='1' and gubun='1' "
			   + " order by bunq asc ) a ) b "
       	  + " where rn >= "+startNo+"  and rn <= "+endNo+" ";
}
ResultSet rs = stmt.executeQuery(sql);

               
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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


<br>
<br>
<h1 style="text-align:center;">공지사항</h1>
<br>
<br>
<br>

<table align="center" style="margin-right:700px; border-collapse: separate;border-spacing:0 10px;">
   <tr>
      <td><input type="button" value="공지사항" class="btn btn-secondary" OnClick="location='../nboard/nBoardList.jsp'" style="width:100px;"></td>
<td>&nbsp;&nbsp;&nbsp;</td>   
      <td><input type="button" value="자유게시판" class="btn btn-secondary" OnClick="location='../fboard/fBoardList.jsp'" style="width:100px;"></td>
   </tr>

</table>


   
   <table align="center" style="width:900px;" class="table table-striped">
    <thead>
            <tr align="center">
               <th width="10%" class="td1"></th>
               <th width="40%" class="td1">제목</th>
               <th width="15%" class="td1">작성자</th>
               <th width="15%" class="td1">작성일</th>
               <th width="10%" class="td1">조회수</th>
               <%
               if("Y".equals(admin)) {
               %>
               <th width="10%" class="td1">공개여부</th>
               <%
               }
               %>
            </tr>
    </thead>
            <%
           int number = 1;
           while(rs.next()){
              String bunq = rs.getString("bunq");
              String title = rs.getString("title");
              String sdate = rs.getString("sdate");
              String hit = rs.getString("hit");
              String pub = rs.getString("pub");
              String rn = rs.getString("rn");

           %>
           <tr align="center">
              <td><%=rn %></td>
              <td  style="text-align:left;"><a href="nBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
              <td>관리자</td>
              <td><%=sdate %></td>
              <td><%=hit %></td>
              <%
              if("Y".equals(admin)) {
              %>
              <td><%=pub %></td>
              <%
              }
              %>
              
           </tr> 

           <%   
              number++;
           }      
           %>
           
    </table>       
    
      <%
       if("Y".equals(admin)) {
      %>
    <table align="center" style="margin-left:800px; border-collapse:separate; border-spacing:0 10px;">
   <tr>
      <td><input type="button" class="btn btn-secondary" value="글쓰기" onClick="location='nBoardWrite.jsp'" style="width:100px;"></td>  <!-- 글쓰기 버튼 -->
   </tr>
   </table>
      <%
        }
      %>
      <p align="center">
        	<%
        	for(int i=1; i<=totalPage; i++){
        	%>
        	    <a href="nBoardList.jsp?viewPage=<%=i %>"><%=i %></a>  <!-- 뷰페이지를 통함..  -->
        	<% 
        	}
        	%>
        </p>
   




<br>
<br>
<br>
<br>

</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>