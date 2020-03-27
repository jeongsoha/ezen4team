<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="..\\include\\dbcon2.jsp"%>

 <%    
    
    String memno = request.getParameter("memno");
 	// String memno = "12";
    
    String sql = " SELECT username,userid, tel, mail, "
  				+ " to_char(birth,'yyyy-mm-dd') birth, "
    			+ " gender, case when gender='M' then '남자' when gender='F' then '여자' else '기타' end hangender,  "
    			+ " post,addr,inter, decode(inter,'1','자전거','2','킥보드','0','미선택') haninter,"
    			+ " to_char(flog,'yyyy-mm-dd hh:mi') flog, "
    			+ " state, decode(state,'1','정회원','2','관리자','3','탈퇴','기타') hanstate " 
    			+ " FROM pmember Where memno='"+memno+"' ";
    			
        
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    
   	String username = rs.getString("username");
	String userid = rs.getString("userid");
	String tel = rs.getString("tel");
	String mail = rs.getString("mail");
	String birth = rs.getString("birth");
	String gender = rs.getString("gender").trim();
	String post = rs.getString("post");
	String addr = rs.getString("addr");
	String inter = rs.getString("inter");
	String flog = rs.getString("flog");
	String state = rs.getString("state");
	String hangender = rs.getString("hangender");
	String haninter = rs.getString("haninter");
	String hanstate = rs.getString("hanstate");
	
    
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=devide-width" , initial-scale="1">
<title>회원 관리</title>
</head>

<link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
<!-- // 아직없다 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">   <!--  이건 크게 중요하지 않아서 파일생성치 않음 -->
  <script src="../js/jquery-1.12.4.js"></script>
  <script src="../js/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>
  
<style>

.dashboard {
	width: 900px;
	height: 1000px;
	border: 1px solid #ccc;
	float: left;
}



</style>

<body>

		<div class="dashboard">
			<!-- 상세정보 내용 -->
			
			<h3> - 회원 상세정보 - </h3>
			  <form name="frm" method="post" action="memberModifySave.jsp">
			  	<input type="hidden" name="memno" value="<%=memno %>">
			  	
			<table class="table" >
  <thead class="thead-light">
					<tr>
						<th scope="col">항목</th>
						<th width=40%>현재 정보</th>
						<th width=40%>수정사항 입력</th>
					</tr>
					<tr>
						<th>회원번호</th>
						<td><%=memno %></td>
						<td><%=memno %></td>
					</tr>
					<tr>
						<th>유저이름</th>
						<td><%=username %></td>
						<td><input type="text" style="width: 150px" name="username"
							value="<%=username %>"></td>
					</tr>
					<tr>
						<th>ID</th>
						<td><%=userid %></td>
						<td><input type="text" style="width: 150px" name="userid"
							value="<%=userid %>"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=tel %></td>
						<td><input type="text" style="width: 150px" name="tel"
							value="<%=tel %>"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=mail %></td>
						<td><input type="text" style="width: 150px" name="mail"
							value="<%=mail %>"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><%=birth %></td>
						<td><input type="text" style="width: 150px" name="birth" id="birth"
							value="<%=birth %>"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><%=hangender %></td>
						<td> <select style="width:150px;height:25px;"  name="gender" > 
                  <option value="M" <% if(gender.equals("M")){out.print("selected");}%>>&nbsp; 남자 </option>
                  <option value="F" <% if(gender.equals("F")){out.print("selected");}%>>&nbsp; 여자 </option>
                  </select></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><%=post %></td>
						<td><input type="text" style="width: 150px" name="post"
							value="<%=post %>"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=addr %></td>
						<td><input type="text" style="width: 350px" name="addr"
							value="<%=addr %>"></td>
					</tr>
					<tr>
						<th>흥미</th>
						<td><%=haninter %></td>
						  <td class="mtd">
                  <select style="width:150px;height:25px;" name="inter" > 
                  <option value="0" <% if(inter.equals("0")){out.print("selected");}%>>&nbsp; 미선택  </option>  <!-- 참고기능  selected -->
                  <option value="1" <% if(inter.equals("1")){out.print("selected");}%>>&nbsp; 자전거  </option>
                  <option value="2" <% if(inter.equals("2")){out.print("selected");}%>>&nbsp; 킥보드  </option>
                  </select>
                  </td>
					</tr>
					<tr>
						<th>가입일시</th>
						<td><%=flog %></td>
						<td><%=flog %></td>
					</tr>
					<tr>
						<th>회원상태</th>
						<td><%=hanstate %></td>
						<td><select style="width:150px;height:25px;" name="state" > 
                  <option value="1" <% if(state.equals("1")){out.print("selected");}%>>&nbsp; 정회원  </option>  <!-- 참고기능  selected -->
                  <option value="2" <% if(state.equals("2")){out.print("selected");}%>>&nbsp; 관리자  </option>
                  <option value="3" <% if(state.equals("3")){out.print("selected");}%>>&nbsp; 탈퇴회원  </option>
                  </select></td>
					</tr></table>
			
		
		<p align="center">
	
			<button type="submit">수정하기</button>
			<button type="button" onclick="window.close();">창닫기(수정취소)</button>
	</p>
		</form>

	</div>

	
</body>
</html>