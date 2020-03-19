<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbcon2.jsp" %>

<%
String bunq = request.getParameter("bunq");
String title = request.getParameter("title");
String content = request.getParameter("content");

String sql = " UPDATE pboard SET "
		   + " title = '"+title+"', "
		   + " content = '"+content+"' "
		   + " WHERE bunq = '"+bunq+"' ";
		   

int result = stmt.executeUpdate(sql);

if(result > 0){
%>
     <script>
     alert("저장완료");
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