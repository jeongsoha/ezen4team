<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- db연결 -->
<%@ include file="../include/dbcon2.jsp"%>
<!-- pjijum DB 가져오기  -->
<%

String jiname = request.getParameter("jiname");
String jiaddr = request.getParameter("jiaddr");
String jitel = request.getParameter("jitel");
String joabil1 = request.getParameter("joabil1");
String joabil2 = request.getParameter("joabil2");
String joabil3 = request.getParameter("joabil3");
String jirecomend = request.getParameter("jirecomend");
String jistate = request.getParameter("jistate");
String jistar = request.getParameter("jistar");

ResultSet rs =stmt.executeQuery(sql);



String sql =" select from pjijum";


%>