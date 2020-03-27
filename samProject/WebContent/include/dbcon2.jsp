
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
     <%@page import="java.sql.ResultSet"%>
     <%@page import="java.util.Date"%>
          <%@page import="java.net.URLDecoder"%>
           <%@page import="java.net.URLEncoder"%>

 <!--  db 서버 연결을 위한 인클루드용 파일 -->
 
 <% 
	String id = "scott";
	String pass = "1234";  //1521  오라클 전용 포트번호 / orcl - apple 아님
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";    //localhost 에 ip 입력하면 함께활용 됨
 // cmd - ipconfig  :  ipv4 주소가 해당 pc의 ip 이다.  // 리눅스 서버를 하면.. 학습에 도움됨..


	//드라이버 인식 클래스 
	Class.forName("oracle.jdbc.driver.OracleDriver");
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