<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbcon2.jsp" %>    

<%

String userid1 = (String) session.getAttribute("sessionUserid");
String admin = (String) session.getAttribute("adminConfirm");

String bunq = request.getParameter("bunq");

String sql = " UPDATE pboard SET hit = hit+1 "  // 조회수 증가 
		+ " WHERE bunq = '"+bunq+"' ";

	stmt.executeUpdate(sql);

 sql = " SELECT userid,title,content,to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') sdate,hit "   //디테일 출력 
		   + " FROM pboard "
		   + " WHERE bunq='"+bunq+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

String userid = rs.getString("userid");
String title = rs.getString("title");
String content = rs.getString("content");
String sdate = rs.getString("sdate");
String hit = rs.getString("hit");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>
<style>

   .table1 {
      	width:600px;
      	border:1px solid #555555;
      	border-collapse:collapse;
      }
      
      .td1{
      	border:1px solid #555555;
      	padding:5px;
      }
      
</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="../css/menu_footer.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<body> 



<%@ include file = "../include/header.jsp" %>

<section>

<br>
<br>
<h1 style="text-align:center;">자유게시판</h1>
<br>
<br>
<br>

<!--                 폼                -->

<form name="frm" method="post" action="fBoardModify.jsp">

<input type="hidden" name="bunq" value="<%=bunq %>" >  <!-- 유니크값 같이 보내기 -->

	<div align="center">
	
<table style="margin-left:0px;">
         <tr align="left">
               <td>글쓴이</td>
               <td width="150px" class="td1"><%=userid %></td>
               <td>작성일</td>
               <td width="200px" class="td1"><%=sdate %></td>
               <td>조회수</td>
               <td width="100px" class="td1"><%=hit %></td>
            </tr>
</table>

<table style="border-collapse: separate; border-spacing: 0 10px;">

   <tr>
      <td>제목</td>
   </tr>
   
   <tr>
   	  <td><%=title %></td>
   </tr>
   
   <tr>
      <td>내용</td>
   </tr>
   
   <tr>
      <td><textarea name="content" style="width:600px;height:300px;" readOnly><%=content %></textarea></td>
   </tr>

</table>

<%
if (userid1 == null){
%>

<%
}else if( userid1.equals(userid) || "Y".equals(admin) ) {
%>
 
	<table>
	<tr>
		<td><input type="submit" value="수정" style="width:100px;"></td>
		<td><input type="button" value="삭제" style="width:100px;color:#fdfde9;" onClick="location='fBoardDelete.jsp?bunq=<%=bunq%>'"></td>
	</tr>
	</table>
<%
}
%>

	</div>
	
	<!--                   댓글                         -->
	
</form>

<form name="frm2" method="post" action="">

	<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">아이디</th>
      <th scope="col">댓글</th>
      <th scope="col">작성시간</th>
    </tr>
  </thead>
  <tbody>
  
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
   
  </tbody>
</table>

</form>

<br>
<br>
<br>
<br>

</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>