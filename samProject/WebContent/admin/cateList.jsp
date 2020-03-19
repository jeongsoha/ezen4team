<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      <!-- //안쓰는거 -->
     <%@ include file="..\\include\\dbcon2.jsp" %>
    
    <%
    
    String dbcode = request.getParameter("code");
    String dbname = " ";
    
    if(dbcode != null && !"".equals(dbcode)) {
    	String sql2 = " select catename from category " 
    			+ " where code='"+dbcode+"'";
    	
    	ResultSet rs2 = stmt.executeQuery(sql2);
    	rs2.next();
    	dbname = rs2.getString("catename");
    	
    	}
    
    
    String sql = " SELECT code, catename FROM category "
    		 + "order by catename asc" ;
    
    ResultSet rs = stmt.executeQuery(sql);
    
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
</head>

   <link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
   
<style>

</style>

<body>
	<div class="container">
		<div class="adminLeft">
		
		<%@ include file="leftMenu.jsp" %>
			
		</div>

		<div class="adminRight">
			<!-- 카테목록 -->
			<table class="table1" >
				<tr>
					<th width="20%">순번</th>
					<th width="50%">카테고리</th>
					<th width="15%">수정</th>
					<th width="15%">삭제</th>
				</tr>

				<%
				int number=1;
				while(rs.next() ) {
					
					String code = rs.getString("code");
					String catename = rs.getString("catename");
		
				%>
				<tr>
					<td><%=number %></td>
					<td><%=catename %></td>
					<td><a href="<%=request.getRequestURL()%>?code=<%=code%>">수정</a></td>  <!-- 자기자신 -->
					<td><a href="cateSave.jsp?code=<%=code%>&gubun=D">삭제</td>
				</tr>
	<%	
	number++;
	}
	%>
			</table>

			<!-- 카테등록 -->
			<%
			String buttonMsg = "";
			if ("".equals(dbcode) || dbcode == null) {
				buttonMsg = "등록";
				
			} else {
				buttonMsg = "수정";
			}
			%>
			
	<form name="frm" method="post" action="cateSave.jsp">
			<input type="hidden" name="code" value="<%=dbcode %>">
			<input type="text" name="cateName" value="<%=dbname %>"> 
			<button type="submit"><%=buttonMsg %></button>
			
			</form>
			
		</div>
		
	</div>
</body>
</html>