<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
     <%@ include file="..\include\dbcon2.jsp" %>
    
    <%    
    
    String sql = " SELECT memno, username,userid, tel, mail, "
  				+ " to_char(birth,'yyyy-mm-dd') birth, "
    			+ " gender,post,addr,inter, "
    			+ " to_char(flog,'yyyy-mm-dd hh:mi') flog, "
    			+ " state FROM pmember "
    			+ " order by memno DESC " ;
    
    
    
    ResultSet rs = stmt.executeQuery(sql);
    
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>

   <link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
   
<style>

	.memberlist {
	width:1000px; 
	border: 1px solid #cccccc; 
	border-collapse: collapse;
	text-align: center;
	}
</style>

<body>
	<div class="container">
		<div class="adminLeft">
		
		<%@ include file="leftMenu.jsp" %>
			
		</div>
		
		<a></a>

		<div class="adminRight">
			<!-- 카테목록 -->
			<table class="memberlist" >
				<tr>
					<th>회원번호</th>
					<th>유저이름</th>
					<th>ID</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>흥미</th>
					<th>가입일시</th>
					<th>회원상태</th>
					<th>회원정보</th>
					
				</tr> 

				<%
				int number=1;
				while(rs.next() ) {
					
					String memno = rs.getString("memno");
					String username = rs.getString("username");
					String userid = rs.getString("userid");
					String tel = rs.getString("tel");
					String mail = rs.getString("mail");
					String birth = rs.getString("birth");
					String gender = rs.getString("gender");
					String post = rs.getString("post");
					String addr = rs.getString("addr");
					String inter = rs.getString("inter");
					String flog = rs.getString("flog");
					String state = rs.getString("state");
			
		
				%>
				<tr>
					<td><%=memno %></td>
					<td><%=username %></td>
					<td><%=userid %></td>
					<td><%=tel %></td>
					<td><%=mail %></td>
					<td><%=birth %></td>
					<td><%=gender %></td>
					<td><%=post %></td>
					<td><%=addr %></td>
					<td><%=inter %></td>
					<td><%=flog %></td>
					<td><%=state %></td>
					<td><a href="memberModify.jsp?memno=<%=memno%>">수정</a></td>  <!-- 수정화면 전환 -->
				
				</tr>
	<%	
	number++;
	}
	%>
			</table>

		
			
	<form name="frm" method="post" action="cateSave.jsp">
			
			<button type="submit">버튼</button>
			
			</form>
			
		</div>
		
	</div>
</body>
</html>