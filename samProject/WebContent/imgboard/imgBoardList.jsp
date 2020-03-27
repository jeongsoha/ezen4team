<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbcon2.jsp" %>    
    
<%

String admin = (String) session.getAttribute("adminConfirm");

String Domain  ="http://localhost:8080/myProject2";                   
String RealPath = "D:/eclipse-workspace/ezen4team/samProject/WebContent";

/* String imgSql = " SELECT unq,title,imgname1,imgpath1,imgtitle,imgcontent FROM imgboard "
              + " ORDER BY sdate asc ";

ResultSet imgRs = stmt2.executeQuery(imgSql); */



int unit = 3;
String viewPage = request.getParameter("viewPage");
if( viewPage == null ){
	viewPage = "1";
}

String totalSql = " select count(*) total from imgboard";
ResultSet rs2 = stmt.executeQuery(totalSql);
rs2.next();
int total = rs2.getInt("total");
int totalPage = (int)Math.ceil((double)total/unit);
// 1(viewPage)->1 2->11 3->21
int startNo = ( Integer.parseInt(viewPage) - 1 ) * unit +1;
int endNo = startNo + unit-1;

String sql = " select b.* from ( "
	       + " 	select rownum rn, a.* from( "
		   + " select unq,userid,imgname1,imgpath1,title,content,to_char(sysdate,'YYYY-MM-DD') sdate,imgtitle,imgcontent " 
		   + " from imgboard  "
		   + " order by unq desc ) a ) b "
		   + " where rn >= "+startNo+"  and rn <= "+endNo+" ";
		  
ResultSet imgRs = stmt.executeQuery(sql);
				   
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 리스트</title>
</head>
<link rel="stylesheet" href="../css/imgList.css">
<style>
.table1 {
      	width:1100px;
      	border:1px solid #555555;
      	border-collapse:collapse;
      }
</style>

<body> 

<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;">제품소개</h1>
<br>
<br>
<br>



<table align="center">
		 	<tr>
		 	<%
		 	
		 	
		 	int count = 0;
		 	while(imgRs.next()){
		 		String title = imgRs.getString("title");
		 		String imgname1 = imgRs.getString("imgname1");
		 		String imgpath1 = imgRs.getString("imgpath1");
		 		String imgtitle = imgRs.getString("imgtitle");
		 		String imgcontent = imgRs.getString("imgcontent");
		 		int unq = imgRs.getInt("unq");
		 		
		 		String img = Domain + imgpath1 + "/" + imgname1;
		 		
		 	
		 		
		 	%>
		 	<td>
        		<div class="container">
  <h3 class="title"><%=title %></h3>
  <div class="content">
    <a href="imgBoardDetail.jsp?unq=<%=unq %>" >
      <div class="content-overlay"></div>
      <img class="content-image" src="<%=img%>">
      <div class="content-details fadeIn-bottom">
        <h3 class="content-title"><%=imgtitle %></h3>
        <p class="content-text"><%=imgcontent %></p>
      </div>
    </a>
  </div>
</div>
</td>


        		
        	<%
        		if(count%3 == 2){
        			out.print("</tr><tr>");
        		}
        	count++;
		 	}
		 	if( count == 0 ){
		 		out.print("<td class='std'>등록된 상품이 없습니다.</td>");
		 	}
        	%>	       		
        	</tr>
        </table>
   
   <%
if (admin == null){
%>

<%
}else if( "Y".equals(admin) ) {
%>
	
	<div align="center">
		<td><input type="button" value="글쓰기" onClick="location='imgBoardWrite.jsp?'" style="width:100px;" class="btn btn-outline-info"></td>
	</div>
<%
}
%> 
        
      		
  
	<p align="center">
        	<%
        	for(int i=1; i<=totalPage; i++){
        	%>
        	    <a href="imgBoardList.jsp?viewPage=<%=i %>"><%=i %></a>  <!-- 뷰페이지를 통함..  -->
        	<% 
        	}
        	%>
        </p>
	
	
	
<br>
<br>
<br>
<br>

</section>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>