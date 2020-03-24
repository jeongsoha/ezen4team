<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- db연결 -->
  <%@include file="../include/header.jsp" %>
<%@ include file="../include/dbcon2.jsp"%>
<!-- pjijum DB 가져오기  -->
<%

<<<<<<< Updated upstream
String aa = request.getParameter("aa");
String bb = request.getParameter("bb");
String cc = request.getParameter("cc");
String dd = request.getParameter("dd");

if (aa == null) {  // 첫 진입 null 이면 에러(수정)
	aa = "1";
}

=======
 String aa = (String) request.getParameter("aa");


String jicom = "Where jirecomend='Y'"; 
String ji1 = "Where jiabli1='Y'";
String ji2 = "Where jiabli2='Y'";
String ji3 = "Where jiabli3='Y'";
>>>>>>> Stashed changes


	String sql = " SELECT jiname, jiaddr,"
			   + " jitel, jiabil1, jiabil2,jiabil3, " 
	           + " jirecomend,jistate, "
			   + " jistar"
<<<<<<< Updated upstream
			   + " FROM pjijum  ";


	ResultSet rs = stmt.executeQuery(sql);
=======
			   + " FROM pjijum ";

if (aa == "1") {
	
	sql += sql + jicom; 
}
	
	
	
ResultSet rs = stmt.executeQuery(sql);
%>
>>>>>>> Stashed changes

	%>




<table>

	<tr style="border-bottom:1px solid;">

		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>능력1</th>
		<th>능력2</th>
		<th>능력3</th>
		<th>코멘트</th>
		<th>영업상태</th>
		<th>평점</th>

	</tr>

<%
while(rs.next()){
	
String name =rs.getString("jiname");
String addr =rs.getString("jiaddr");
String tel =rs.getString("jitel");
String abil1 =rs.getString("jiabil1");
String abil2 =rs.getString("jiabil2");
String abil3 =rs.getString("jiabil3");
String comend =rs.getString("jirecomend");
String state =rs.getString("jistate");
String star =rs.getString("jistar");
if("Y".equals(comend) && "Y".equals(abil1) &&"Y".equals(abil2)  && "Y".equals(abil3)){
	
	
			
%>

<tr style="border-bottom:1px solid; text-align:center; word-spacing:3px;">

<td><%=name %></td>
<td><%=addr %></td>
<td><%=tel %></td>
<td><%=abil1 %></td>
<td><%=abil2 %></td>
<td><%=abil3 %></td>
<td><%=comend %></td>
<td><%=state %></td>
<td><%=star %></td>

</tr>
<%
}		
}
	
%>


</table>
<%@include file="../include/footer.jsp" %>
