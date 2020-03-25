<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String sql = " select b.* from ( "
		       + " 	select rownum rn, a.* from( "
			   + " select bunq,title" 
			   + " from pboard where pub='1' "
			   + " order by bunq desc ) a ) b "
       	  + " where rn <= 3 ";
	ResultSet rs = stmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
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
	color:#5483b1;
	padding:5px;
	border-radius: 12px;
	width:120px;
	height:50px;
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
.d{
	float:left;
}
.d1{
	clear:both;
	width:1000px;
     height:300px;
     text-align:center;
}
.d2{
	width:500px;
     height:300px;
     text-align:center;
     background-color : #E8D9FF;
}
.d3{
	width:500px;
     height:300px;
     text-align:center;
     background-color : #ECADFF;
}
.d4{
	clear:both;
	width:1000px;
	height:1000px;
     text-align:center;
     background-color : #B677FF;
}
.detail {
	margin-left:450px;
  	width:1000px;             //1006
  	height:900px;             //906
  	text-align:center;
  }


.table100 {
	clear : both;
 	width : 1000px;
 	height : 300px;
	text-align:center;
	border:3px solid #ccc;
	


</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

</script>


<body style="width:1920px;"> 

<%@ include file = "../include/header.jsp" %>

<div class="container">  
<section>
<div class="detail">



<!-- -------------------111 -->


	<div class="d d1" >
	<img src = "../images/11.JPG" width="331" height="330"><img src = "../images/12.JPG" width="331" height="330"><img src = "../images/13.JPG" width="331" height="330">
	</div>
	
<!-- -------------------222 -->

	<div class="d d2">
	<br>
		<a href="../nboard/nBoardList.jsp">공지사항</a>
		<br><br>		
		<table align="center" style="width:450px;" class="table table-hover" >
	<thead>
		<tr align="center">
			<th width="20%" class=""></th>
			<th width="80%" class="">제목</th>
		</tr>
	</thead>
	<%
		int number=1;
		while(rs.next()){
			String bunq = rs.getString("bunq");
			String title = rs.getString("title");
	%>
	<tr align="center">
		<td><%=bunq %></td>
		<td style="text-align:left;"><a href="nBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
	</tr>
	<%
		number++;
		}
	%>
</table>
		
		
	
	</div>




<!-- -------------------333 -->

	<div class="d d3" >
	<br>
		<a href="../fboard/fBoardList.jsp">자유게시판</a>
		<br><br>
	</div>
	
<!-- -------------------444 -->

	<div class="d d4" >
	<br><br>
		<p> 우리회사 상품 </p>
	</div>
	
<!-- -------------------- -->

</div>

</section>
</div>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>