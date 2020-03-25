<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>

<%


String userid1 = request.getParameter("userid");


String bunq = request.getParameter("bunq");
String gubun = request.getParameter("gubun");
String reunq = request.getParameter("reunq");



String dbrecontent = request.getParameter("recontent");

String reSql = "";	


  if("D".equals(gubun)){
  	reSql = "DELETE FROM reboard WHERE reunq='"+reunq+"'";
}else if("U".equals(gubun)){
	reSql = " UPDATE reboard SET recontent='"+dbrecontent+"' "
			 + " WHERE reunq='"+reunq+"' " ; 
}else{
	reSql = " INSERT INTO reboard(reunq,userid,recontent,sdate,boardcode) "
			 + " VALUES ( "
			 + " reunq_seq.NEXTVAL , "
			 + " '"+userid1+"' , "
			 + " '"+dbrecontent+"' , "
			 + " sysdate , "
			 + " '"+bunq+"' ) "; 
} 
 
 
/*  else if(dbrecontent != null || !"".equals(dbrecontent) || !"null".equals(dbrecontent)){
           reSql = " INSERT INTO reboard(reunq,userid,recontent,sdate,boardcode) "
				 + " VALUES ( "
				 + " reunq_seq.NEXTVAL , "
				 + " '"+userid1+"' , "
				 + " '"+dbrecontent+"' , "
				 + " sysdate , "
				 + " '"+bunq+"' ) "; 
   } 
   
 else{
	   reSql = " UPDATE reboard SET recontent='"+dbrecontent+"' "
			 + " WHERE reunq='"+reunq+"' " ; 
	   
   } */
   			 
  stmt.executeUpdate(reSql);  

%>
      <script>
     history.back();
     </script>  

%>	
 