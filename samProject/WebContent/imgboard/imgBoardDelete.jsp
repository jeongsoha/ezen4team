<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon2.jsp" %>

<%

String admin = (String) session.getAttribute("adminConfirm"); 

String unq = request.getParameter("unq");

/* 유효성체크 */
if( unq == null || "".equals(unq) || admin == null || "".equals(admin) ){
%>	
<script>
	alert("잘못된 경로입니다");
	history.back();
</script>	
<% 	
return;
}

String sql = " Delete from imgboard where unq='"+unq+"' ";

int result = stmt.executeUpdate(sql);

%>    

<script>
alert("삭제완료");
location="../imgboard/imgBoardList.jsp"; 
</script>
