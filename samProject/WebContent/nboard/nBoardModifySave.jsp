<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon2.jsp"  %>
    
<%
// 번호 제목 작성일 조회수 / 공개여부 내용
String bunq = request.getParameter("bunq");
String title = request.getParameter("title"); 
String content = request.getParameter("content");
String pub = request.getParameter("pub"); 

if(  title == null || "".equals(title)) {
%>
    <script>
   alert("제목을 작성해주세요.");
   history.back();
   </script>
<%
   return;
}

if(content == null || "".equals(content)) {
	%>
    <script>
   alert("내용을 작성해주세요.");
   history.back();
   </script>
<%
   return;
}

// 내용길이 검사
int len = content.length();
if( len > 1000 ) {
%>
   <script>
   alert("최대 1000자 작성가능합니다.");
   history.back();
   </script>
<%
   return;
}

String sql = " update pboard set "
           + " title = '"+title+"', "
           + " content = '"+content+"', "
           + " pub = '"+pub+"' "
           + " WHERE bunq = '"+bunq+"' ";

int result = stmt.executeUpdate(sql);

if(result > 0){
%>
     <script>
     alert("저장완료");
     location = "nBoardList.jsp";
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
        
        
        
