
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbcon2.jsp" %>

<%

String admin = (String) session.getAttribute("adminConfirm");


/*                       이미지                             */

int maxSize = 1024*1024*10; 
String path = "/uploadfile";  //저장할 경로 
String uploadPath = request.getRealPath(path);
MultipartRequest multi = new MultipartRequest( 
request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

String title = multi.getParameter("title");
String content = multi.getParameter("content");

//유효성 체크 
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


Enumeration files = multi.getFileNames(); 
int fileSize = 0;

	String file = (String)files.nextElement();
	String orgName = multi.getFilesystemName(file); 
	
String imgSql = " INSERT INTO imgboard ( "
		      + " unq, userid, title, content, sdate, imgname1, imgpath1 ) "
	          + " VALUES (iunq_seq.nextVal , "
	          + " '"+admin+"' , "
	          + " '"+title+"' , "
	          + " '"+content+"' , "
	          + " sysdate , "
	          + " '"+orgName+"' , "
	          + " '"+path+"' ) ";

stmt.executeUpdate(imgSql);			


%>
<script>
alert("저장완료");
location="imgBoardList.jsp";
</script> 