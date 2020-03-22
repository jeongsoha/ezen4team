<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>

<%
String bunq = request.getParameter("bunq"); 

String sql = " SELECT title,content,pub"
		   + " FROM pboard "
		   + " WHERE bunq='"+bunq+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String content = rs.getString("content");
String pub = rs.getString("pub");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>

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
<h1 style="text-align:center;">공지사항</h1>
<br>
<br>
<br>

  <form name="frm" method="post" action="nBoardModifySave.jsp">
   <input type="hidden" name="bunq" value="<%=bunq %>">
   <div align="center">
<table style="border-collapse: separate; border-spacing: 0 10px;" bgcolor="skyblue">
    
   <tr>
      <th>
         제목 <br>
      </th>
   </tr>
   <tr>
      <td>
         <input type="text" name="title" style="width:600px;" value=<%=title %>> <br>
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
         <textarea name="content" style="width:600px;height:300px;"><%=content %></textarea>
      </td>
   </tr>
   <table style="margin-left:260px;">
       <tr>
          <th> 
             <select name="pub">
                   <option value="1" <%if("1".equals(pub)) out.print("selected"); %>>공개</option>
				   <option value="2" <%if("2".equals(pub)) out.print("selected"); %>>비공개</option>
             </select> &nbsp;&nbsp;
                
             <input type="submit" value="수정완료" style="width:100px;">
             <input type="button" value="취소" onClick="location='nBoardList.jsp'" style="width:100px; ">
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