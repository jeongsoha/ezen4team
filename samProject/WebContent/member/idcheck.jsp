<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/dbcon2.jsp" %>

<%
	String userid = request.getParameter("userid");
	if(userid==null){
%>
	<script>
		alert("잘못된 접근");
		self.close(); //popup에서만 사용가능한 메소드
	</script>
<%		
		return;
	}
%>
<%
	String sql ="select count(*) cnt from pmember where userid='"+userid+"'";

	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	int cnt =  rs.getInt("cnt");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 중복체크</title>
</head>

<style>
	.div1{
		width:95%;
		height:95%;
		font-size:16px;
		color:#777777;
		font-weight:bold;
		font-family:맑은고딕;
		margine:5px;
		border:1px solid skyblue;
		text-align:center;
		vertical-align:middle;
		line-height:60px;
	}
</style>

<body>

<div class="div1">
	<%
		if(cnt==0){
	%>
			사용할 수 있는 아이디입니다.
	<%
		}else if(cnt!=0){
	%>
			사용할 수 없는 아이디입니다.
	<%
		}
	%>
	<br>
	<input type="button" value="닫기" onclick="self.close();">
</div>



</body>
</html>




