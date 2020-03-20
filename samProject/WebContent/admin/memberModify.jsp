<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
     <%@ include file="..\\include\\dbcon2.jsp" %>
    
    <%    
    
    String memno = request.getParameter("memno");
    
    
    String sql = " SELECT username,userid, tel, mail, "
  				+ " to_char(birth,'yyyy-mm-dd') birth, "
    			+ " gender,post,addr,inter, "
    			+ " to_char(flog,'yyyy-mm-dd hh:mi') flog, "
    			+ " state FROM pmember Where memno='"+memno+"' ";
    			
        
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    
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
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>

   <link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
   
<style>

	.memberlist {
	width:1000px; 
	border: 1px solid #cccccc; 
	border-collapse: collapse;
	text-align: center;
	}
</style>

<body>
	<div class="container">
		<div class="adminLeft">
		
		<%@ include file="leftMenu.jsp" %>
			
		</div>
		
		<a></a>

		<div class="adminRight">
			<!-- 카테목록 -->
			<table class="memberlist" >
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
				
				</tr> 

	
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
				</tr>
	
			</table>
			
	
<form name="frm" method="post" action="memberModifySave.jsp">
   
      <!--  표 위치를 가운데로 오도록 만듬 / 테이블 범위확인 -->
      <table style="width:450px;" align="center" border="0" bgcolor="skyblue"> 
         
               <tr>
                  <th class="mtd">아이디 <input  class="button1" type="button" value="중복확인" onclick ="fn_popup()"> </th>
               </tr>
               <tr>
                  <td class="mtd"><input class="textBox1" type="text" name="userid" value="<%=userid%>"> 
                  
                  </td>
               </tr>
               <tr>
                  <th class="mtd">비밀번호  <input  class="button1" type="button" value="비밀번호 재설정" onclick ="fn_popup()"> </th>
               </tr>
               <tr>
                  <td class="mtd"><input class="textBox1" type="password" name="pwd" placeholder=" 재설정 비밀번호"> </td>
               </tr>
               <tr>
              
               <tr>
                  <th class="mtd">이름</th>
               </tr>
               <tr>
                  <td class="mtd"><input class="textBox1" type="text" name="username" placeholder="  이름을 입력해주세요"></td>
               </tr>
               <tr>
                  <th class="mtd">생년월일</th>
               </tr>
               <tr>
                  <td class="mtd">
                  <input style="width:200px;height:40px;" type="text" name="bir_year" placeholder="  생년">
                  <input style="width:80px;height:40px;" type="text" name="bir_month" placeholder="  월">
                  <input style="width:80px;height:40px;" type="text" name="bir_day" placeholder="  일">
                  </td>
               </tr>
               <tr>
                  <th class="mtd">성별</th>
               </tr>
               <tr>
                  <td class="mtd">
                  <select style="width:200px;height:40px;"  name="gender" > 
                  <option value="0">&nbsp; 성별 선택  <!-- 참고기능  checked -->
                  <option value="M">&nbsp; 남자 <!-- 참고기능  checked -->
                  <option value="F">&nbsp; 여자 <!-- 참고기능  checked -->
                  </select>
                  </td>
               </tr>
         
                              
               <tr>
                  <th class="mtd">이메일</th>
                  </tr>
               <tr><td class="mtd"><input class="textBox1"  type="email" name="mail" id="mailcheck" placeholder="  이메일을 입력해주세요"> </td>
               </tr>

               <tr>
                  <th class="mtd">전화번호</th>
                  </tr><tr><td class="mtd"><input class="textBox1" type="text" name="tel" placeholder="  전화번호를 입력해주세요"></td>
               </tr>
               
                 <tr>
                  <th class="mtd">우편번호</th>
                  </tr><tr><td class="mtd"><input style="width:200px;height:40px;" class="textBox1" type="text" name="post" placeholder="  우편번호 "></td>
               </tr>
               
                 <tr>
                  <th class="mtd">주소</th>
                  </tr><tr><td class="mtd"><input class="textBox1" type="text" name="addr" placeholder="  주소 입력"></td>
               </tr>
               <tr>
                  <th class="mtd">관심사</th>
               </tr>                           
                    <tr>
                  <td class="mtd">
                  <select style="width:200px;height:40px;" name="inter" > 
                  <option value="0">&nbsp; -- 선 택 --   <!-- 참고기능  checked -->
                  <option value="1">&nbsp; 자전거 <!-- 참고기능  checked -->
                  <option value="2">&nbsp; 킥보드 <!-- 참고기능  checked -->
                  </select>
                  </td>
               </tr>

               <tr>
                  <th class="mtd" >
                  <input style="width:100%;height:40px;" type="submit" value="가입하기" onclick=""> 
                  
                  
                  </th>
               </tr>
            </table>
      

			
			<button type="submit">버튼</button>
			
			</form>
			
		</div>
		
	</div>
</body>
</html>