<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>    
    
<%

String userid1 = (String) session.getAttribute("sessionUserid"); 




String sql = " SELECT "
	       + 	" bunq , "
		   + 	" title , "
		   + 	" userid , "
		   +	" to_char(sysdate,'YYYY-MM-DD') sdate , "
		   + 	" hit "
		   + " FROM pboard "
		   + " ORDER BY "
		   + " bunq desc ";

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

function fn_Write(){
	
	var f = document.frm;
	
	var user = "<%=userid1%>";
	//alert(user);
	if( user != "null" && user != null && user != "") {
		location = "../fboard/fBoardWrite.jsp";
	}else{
		alert("로그인을 해주세요");
		location ="../main/home.jsp";
	}
		f.submit();
}

</script>

<body> 
<%out.print(userid1); %>
<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;">자유게시판</h1>
<br>
<br>
<br>



<table align="center" style="margin-right:899px;border-collapse: separate;border-spacing:0 10px;">

	<tr>
		<td><input type="button" value="공지사항" OnClick="location='../nboard/nBoardList.jsp'" style="width:100px;"></td>
		<td><input type="button" value="자유게시판" OnClick="location='fBoardList.jsp'" style="width:100px;"></td>
	</tr>
	
	</table>
	
	<table class="table1" align="center">
      		<tr align="center">
      			<th width="8%" class="td1">번호</th>
      			<th width="60%" class="td1">제목</th>
      			<th width="15%" class="td1">글쓴이</th>
      			<th width="10%" class="td1">작성일</th>
      			<th width="5%" class="td1">조회수</th>
      		</tr>
      		<%
        	int number = 1;
        	while(rs.next()){
        		String bunq = rs.getString("bunq");
        		String title = rs.getString("title");
        		String userid = rs.getString("userid");
        		String sdate = rs.getString("sdate");
        		String hit = rs.getString("hit");
        		        		
        	%>
        	<tr align="center">
        		<td><%=bunq %></td>
        		<td  style="text-align:left;"><a href="fBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
        		<td><%=userid %></td>
        		<td><%=sdate %></td>
        		<td><%=hit %></td>
        	</tr>   
        	<%   	
        		number++;
        	}   	
        	%>
    </teble>  		
      		
    <table align="center" style="margin-left:1003px; border-collapse:separate; border-spacing:0 10px;">
	<tr>
		<td><input type="button" value="글쓰기" onClick="fn_Write(); return false;" style="width:100px;"></td>  <!-- 글쓰기 버튼 -->
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