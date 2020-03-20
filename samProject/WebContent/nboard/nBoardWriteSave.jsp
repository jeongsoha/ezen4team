<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>
    
<%@ include file="../include/dbcon2.jsp"  %>
    
<%
// 번호 제목 작성일 조회수 / 공개여부 내용
String title = request.getParameter("title").trim(); 
String content = request.getParameter("content").trim();
String pub = request.getParameter("pub"); 

String sql = "insert into pboard(bunq,title,content,pub,sdate,userid)";
sql+= "values(bunq_seq.NEXTVAL , '"+title+"','"+content+"','"+pub+"',sysdate,'soha')";

int result = stmt.executeUpdate(sql);

if(  title == null || "".equals(title)) {
%>
    <script>
   alert("잘못된 접근");
   history.back();  // 뒤화면 GO
   </script>
<%
   return;
}

if(content == null || "".equals(content)) {
	%>
    <script>
   alert("잘못된 접근");
   history.back();  // 뒤화면 GO
   </script>
<%
   return;
}

// 내용길이 검사
int len = content.length();
if( len > 1000 ) {
%>
   <script>
   alert("1000자 이하 작성");
   history.back();  // 뒤화면 GO
   </script>
<%
   return;
}



 if(result > 0) {
%>
   <script>
   alert("저장완료");
   location = "nBoardList.jsp";
   </script>
 <%
 } else {
 %>
   <script>
   alert("저장실패");
   </script>
 <%
 }
 %>