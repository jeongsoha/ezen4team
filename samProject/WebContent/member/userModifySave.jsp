<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/dbcon2.jsp" %>


	<%  
	
	// String userId = (String) session.getAttribute("sessionUserid");  세션 어드민 여부 확인 구성 필요*/
	
	String userid = request.getParameter("userid").trim();
	String username = request.getParameter("username").trim();
	String tel = request.getParameter("tel");
	String mail = request.getParameter("mail").trim();

	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender"); 
	String addr = request.getParameter("addr");
	String post = request.getParameter("post");
	String inter = request.getParameter("inter").trim();
	String state = request.getParameter("state").trim();
			
	String sql = "UPDATE pmember SET";
	       
	 		sql +=" tel='"+tel+"', ";
	 		sql +=" mail='"+mail+"', ";
	 		sql +=" birth='"+birth+"', ";
	 		sql +=" gender='"+gender+"', ";
	 		sql +=" addr='"+addr+"', ";
	 		sql +=" post='"+post+"', ";
	 		sql +=" inter='"+inter+"', ";
	 		sql +=" state='"+state+"' ";
	 		sql +=" WHERE userid='"+userid+"' ";
		   
		 
	int rs = stmt.executeUpdate(sql);
	
	if(rs >0) {
	%>
		<script>
		alert("정보변경 완료");
	
				
	location="../member/userModify.jsp"
			</script>
		
<%
} else {
%>
		<script>
		alert("정보변경 실패");
		history.back();
		</script>

<%
}
%>