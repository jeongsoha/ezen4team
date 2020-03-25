<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/dbcon2.jsp"%>
  <%
   String tab = (String) request.getParameter("tab");
if(tab==null){
	tab="";
} 
  String jicom = "Where jirecomend='Y'"; 
  String ji1 = "Where jiabil1='Y'";
  String ji2 = "Where jiabil2='Y'";
  String ji3 = "Where jiabil3='Y'";
  
  
  
  %>
  
  
    <%
    String sql = " SELECT jiname, jiaddr,"
			   + " jitel, jiabil1, jiabil2,jiabil3, " 
	           + " jirecomend,jistate, "
			   + " jistar"
			   + " FROM pjijum  ";

    if(tab.equals("a")){
    	sql += " Where jirecomend='Y'";
    }else if(tab.equals("b")){
    	sql +=" Where jiabil1='Y'";
   }else if(tab.equals("c")){
	   sql +=" Where jiabil2='Y'";	   
   }else if(tab.equals("d")){
	   sql +=" Where jiabil3='Y'";
	   
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

  <%@include file="../include/header.jsp" %>


<div class="checks">
								<p>
									<input type="checkbox" name="cello" value="0" id="sto4" onclick="search(4);"/><label for="sto4">프리미엄 스토어</label>
									<em>* 프리미엄 스토어란?</em>
									<span class="sto4_box">프리미엄 스토어는 다양한 제품과 우수한 정비 서비스를 제공하는 선별된 대리점입니다.</span>
								</p>
								<p><input type="checkbox" name="cat" value="0" id="sto1" onclick="search(1);"/><label for="sto1">전기자전거 서비스지정점</label></p>
								<p><input type="checkbox" name="kind" value="0" id="sto2" onclick="search(2);"/><label for="sto2">서비스지정점</label></p>
								<p><input type="checkbox" name="elect" value="0" id="sto3" onclick="search(3);"/><label for="sto3">전기자전거 취급점</label></p>
							</div>
  
  

      
    </li>
</ul>

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

	
%>


</table>

<a href="https://map.kakao.com/?urlX=481045&urlY=1131343&urlLevel=3&map_type=TYPE_MAP&map_hybrid=false" target="_blank"><img width="504" height="310" src="https://map2.daum.net/map/mapservice?FORMAT=PNG&SCALE=2.5&MX=481045&MY=1131343&S=0&IW=504&IH=310&LANG=0&COORDSTM=WCONGNAMUL&logo=kakao_logo" style="border:1px solid #ccc"></a><div class="hide" style="overflow:hidden;padding:7px 11px;border:1px solid #dfdfdf;border-color:rgba(0,0,0,.1);border-radius:0 0 2px 2px;background-color:#f9f9f9;width:482px;"><strong style="float: left;"><img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵"></strong><div style="float: right;position:relative"><a style="font-size:12px;text-decoration:none;float:left;height:15px;padding-top:1px;line-height:15px;color:#000" target="_blank" href="https://map.kakao.com/?urlX=481045&urlY=1131343&urlLevel=3&map_type=TYPE_MAP&map_hybrid=false">지도 크게 보기</a></div></div>


</form>
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

<%@include file="../include/footer.jsp" %>
   
</body>
</html>