<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="..\\include\\dbcon2.jsp"%>

<%    
    
    String sql = " SELECT jino, jicode, jiname, jiaddr, jitel, "
  				+ " jiabil1,jiabil2, jiabil3,jirecomend,jistate, "
    			+ " to_char(jisdate,'yyyy-mm-dd') jisdate, "
    			+ " jistar FROM pjijum "
    			+ " order by jino DESC " ;
    
        
    ResultSet rs = stmt.executeQuery(sql);
    
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민화면</title>
</head>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 제이쿼리 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script>
  $( function() {
    $( "#tabs" ).tabs({
      collapsible: true
    });
  } );
  </script>
  
  
<style>

.table101 {
	float: left;
 	width :	700px;
 	height : 100px;
	text-align:center;
	border:3px solid #ccc;

}

.table102 {
	float: left;
 	width :	700px;
 	height : 600px;
	text-align:center;
	border:3px solid #ccc;

}


</style>



<body style="width:1920px;"> 

<%@ include file = "../include/header.jsp" %>


	<div class="container">  

		<div style="float: left; width: 1000px; height: 150px"
			class="adminLeft">
		<%@ include file="topMenu.jsp"%>
		</div>

 
		<div class="adminRight">
			<!-- 카테목록 -->

			<div class="dashboard">대시보드 상단 (검색기능)</div>

			<table class="memberlist">
				<tr>
					<th>지점번호</th>
					<th>지점코드</th>
					<th>지점명</th>
					<th>지점주소</th>
					<th>지점연락처</th>
					<th>등록일</th>
					<th>능력1</th>
					<th>능력2</th>
					<th>능력3</th>
					<th>추천여부</th>
					<th>지점상태</th>
					<th>평점</th>
					 
				</tr>

				<%
				int number=1;
				while(rs.next() ) {
					
					String jino = rs.getString("jino");
					String jicode = rs.getString("jicode");
					String jiname = rs.getString("jiname");
					String jiaddr = rs.getString("jiaddr");
					String jitel = rs.getString("jitel");
					String jisdate = rs.getString("jisdate");
					String jiabil1 = rs.getString("jiabil1");
					String jiabil2 = rs.getString("jiabil2");
					String jiabil3 = rs.getString("jiabil3");
					String jirecomend = rs.getString("jirecomend");
					String jistate = rs.getString("jistate");
					String jistar = rs.getString("jistar");
					
			
		
				%>
				<tr>
					<td><%=jino %></td>
					<td><a href="memberModify.jsp?jino=<%=jino%>"><%=jicode %></td>  <!-- 코드누르면 수정창 -->
					<td><%=jiname %></td>
					<td><%=jiaddr %></td>
					<td><%=jitel %></td>
					<td><%=jisdate %></td>
					<td><%=jiabil1 %></td>
					<td><%=jiabil2 %></td>
					<td><%=jiabil3 %></td>
					<td><%=jirecomend %></td>
					<td><%=jistate %></td>
					<td><%=jistar %></td>
					 
					<!-- 수정화면 전환 -->

				</tr>
				<%	
	number++;
	}
	%>
			</table>

		</div>

	</div>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>