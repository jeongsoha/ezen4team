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


String reSql = " SELECT boardcode FROM reboard "
			 + " WHERE boardcode = '"+bunq+"' ";  /* 댓글의 절대값을 가져와 삭제... */

       reSql = " SELECT reunq,userid,recontent,sdate,boardcode FROM reboard "  /* 댓글 출력 */
			 + " WHERE boardcode = '"+bunq+"' "
			 + " ORDER BY sdate asc ";
			

ResultSet reRs = stmt.executeQuery(reSql);



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

<script>

function fn_reWrite() {
	
	/* 데이터 유효성  체크 */
	var f = document.frm2;
	var user = "<%=userid1%>";
	//alert(user);
	if( user != "null" && user != null && user != "") {
		if( f.recontent.value=="" ){
			alert("내용을 입력해주세요.");
			f.recontent.focus();
			return false;  // 자바스크립트 중단!
		}else{
			f.submit();
		}
	}else{
		alert("로그인을 해주세요");
		location ="../fboard/fBoardList.jsp";
	}
	
	
}

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


	<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col" >아이디</th>
      <th scope="col" style="width:800px;">댓글</th>
      <th scope="col">작성시간</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  
  <%
  int number = 1;
  while(reRs.next()){
	  String reuserid = reRs.getString("userid");
	  String recontent = reRs.getString("recontent");
	  String resdate = reRs.getString("sdate");
	  String reunq = reRs.getString("reunq");
	 
  %>
  
  <tbody>
    <tr>
      <th scope="row"><%=number %></th>
      <td><%=reuserid %></td>
      <td><%=recontent %></td>
      <td><%=resdate %></td>
      <%
      if( reuserid.equals(userid1) || "Y".equals(admin) ){
      %>
      <td style="width:10px;">
      <button type="button" class="btn btn-outline-info">수정</button></td>
      
      <td>
      <button type="button" class="btn btn-outline-info" >삭제</button></td>
      <%
      number++;
      }
      %>
   </tr>
  </tbody>
  
  <%
  }
  %>
  
</table>


<form name="frm2" method="post" action="reBoardSave.jsp">
<input type="hidden" name="userid" value="<%=userid1%>"> 
<input type="hidden" name="bunq" value="<%=bunq%>"> 

 <table>
  	<tr>
  		<th>댓글</th>
  		<td><input type="text" name="recontent" style="width:1200px;height:50px;"></td>
  		<td><button type="submit" class="btn btn-secondary btn-lg" onClick="fn_reWrite(); return false;">등록</button></td>
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

