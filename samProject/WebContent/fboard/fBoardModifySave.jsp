<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbcon2.jsp" %>

<%

String userid1 = (String) session.getAttribute("sessionUserid");


String bunq = request.getParameter("bunq");
String title = request.getParameter("title");
String content = request.getParameter("content");

//유효성 체크 
if( title == null && "".equals("title") ){
%>
	<script>
	alert("잘못된 접근입니다");
	history.back();
	</script>
<%
	return;
}

int len = content.length();
if( len > 1000 ){
%>
	<script>
	alert("글자 수가 1000자를 넘었습니다")
	history.back();
	</script>
<% 	
	return; 
}


String sql = " UPDATE pboard SET "
		   + " title = '"+title+"', "
		   + " content = '"+content+"' "
		   + " WHERE userid = '"+userid1+"' and bunq='"+bunq+"' ";
		   

int result = stmt.executeUpdate(sql);

if(result > 0){
%>
     <script>
     
     location = "fBoardList.jsp";
     </script>
<%
}else{
%>	
    <script>
    alert("저장실패");
    history.back();
    </script>
<%
}
%>