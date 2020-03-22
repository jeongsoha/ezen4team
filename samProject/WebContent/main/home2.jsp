<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인|삼천리자전거</title>
</head>

<!-- <link rel="stylesheet" type="text/css" href="../css/adminlayout.css">
<link rel="stylesheet" href="../css/home2.css">
 -->
<style>

input[type="radio"] {display:none;}
input[type="radio"] + label {display:inline-block;padding:20px;background:#ccc;color:#999;font-size:14px;cursor:pointer;}
input[type="radio"]: checked + label {background:#aaa;color:#000;}

.conbox {width:500px;height:600px;background:#aaa;margin:0 auto;display:none;}

input[id="tab01"]:checked ~ .con1 {display:block;}
input[id="tab02"]:checked ~ .con2 {display:block;}
input[id="tab03"]:checked ~ .con3 {display:block;} 


</style>


<script>
</script>


<body style="width:1920px;"> 
<%-- <%@ include file = "../include/header.jsp" %> --%>
  
<section>

	<div class="tab_content">
	<input type="radio" name="tabmenu" id="tab01" checked>
	<label for="tab01">제품소개</label>
	<input type="radio" name="tabmenu" id="tab02" >
	<label for="tab02">커뮤니티</label>
	<input type="radio" name="tabmenu" id="tab03" >
	<label for="tab03">대리점</label>
	<input type="radio" name="tabmenu" id="tab04" >
	<label for="tab04">기타</label>
	</div>
	
	<div calss="conbox con1">컨텐츠 내용01</div>
	<div calss="conbox con1">컨텐츠 내용02</div>
	<div calss="conbox con1">컨텐츠 내용03</div>
	
	
	로그인 회원가입
  


<div class="table100" >
배너 도는 공간 
</div>


<div class="table100" >
내용 도는 공간
</div>


</div>

</section>
<%--푸터 <%@ include file = "../include/footer.jsp" %> --%>	
</body>
</html>