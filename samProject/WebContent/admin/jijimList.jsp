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
<meta name="viewport" content="width=devide-width" , initial-scale="1">
<title>지점 관리</title>
</head>

<link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
<!-- // 아직없다 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">





<style>
.mainbody {
	width: 1500px;
	height: 1000px;
	border: 1px solid #ccc;
}

.adminLeft {
	width: 210px;
	border: 1px solid #ccc;
	float: none;
}

.adminRight {
	width: 1010px;
	border: 1px solid #ccc;
	float: left;
}

.dashboard {
	width: 1010px;
	height: 150px;
	border: 1px solid #ccc;
	float: left;
}

.memberlist {
	width: 1000px;
	border: 1px solid #cccccc;
	border-collapse: collapse;
	text-align: center;
}

#test div {
	clear: both;
	border: 1px solid #cccccc;
	text-align: center;
}

.admintop {
	clear: both;
	width: 1500px;
	height: 100px;
	text-align: center;
	border: 3px solid #ccc;
}
</style>

<body>


	
<%@ include file = "../include/header.jsp" %>



	<div class="mainbody">

		<div style="float: left; width: 300px; height: 800px"
			class="adminLeft">

			<%@ include file="leftMenu.jsp"%>

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
		
		
	



		<p></p>



		<form name="frm" method="post" action="cateSave.jsp">

			<button type="submit">버튼</button>

		</form>

	</div>

	</div>
</body>
</html>