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
    			+ " gender,post,addr,inter, "
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
			<!-- 카테목록 -->

			<div class="dashboard">대시보드 상단 (검색기능)</div>

			<table class="memberlist">
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
					<th>회원정보</th>

				</tr>

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
					String inter = rs.getString("inter");
					String flog = rs.getString("flog");
					String state = rs.getString("state");
			
		
				%>
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
					<td><button type="button" onclick="fn_popup(<%=memno%>)">수정</a></td>
					<!-- 수정화면 전환 -->

				</tr>
				<%	
	number++;
	}
	%>
			</table>

	 <p align = "center">

     <% for(int i=1 ; i<=totalPage ; i++) {

    	 %>	 

     <a href="adminMemberList.jsp?viewPage=<%=i%>"><%=i %></a>

     <% }%>

     </p>    

		</div>
	


		<form name="frm" method="post" action="cateSave.jsp">

		
		</form>


	</div>

<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>