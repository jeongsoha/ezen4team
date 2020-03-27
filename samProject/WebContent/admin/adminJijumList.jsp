<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="..\\include\\dbcon2.jsp"%>


<%    

	 String search = request.getParameter("search1");
	
if (search == null ) {
	search = "";
} 	
     String encodedString = URLEncoder.encode(search, "UTF-8");


 
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
    			+ " jistar, jicode||jiname||jiaddr||jitel search   "
    			+ " FROM pjijum "
    		+ " where jicode||jiname||jiaddr||jitel like '%"+search+"%' " // where search like '% 서치내용 %'
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
.body_container{
   width: 1000px;   /* 헤더 중앙에 위치할 px width 값*/
   margin: 0px auto;  /*중앙정렬*/
     
}
</style>


<script>
function fn_popup(num) {
	
	var a = num;
	
	alert("hi  지점수정 페이지 이동 전" + a);
}
 function fn_search() {
	
	var f = document.frm_search;
	var x = document.getElementById("search1").value;  
	
	var addr ="adminJijumList.jsp?search1="+x;
	
	var ds = encodeURI(addr);
	
	f.action = ds
	f.submit();
}
</script>



<body style="width:1920px;"> 

<div style=clear:both>
<%@ include file = "../include/header.jsp" %>

</div>

	<div class="container" style=clear:both>  

		<div style="width: 1000px; height: 150px">
		<%@ include file="topMenu.jsp"%>
		</div>

 
		<div style="clear:both">
			<!--아래는  검색창-->

		<div class="body_container">
			
		
				
 <form Style="float:right"  class="form-inline" name="frm_search" method=post action="">
 
  <div class="input-group mb-2 mr-sm-2">
    <div class="input-group-prepend">
      <div class="input-group-text">검색</div>
  
    <input type="text" size="30" maxlength="50" name=search1 id=search1 placeholder="검색할 지점명 또는 주소를 입력" value=<%=search %>>
   
    
 </div> </div> <button type="submit" class="btn btn-primary mb-2" onclick="fn_search()" >찾기</button>
</form>
			
<div Style="font-size:12px; text"> <br>* 능력 1 : 전기자전거 서비스지정점 |
 능력 2 :일반 서비스지정점 |
 능력 3 :전기자전거 취급점 
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
					<th>상태</th>
					<th>평점</th>
					 
				</tr>
				 </thead>
				<tbody style="font-size:13px">
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
			</div>	</div>	
					
 <div Style="width:100px; margin: 0 auto" > <!--  페이지 버튼 가운데 정렬을 위한 div -->
	
  <ul class="pagination pagination-sm">
				 
     <% for(int i=1 ; i<=totalPage ; i++) {
    	 %>	 
     <li class="page-item"> <a class="page-link" href="adminJijumList.jsp?viewPage=<%=i%>&search1=<%=encodedString%>"><%=i %>
 
     
     </a></li>
     <% }%>
    </ul>

</div>     
     
<div Style=clear:both;height:30px;></div><!--   본문 body 와 간격 30px 띄우기 -->
		</div>


<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>