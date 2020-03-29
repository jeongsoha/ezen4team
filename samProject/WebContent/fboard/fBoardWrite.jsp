<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>

<%
String userid1 = (String) session.getAttribute("sessionUserid"); 

if( userid1 == null && "".equals(userid1) ) {
%>
	<script>
	alert("잘못된 경로입니다");
	location = "../main/main.jsp";
	</script>
<% 	

}
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

function fn_WriteInsert(){
		/* 데이터 유효성  체크 */
		var f = document.frm;
		
		if( f.title.value=="" ){
			alert("제목를 입력해주세요.");
			f.title.focus();
			return false;  // 자바스크립트 중단!
		}
		
		if( f.content.value=="" ){
			alert("내용을 입력해주세요.");
			f.content.focus();
			return false;  // 자바스크립트 중단!
		}
	
		f.submit();
	}

</script>

<body> 

<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;" class="text-info">자유게시판</h1>
<br>
<br>
<br>

<form name="frm" method="post" action="fBoardWriteSave.jsp">
	<div align="center">
	<table style="margin-left:0px;border-collapse: separate;border-spacing:0 10px;">
		<tr>
        	<th class="badge badge-dark" style="font-size:17px;">제목</th>
        </tr>
        <tr>
        	<td><input type="text" name="title"  style="width:600px;"></td>
        </tr>
         
	     <tr>
	        <th class="badge badge-dark" style="font-size:17px;">내용</th>
	     </tr>
	     <tr>
	      <td><textarea name="content" style="width:600px;height:300px;"></textarea></td>
	     </tr>
	     
	</table>
	
	
	<table>
	<tr>
		<td><input type="submit" value="등록" onClick="fn_WriteInsert(); return false;" style="width:100px;" class="btn btn-outline-info"></td>
		<td><input type="button" value="취소" onClick="location='fBoardList.jsp'" style="width:100px;" class="btn btn-outline-info"></td>
	</tr>
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