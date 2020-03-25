<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="..\\include\\dbcon2.jsp"%>

<%    
	String serch = request.getParameter("serch");
	
if (serch == null ) {
	serch = "";
}

int unit = 5;
		String viewPage = request.getParameter("viewPage");
		if (viewPage == null) {  // 첫 진입 null 이면 에러(수정)
			viewPage = "1";
		}

		String totalSql = " select count(*) total from pmember";
		ResultSet rs2 = stmt.executeQuery(totalSql);
		rs2.next();
		int total = rs2.getInt("total");

		int totalPage = (int) Math.ceil((double)total/unit);
		int startNo = (Integer.parseInt(viewPage)-1) * unit +1;  //  1 -> 1 ,  2 -> 11 , 3 -> 21
		int endNo = startNo+unit-1;
		
		
    
    String sql = " select b.* from (select rownum rn, a.* from (SELECT jino, jicode, jiname, jiaddr, jitel, "
  				+ " jiabil1,jiabil2, jiabil3,jirecomend,jistate, "
    			+ " to_char(jisdate,'yyyy-mm-dd') jisdate, "
    			+ " jistar, jicode||jiname||jiaddr||jitel serch   "
    			+ " FROM pjijum "
    			+ " order by jino DESC) a ) b " 
    		  + " where rn >="+startNo+" and rn <="+endNo+" ";  
        
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


<script>

function fn_popup(num) {
	
	var a = num;
	
	alert("hi  지점수정 페이지 이동 전" + a);
}

function fn_serch() {
	
	
	var a = document.getElementById("serch1").value 
	
	alert(a);
}

</script>



<body style="width:1920px;"> 

<div style=clear:both>
<%@ include file = "../include/header.jsp" %>

</div>

	<div class="container" style=clear:both>  

		<div style="float: left; width: 1000px; height: 150px"
			class="adminLeft">
		<%@ include file="topMenu.jsp"%>
		</div>

 
		<div class="adminRight">
			<!--아래는  검색창-->

		<div class="dashboard" style="float:right">
			
				
 <form  class="form-inline" method=post action="">
 
  <div class="input-group mb-2 mr-sm-2">
    <div class="input-group-prepend">
      <div class="input-group-text">검색</div>
    </div>
    <input type="text"  size="30" maxlength="50" name=serch1 id=serch1  placeholder="검색할 지점명 또는 주소를 입력">
  
  </div>
    <button type="submit" class="btn btn-primary mb-2" onclick="fn_serch()" >검색</button>

</form>
			
			</div>


<!-- --아래는 지점 리스트 노출--- -->

			<table class="table">
			<thead class="thead-dark">
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
					<th>추천</th>
					<th>오픈</th>
					<th>평점</th>
					 
				</tr>
				 </thead>
				<tbody>	
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
					<td><a href=# onclick="fn_popup(<%=jino %>)"><%=jicode %></td>  <!-- 코드누르면 수정창 -->
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
	%> </tbody>
			</table>

			 <p align = "center">
     <% for(int i=1 ; i<=totalPage ; i++) {
    	 %>	 
     <a href="adminJijumList.jsp?viewPage=<%=i%>"><%=i %></a>
     <% }%>

     </p>    

		</div>

	</div>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>