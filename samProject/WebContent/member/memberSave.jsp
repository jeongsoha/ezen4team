<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
    
    <%@ include file="../include/dbcon2.jsp" %>
    
        
    <%  // 회원가입 시 저장처리
    String userid = request.getParameter("userid");
    String pwd = request.getParameter("pwd");
    String username = request.getParameter("username");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    String mail = request.getParameter("mail");
    String tel = request.getParameter("tel");
    String inter = request.getParameter("inter");
   
    
        
    String sql = "";
    
    sql = "insert into pmember(memno,username,userid,pwd,tel,mail,birth,gender,inter,flog,state) "; 
 sql += " values(mem_seq.nextval,'"+username+"','"+userid+"','"+pwd+"','"+tel+"','"+mail+"','"+birth+"','"+gender+"','"+inter+"',sysdate,'1')";
    

    int rs3 = stmt.executeUpdate(sql);
   
    %>
    
 
    <script>
    
    alert (rs3 + "환영합니다. 회원가입 완료!");
    
    location = "../main/home.jsp";
    </script>
   