<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon2.jsp" %>

<%
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");

/* 데이터 유효성체크 */
//sql 작성
String sql = "SELECT count(*) cnt FROM pmember WHERE userid='"+userid+"' and pwd='"+pwd+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");  // 숫자 1 -> 정상 입력  

if (cnt == 0) {
	%>
	<script>
alert("회원정보가 일치하지 않습니다.");	
	history.go(-1);
	</script>
	<%
	return; //jsp end
	}
	
	 sql = " select count(*) cnt from pmember "
		  + " where userid='"+userid+"' and pwd='"+pwd+"' and state='2'"; // 1= 일반 / 어드민 2 / 3 탈퇴
		  
	ResultSet rs1 = stmt.executeQuery(sql);
	rs1.next();
	cnt = rs1.getInt("cnt");



session.setAttribute("sessionUserid",userid);   // 세션 생성 변수이름, 변수 값(로그인 아이디)

if(cnt > 0) {
session.setAttribute("adminConfirm","Y"); // 세션생성 // 어드민
}

session.setMaxInactiveInterval(60*60); // 지속시간설정 초*분 = 1시간 설정 예

%>


<script>
// jsp 변수는 쌍따옴표 안에 써야해
alert("<%=userid%> 님 로그인 되었습니다.");
location = "../main/home.jsp";
</script>

