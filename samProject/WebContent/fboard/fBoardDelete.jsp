<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon2.jsp" %>

<%

String bunq = request.getParameter("bunq");

/* 유효성체크 */
if( bunq == null || "".equals(bunq) ){
%>	
<script>
	alert("잘못된 경로입니다");
	history.back();
</script>	
<% 	
return;
}

String sql = " UPDATE pboard SET pub='2' WHERE bunq='"+bunq+"' ";

int result = stmt.executeUpdate(sql);

%>    

<script>
alert("삭제완료");
location="../fboard/fBoardList.jsp"; 
</script>
