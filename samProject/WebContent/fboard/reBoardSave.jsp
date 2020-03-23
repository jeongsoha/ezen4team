<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>

<%

String recontent = request.getParameter("recontent");
String userid1 = request.getParameter("userid");
String bunq = request.getParameter("bunq");
String boardcode = request.getParameter("boardcode");

		
String reSql = " INSERT INTO reboard(reunq,userid,recontent,sdate,boardcode) "
				 + " VALUES ( "
				 + " reunq_seq.NEXTVAL , "
				 + " '"+userid1+"' , "
				 + " '"+recontent+"' , "
				 + " sysdate , "
				 + " '"+bunq+"' ) "; 
		



       
			 
stmt.executeUpdate(reSql);

%>
     <script>
     location="http://localhost:8080/myProject2/fboard/fBoardDetail.jsp?bunq=<%=bunq%>";
     </script>

%>	
 