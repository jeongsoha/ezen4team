
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
     <%@page import="java.sql.ResultSet"%>
     <%@page import="java.util.Date"%>

 <!--  db 서버 연결을 위한 인클루드용 파일 -->
 
 <% 
	String id = "root";
	String pass = "apmsetup";
	String url = "jdbc:mysql://localhost:3306/apple1?useUnicode=true&characterEncoding=utf8";
	// 3306 - mysql 고유 포트번호?옵션(옵션은 선택사항), utf 8 안하면 한글이 깨지기도 함.
	// 접속 드라이버를 통해 연결
	Class.forName("com.mysql.jdbc.Driver");
	// DB 접속정보, 로그인 정보 (java.sql 로 임포트 2가지.)
	Connection conn = DriverManager.getConnection(url, id, pass);
	// 위치정보, id, 패스워드
	///////////////////// 아래 시작
	// (java.sql 로 임포트)
	Statement stmt = conn.createStatement();  
	
	Statement stmt2 = conn.createStatement();  
	
	Statement stmt3 = conn.createStatement();  
 
 %>
 
 <!--  한글깨짐 방지 -->
 <% request.setCharacterEncoding("utf-8"); %>