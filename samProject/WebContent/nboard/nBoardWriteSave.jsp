<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>
    
<%@ include file="../include/dbcon2.jsp"  %>
    
<%
// 번호 제목 작성일 조회수 / 공개여부 내용
String title = request.getParameter("title").trim(); 
String content = request.getParameter("content").trim();
String pub = request.getParameter("pub"); 
String userid1 = (String) session.getAttribute("sessionUserid");

String sql = "insert into pboard(bunq,title,content,pub,sdate,userid,gubun)";
sql+= "values(bunq_seq.NEXTVAL , '"+title+"','"+content+"','"+pub+"',sysdate,'"+userid1+"','1')";

if(  title == null || "".equals(title)) {
%>
    <script>
   alert("제목을 입력하세요!");
   history.back();  // 뒤화면 GO
   </script>
<%
   return;
}

if(content == null || "".equals(content)) {
	%>
    <script>
   alert("내용을 입력하세요!");
   history.back();  // 뒤화면 GO
   </script>
<%
   return;
}

if(pub == null || "".equals(pub)) {
	%>
    <script>
   alert("공개여부를 선택해주세요..");
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

int result = stmt.executeUpdate(sql);

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