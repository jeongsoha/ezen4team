<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbcon2.jsp" %>

<%

String userid1 = (String) session.getAttribute("sessionUserid");

String title = request.getParameter("title").trim();
String content = request.getParameter("content");


// 유효성 체크 
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
     location="../fboard/fBoardList.jsp";  //메세지 띄우고 뒤로가기
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