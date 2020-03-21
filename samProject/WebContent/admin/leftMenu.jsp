<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
       <link rel="stylesheet" href="../css/bootstrap.min.css">
      
      <style>
      
ul {
    list-style:none;
    margin:10px;
    padding:10px;
}

li {
    margin: 10px 0px;
    padding: 0 0 0 0;
    border : 0;

}

.font12 {   

font-size:12px; 
}
      </style>
      
<body>
     	
	<div class="container">
	<div class="jumbortron">
		<h3 class="text-center">관리자 화면</h3><br>
		<p class="text-center">회원/상품/게시판관리가 가능한 메뉴가 존재합니다.</p>
		
		<ul>
		<li><a class="btn btn-primary btn-sm" href="cateList.jsp" role="button"> 카테고리 관리</a></li>
		<li><a class="btn btn-primary btn-sm" href="goodsWrite.jsp" role="button"> 게시판 관리</a></li>
		<li><a class="btn btn-primary btn-sm" href="goodsList.jsp" role="button"> 상품목록 관리</a></li>
		<li><a class="btn btn-primary btn-sm" href="cateList.jsp" role="button"> 회원 관리</a></li>

		</ul>
	</div>
	</div>

</body>