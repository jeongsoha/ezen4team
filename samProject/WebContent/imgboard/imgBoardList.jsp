<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>    
    
<%

String admin = (String) session.getAttribute("adminConfirm");

int unit = 20;
String viewPage = request.getParameter("viewPage");
if( viewPage == null ){
	viewPage = "1";
}

String totalSql = " select count(*) total from imgboard";
ResultSet rs2 = stmt.executeQuery(totalSql);
rs2.next();
int total = rs2.getInt("total");
int totalPage = (int)Math.ceil((double)total/unit);
// 1(viewPage)->1 2->11 3->21
int startNo = ( Integer.parseInt(viewPage) - 1 ) * unit +1;
int endNo = startNo + unit-1;

String sql = " select b.* from ( "
	       + " 	select rownum rn, a.* from( "
		   + " select unq,userid,imgname1,imgpath1,title,content,to_char(sysdate,'YYYY-MM-DD') sdate ,hit " 
		   + " from imgboard  "
		   + " order by unq desc ) a ) b "
		   + " where rn >= "+startNo+"  and rn <= "+endNo+" ";
		  
ResultSet rs = stmt.executeQuery(sql);
				   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>

<style>
.table1 {
      	width:1100px;
      	border:1px solid #555555;
      	border-collapse:collapse;
      }
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="../css/menu_footer.css">

<script>



</script>

<body> 

<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;">제품소개</h1>
<br>
<br>
<br>



<table align="center" style="margin-right:899px;border-collapse: separate;border-spacing:0 10px;">

	
	
	</table>
	
	<table class="table1" align="center">
	
      		<tr align="center">
      			     			
      		</tr>
      		<%
      		
        	int number = 1;
        	while(rs.next()){
        	String unq = rs.getString("unq");
        	String title = rs.getString("title");
        		        		
        	%>
        	<tr align="center">
        		<td><img src=""></td>	
        	</tr> 
        	
        	<tr align="center">
        		<td><img title=""></td>	
        	</tr>     
        	<%   	
        		number++;
        	}   	
        	%>
    </teble>  		
   
    
        
      		
    <table align="center" style="margin-left:1003px; border-collapse:separate; border-spacing:0 10px;">
<%
if (admin == null){
%>

<%
}else if( "Y".equals(admin) ) {
%>    
	<tr>
		<td><input type="button" value="글쓰기" onClick="fn_Write(); return false;" style="width:100px;" class="btn btn-outline-info"></td>  <!-- 글쓰기 버튼 -->
	</tr>
<%
}
%>	
	<p align="center">
        	<%
        	for(int i=1; i<=totalPage; i++){
        	%>
        	    <a href="imgBoardList.jsp?viewPage=<%=i %>"><%=i %></a>  <!-- 뷰페이지를 통함..  -->
        	<% 
        	}
        	%>
        </p>
	</table>
	
	
<br>
<br>
<br>
<br>

</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>