<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1 style="text-align:center;">자유게시판</h1>
<br>
<br>
<br>

<form name="frm" method="post" action="fBoardSave.jsp">
	<div align="center">
	<table style="margin-left:0px;border-collapse: separate;border-spacing:0 10px;">
		<tr>
        	<th>제목</th>
        </tr>
        <tr>
        	<td><input type="text" name="title"  style="width:600px;"></td>
        </tr>
         
	     <tr>
	        <th>내용</th>
	     </tr>
	     <tr>
	      <td><textarea name="content" style="width:600px;height:300px;"></textarea></td>
	     </tr>
	     </div>
	</table>
	
	<table style="margin-left:400px;">
	<tr>
		<td><input type="submit" value="등록" style="width:100px;"></td>
		<td><input type="reset" value="취소" style="width:100px;color:#fdfde9;"></td>
	</tr>
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