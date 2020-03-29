<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
       <link rel="stylesheet" href="../css/bootstrap.min.css">
      
      <style>
      
ul {
    list-style:none;
    margin:0px;
    padding:0px;
    float: left;
  
}

li {

    padding: 0 0 0 0;
    border : 0;
  	float: left;
  	
}

.font12 {   

font-size:12px; 
}
      </style>
      
      <script type="text/javascript">
      
      function fn_ready() {
    	
    	  alert("준비중입니다 :)");
    		return false;
      }
      
</script>
      
<body>
     	
	<div Style="height:50px; line-height:50px">

			<ul >
		<li><a class="btn btn-outline-danger btn-sm" href="adminBoard.jsp" role="button"> admin 홈</a></li>
			<li> &nbsp; </li>
		<li><a class="btn btn-primary btn-sm" href="adminJijumList.jsp" role="button"> 대리점 관리</a></li>
			<li> &nbsp; </li>
		<li><a class="btn btn-primary btn-sm" href="#" role="button" onclick="fn_ready()"> 상품목록 관리</a></li>
			<li> &nbsp; </li>
		<li><a class="btn btn-primary btn-sm" href="adminMemberList.jsp" role="button"> 회원 관리</a></li>

		</ul>
	
		<span  Style="float:right; line-height:50px">홍길동[관리자]님 안녕하세요. </span>
		<img Style="float:right" src="../images/admin.PNG" width="50" height="50">
		
		</div>
		


</body>