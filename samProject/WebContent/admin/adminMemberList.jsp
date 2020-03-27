<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="..\\include\\dbcon2.jsp"%>
<%    	int unit = 5;
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
		
	    
    String sql = " select b.* from (select rownum rn, a.* from (SELECT memno, username,userid, tel, mail, "
  				+ " to_char(birth,'yyyy-mm-dd') birth, "
    			+ " gender,post,"
    			+ " addr, SUBSTR(addr, 1, 2)||'..' shortaddr, "
    			+ " inter, "
    			+ " to_char(flog,'yyyy-mm-dd hh:mi') flog, "
    			+ " state FROM pmember "
    			+ " order by memno DESC)a ) b " 
	       	    + " where rn >="+startNo+" and rn <="+endNo+"" ;  	// 페이징처리 구성
    
    
    ResultSet rs = stmt.executeQuery(sql);
    
%>


 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 
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
	var url = "memberModify.jsp?memno="+a;

	// window.open('웹주소','별칭','옵션')  // 별칭은 중요도 낮다

	window.open(url,'popup','width=1000,height=600');

}

</script>



<body style="width:1920px;"> 

<%@ include file = "../include/header.jsp" %>


	<div class="container">  

		<div style="float: left; width: 1000px; height: 150px"
			class="adminLeft">
		<%@ include file="topMenu.jsp"%>
		</div>

	<div class="adminRight">
				<!--아래는  검색창-->
	<div class="body_container">
	
		<div class="dashboard" style="float:right">  <!-- 검색보드 -->
			
			
 <form  class="form-inline" method=post action="">

  <div class="input-group mb-2 mr-sm-2">
    <div class="input-group-prepend">
      <div class="input-group-text">검색</div>
    </div>
    <input type="text"  size="30" maxlength="50"  placeholder="검색할 지점명 또는 주소를 입력">
  
  </div>
    <button type="submit" class="btn btn-primary mb-2">검색</button>
</form>
			
			</div>
			

<!-- --아래는 회원 리스트 노출--- -->

<table class="table">
  <thead class="thead-dark">
			
		
				<tr>
					<th>No.</th>
					<th>Name</th>
					<th>ID</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>생년월일</th>
					<th>성별</th>
					
					<th>주소</th>
					<th>흥미</th>
					<th>가입일시</th>
					<th>상태</th>
					

				</tr>
				
				 </thead>
  <tbody style="font-size:13px">

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
					String shortaddr = rs.getString("shortaddr");
					String inter = rs.getString("inter");
					String flog = rs.getString("flog");
					String state = rs.getString("state");
			
		
				%>
				<tr>
					<td><%=memno %></td>
					<td><a href=# onclick="fn_popup(<%=memno%>)"><%=username %></td>
					<td><%=userid %></td>
					<td><%=tel %></td>
					<td><%=mail %></td>
					<td><%=birth %></td>
					<td><%=gender %></td>
					<td><%=shortaddr %></td>
					<td><%=inter %></td>
					<td><%=flog %></td>
					<td><%=state %></td>
					
					<!-- 수정화면 전환 -->

				</tr>
				<%	
	number++;
	}
	%>
		   </tbody>
</table>
	
			</div>	</div>	
					
 <div Style="width:100px; margin: 0 auto" > <!--  페이지 버튼 가운데 정렬을 위한 div -->
	
  <ul class="pagination pagination-sm">
				 
     <% for(int i=1 ; i<=totalPage ; i++) {
    	 %>	 
     <li class="page-item"> <a class="page-link" href="adminMemberList.jsp?viewPage=<%=i%>"><%=i %></a></li>
     <% }%>
    </ul>

</div>     

<div Style=height:30px;></div><!--   본문 body 와 간격 30px 띄우기 -->
		


	</div>     
<div Style=clear:both;height:30px;></div><!--   본문 body 와 간격 30px 띄우기 -->
		

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>