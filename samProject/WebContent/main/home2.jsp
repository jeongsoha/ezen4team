
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
* {margin:0;padding:0;border:0;}
.tab_content {position:absolute;top:20%;left:50%;transform:translate(-50%,-50%);font-size:12px;} /* 화면의 상단 가운데 정렬 */

input[type="radio"] {display:none;} /* input을 안보이게 처리 */
input[type="radio"] + label {display:inline-block;padding:20px;background:#ccc;color:#999;font-size:14px;cursor:pointer;} /* label에 대한 버튼속성 */
input[type="radio"]:checked + label {background:#d42930;color:#f5f5f5;}

.conbox {width:500px;height:200px;background:#d42930;color:#f5f5f5;margin:0 auto;display:none;} /* 컨텐츠 영역 */
input[id="tab01"]:checked ~ .con1 {display:block;} /* 인풋에 체크가 해당 요소보이게 설정 */
input[id="tab02"]:checked ~ .con2 {display:block;}
input[id="tab03"]:checked ~ .con3 {display:block;}
input[id="tab04"]:checked ~ .con4 {display:block;}
</style>



<script>
</script>


<body style="width:1920px;"> 
<%-- <%@ include file = "../include/header.jsp" %> --%>
  
<section>

	<div class="tab_content">

	<input type="radio" name="tabmenu" id="tab01" checked>
	<label for="tab01">제품소개</label>

	<input type="radio" name="tabmenu" id="tab02">
	<label for="tab02">커뮤니티</label>

	<input type="radio" name="tabmenu" id="tab03">
	<label for="tab03">대리점</label>
	
	<input type="radio" name="tabmenu" id="tab04">
	<label for="tab04">기타</label>
	
	<div class="conbox con1">컨텐츠탭 내용01</div>
	<div class="conbox con2">컨텐츠탭 내용02</div>
	<div class="conbox con3">컨텐츠탭 내용03</div>
	<div class="conbox con4">컨텐츠탭 내용04</div>

</div>

</section>
<%--푸터 <%@ include file = "../include/footer.jsp" %> --%>	
</body>
</html>