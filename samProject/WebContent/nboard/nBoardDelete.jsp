<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %>
    
    
    
<%
String bunq = request.getParameter("bunq");

String sql = " delete from pboard where bunq='"+bunq+"' ";
int result = stmt.executeUpdate(sql);
%>

<script>
alert("삭제완료!");
location = "nBoardList.jsp";
</script>