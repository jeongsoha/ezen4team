
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
String imgtitle = multi.getParameter("imgtitle"); 
String imgcontent = multi.getParameter("imgcontent"); 

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




Enumeration files = multi.getFileNames(); 
int fileSize = 0;

	String file1 = (String)files.nextElement();
	String orgName1 = multi.getFilesystemName(file1); 
	String file2 = (String)files.nextElement();
	String orgName2 = multi.getFilesystemName(file2); 
	
String imgSql = " INSERT INTO imgboard ( "
		      + " unq, userid, title, content, sdate, imgname1, imgpath1,imgname2,imgpath2,imgtitle,imgcontent ) "
	          + " VALUES (iunq_seq.nextVal , "
	          + " '"+admin+"' , "
	          + " '"+title+"' , "
	          + " '"+content+"' , "
	          + " sysdate , "
	          + " '"+orgName1+"' , "
	          + " '"+path+"' , "
	          + " '"+orgName2+"' , "
	    	  + " '"+path+"' , "
	          + " '"+imgtitle+"' , "
	          + " '"+imgcontent+"' ) ";

stmt.executeUpdate(imgSql);			


%>
<script>

location="imgBoardList.jsp";
</script> 