<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp"%>
<%/*
int unit =5;
String pageNo = request.getParameter("pageNo");
if(pageNo==null){
	pageNo="1";
}
String sqlcnt="select count(*) cnt from pjijum";
ResultSet rscnt = stmt.executeQuery(sqlcnt);
rscnt.next();
int cnt = rscnt.getInt("cnt");
int totalpage = (int)(Math.ceil((double)cnt/unit));
int startNo = (Integer.parseInt(pageNo)-1) * unit;
int count = cnt-startNo;

String sql = " SELECT jiname, jiaddr,"
           + " jitel, jiabil1, jiabil2,jiabil3, "
           + " jirecomend,jistate, "
           + " jistar, addrji"
           + " FROM pjijum  "
           + " limit "+startNo+","+unit;
ResultSet rs =stmt.executeQuery(sql);
*/%>




<%
	String tab = (String) request.getParameter("tab");
	if (tab == null) {
		tab = "";
	}
	String jicom = "Where jirecomend='Y'";
	String ji1 = "Where jiabil1='Y'";
	String ji2 = "Where jiabil2='Y'";
	String ji3 = "Where jiabil3='Y'";
%>


<%
	String sql = " SELECT jiname, jiaddr,"
                          + " jitel, jiabil1, jiabil2,jiabil3, " + " jirecomend,jistate, "
			+ " jistar, addrji" + " FROM pjijum  ";

	if (tab.equals("a")) {
		sql += " Where jirecomend='Y'";
	} else if (tab.equals("b")) {
		sql += " Where jiabil1='Y'";
	} else if (tab.equals("c")) {
		sql += " Where jiabil2='Y'";
	} else if (tab.equals("d")) {
		sql += " Where jiabil3='Y'";

	}

	ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>홈대리점</title>

</head>



<body>

	<%@include file="../include/header.jsp"%>


	<div class="tabmenu">

		<ul>
			<li id="tab1" class="btnCon"><a class="btn "
				href="jijum4.jsp?tab=a" style=height:100px>프리미엄 스토어</a>
				<div class="tabCon"></div>
			<li id="tab2" class="btnCon"><a class="btn"
				href="jijum4.jsp?tab=b">전기자전거 서비스지정점</a>
				<div class="tabCon"></div></li>

			<li id="tab3" class="btnCon"><a class="btn"
				href="jijum4.jsp?tab=c">서비스지정점</a>
				<div class="tabCon"></div></li>

			<li id="tab4" class="btnCon"><a class="btn"
				href="jijum4.jsp?tab=d">전기자전거취급점</a>
				<div class="tabCon"></div></li>
		</ul>

		<table width="300;">

			

			<%
				while (rs.next()) {

					String name = rs.getString("jiname");
					String addr = rs.getString("jiaddr");
					String tel = rs.getString("jitel");
					String abil1 = rs.getString("jiabil1");
					String abil2 = rs.getString("jiabil2");
					String abil3 = rs.getString("jiabil3");
					String comend = rs.getString("jirecomend");
					String state = rs.getString("jistate");
					String star = rs.getString("jistar");
					String addrji = rs.getString("addrji");
			%>



			<tr style="border-top: 2px solid red; text-align: center; ">

				<td>
				<a href="?tab=<%=tab%>&addrji=<%=addrji%>"> <h2><%=name%></h2></a></td>
	        			<tr><td><h5><%=addr%></h5></td></tr>
				<td ><h5><%=tel%></h5></td>
				<tr></tr>
				<td style="border-bottom: 2px solid red;"> 고객만족점수:<%=star%></td>

			</tr>

			<%
				}
			%>
			<%@include file="api.jsp"%>
		
		</table>
		
			
			
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="../include/footer.jsp"%>

</body>
</html>