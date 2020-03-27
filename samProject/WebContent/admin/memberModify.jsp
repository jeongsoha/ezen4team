<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="..\\include\\dbcon2.jsp"%>

 <%    
    
    String memno = request.getParameter("memno");
 	// String memno = "12";
    
    String sql = " SELECT username,userid, tel, mail, "
  				+ " to_char(birth,'yyyy-mm-dd') birth, "
    			+ " gender,post,addr,inter, "
    			+ " to_char(flog,'yyyy-mm-dd hh:mi') flog, "
    			+ " state FROM pmember Where memno='"+memno+"' ";
    			
        
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=devide-width" , initial-scale="1">
<title>회원 관리</title>
</head>

<link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
<!-- // 아직없다 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<style>

.dashboard {
	width: 900px;
	height: 1000px;
	border: 1px solid #ccc;
	float: left;
}



</style>

<body>

		<div class="dashboard">
			<!-- 상세정보 내용 -->
			
			<h3> - 회원 상세정보 - </h3>
			  <form name="frm" method="post" action="memberModifySave.jsp">
			  	<input type="hidden" name="memno" value="<%=memno %>">
			  	
			<table class="table" >
  <thead class="thead-light">
				<tr>
				    <th scope="col"> 항목</th><th width=40%>현재 정보</th><th width=40%>수정사항 입력</th></tr> <tr>
					<th >회원번호</th><td><%=memno %></td><td><%=memno %></td></tr> <tr>
					<th >유저이름</th>	<td><%=username %></td><td ><input type="text" style="width:150px" name="username" value="<%=username %>"></td></tr> <tr>
					<th >ID</th><td><%=userid %></td><td><input type="text"  style="width:150px" name="userid"  value="<%=userid %>"></td></tr> <tr>
					<th >전화번호</th><td><%=tel %></td><td><input type="text" style="width:150px" name="tel" value="<%=tel %>"></td></tr> <tr>
					<th >이메일</th><td><%=mail %></td><td><input type="text" style="width:150px" name="mail" value="<%=mail %>"></td></tr> <tr>
					<th >생년월일</th><td><%=birth %></td><td><input type="text" style="width:150px" name="birth" value="<%=birth %>"></td></tr> <tr>
					<th >성별</th><td><%=gender %></td><td><input type="text" style="width:150px" name="gender" value="<%=gender %>"></td></tr> <tr>
					<th >우편번호</th><td><%=post %></td><td><input type="text" style="width:150px" name="post" value="<%=post %>"></td></tr> <tr>
					<th >주소</th><td><%=addr %></td><td><input type="text" style="width:350px" name="addr" value="<%=addr %>"></td></tr> <tr>
					<th >흥미</th><td><%=inter %></td><td><input type="text" style="width:150px" name="inter" value="<%=inter %>"></td></tr> <tr>
					<th >가입일시</th><td><%=flog %></td><td><%=flog %></td></tr> <tr>
					<th >회원상태</th><td><%=state %></td><td><input type="text" style="width:150px" name="state" value="<%=state %>"></td></tr> 
			</table>
			
		
		<p align="center">
	
			<button type="submit">수정하기</button>
			<button type="button" onclick="window.close();">창닫기(수정취소)</button>
	</p>
		</form>

	</div>

	
</body>
</html>