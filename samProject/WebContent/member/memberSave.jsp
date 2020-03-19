<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
    
    <%@ include file="../include/dbcon2.jsp" %>
    
        
    <%  // 회원가입 시 저장처리
    String userid = request.getParameter("userid");
    String pwd = request.getParameter("pwd");
    String username = request.getParameter("username");
    String bir_year  = request.getParameter("bir_year");
    String bir_month = request.getParameter("bir_month");
    String bir_day = request.getParameter("bir_day");
    String gender = request.getParameter("gender");
    String mail = request.getParameter("mail");
    String tel = request.getParameter("tel");
    String post = request.getParameter("post");
    String addr = request.getParameter("addr");
    String inter = request.getParameter("inter");
    String birth = bir_year+"-"+bir_month+"-"+bir_day;
    
        
    String sql = "";
    
    sql = "insert into pmember(memno,username,userid,pwd,tel,mail,birth,gender,post,addr,inter,flog,state) "; 
 	sql += " values(mem_seq.nextval,'"+username+"','"+userid+"','"+pwd+"','"+tel+"','"+mail+"','"+birth+"','"+gender+"','"+post+"','"+addr+"','"+inter+"',sysdate,'1')";
    

    stmt.executeUpdate(sql);
    
    %>
    
 
    <script>
    
    alert ("환영합니다. 회원가입 완료!");
    
    location = "home.jsp";
    </script>