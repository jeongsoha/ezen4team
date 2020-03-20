<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbcon2.jsp" %>

<%

String userid1 = (String) session.getAttribute("SessionUserId");

String title = request.getParameter("title");
String content = request.getParameter("content");

String sql = " INSERT INTO pboard(bunq,userid,title,content,sdate) "
		   + " VALUES ( bunq_seq.NEXTVAL , "
		   + " '"+userid1+"' , "
		   + " '"+title+"' , "
		   + " '"+content+"' , "
		   + " sysdate ) ";
		   

int result = stmt.executeUpdate(sql);

if(result > 0){
%>
     <script>
     alert("저장완료");
     history.back();  //메세지 띄우고 뒤로가기
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