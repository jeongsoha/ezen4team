<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="..\\include\\dbcon2.jsp"%>

 <%    /* 
	아직 미구성 */
    
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
<title>회원 정보 수정</title>
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

	<section>

		<div class="admintop">어드민 최상단</div>

	</section>


	<div class="mainbody">

		<div style="float: left; width: 300px; height: 800px"
			class="adminLeft">

			<%@ include file="leftMenu.jsp"%>

		</div>

	<div class="dashboard">대시보드 상단 (회원정보 수정화면 입니다.)</div>


		<div class="adminRight">
			<!-- 카테목록 -->
			
			<p> - 현재 정보 - </p>
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
				
				</tr> 

	
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
				</tr>
	
			</table>
			
			<div class="adminRight">
			<!-- 카테목록 -->
			
			<p> - 수정 정보입력 - </p>
			
		  <form name="frm" method="post" action="memberModifySave.jsp">
		  
		  	<input type="hidden" name="memno" value="<%=memno %>">
			
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
				
				</tr> 
	
				<tr>
					<td><%=memno %></td>
					<td ><input type="text" style="width:50px" name="username" value="<%=username %>"></td>
					<td><input type="text" style="width:50px" name="userid"  value="<%=userid %>"></td>
					<td><input type="text" style="width:50px" name="tel" value="<%=tel %>"></td>
					<td><input type="text" style="width:50px" name="mail" value="<%=mail %>"></td>
					<td><input type="text" style="width:50px" name="birth" value="<%=birth %>"></td>
					<td><input type="text" style="width:50px" name="gender" value="<%=gender %>"></td>
					<td><input type="text" style="width:50px" name="post" value="<%=post %>"></td>
					<td><input type="text" style="width:50px" name="addr" value="<%=addr %>"></td>
					<td><input type="text" style="width:50px" name="inter" value="<%=inter %>"></td>
					<td><%=flog %></td>
					<td><input type="text" style="width:50px" name="state" value="<%=state %>"></td>
				</tr>
	
			</table>

		</div>
		<p></p>
		<p></p>


	
			<button type="submit">수정하기</button>
			<button type="button" onclick="history.go(-1)">수정취소</button>

		</form>

	</div>

	</div>
</body>
</html>