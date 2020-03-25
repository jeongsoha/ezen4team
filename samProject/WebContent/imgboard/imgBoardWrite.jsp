<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon2.jsp" %>

<%
String admin = (String) session.getAttribute("adminConfirm"); 
String ctx = request.getContextPath();
if( admin == null && "".equals(admin) ) {
%>
	<script>
	alert("잘못된 경로입니다");
	location = "../main/main.jsp";
	</script>
<% 	

}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <link rel="stylesheet" href="../css/menu_footer.css">

<script type="text/javascript" src="<%=ctx %>/demo/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=ctx %>/demo/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["content"].exec("PASTE_HTML", ["내용을 입력해주세요"]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>

<script>

function fn_WriteInsert() {
	
	var f = document.frm;
	
	if( f.title.value=="" ){
		alert("제목를 입력해주세요.");
		f.title.focus();
		return false;  // 자바스크립트 중단!
	}
	
    var elClickedObj = $("#form");
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    oEditors.getById["title"].exec("UPDATE_CONTENTS_FIELD", []);
    var ir1 = $("#content").val();
    
    if( content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
         alert("내용을 입력하세요.");
         oEditors.getById["content"].exec("FOCUS"); //포커싱
         return;
    }
    
    

    try {
        elClickedObj.submit();
    } catch(e) {}
}

</script>

<body> 

<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;">제품소개</h1>
<br>
<br>
<br>

<form name="frm" method="post" action="imgBoardWriteSave.jsp" enctype="Multipart/form-data">
	<div align="center">
	<table style="margin-left:0px;border-collapse: separate;border-spacing:0 10px;">
		<tr>
        	<th class="badge badge-dark" style="font-size:17px;">제목</th>
        </tr>
        <tr>
        	<td><input type="text" name="title" id=title style="width:710px;"></td>
        </tr>
         
         <tr>
         <th class="badge badge-dark" style="font-size:17px;">파일</th>
         </tr>
         
         <tr>
          <td><input type="file" name="imgname"></td>
         </tr>
         
	     <tr>
	        <th class="badge badge-dark" style="font-size:17px;">내용</th>
	     </tr>
	     <tr>
	      <td><textarea name="content" id="content" style="width:700px;height:300px;"></textarea></td>
	     </tr>
	     
	</table>
	</div>
	<table style="margin-left:850px;">
	<tr>
		<td><input type="submit" value="등록" id="save" onClick="fn_WriteInsert(); return false;" style="width:100px;" class="btn btn-outline-info"></td>
		<td><input type="button" value="취소" onClick="location='fBoardList.jsp'" style="width:100px;" class="btn btn-outline-info"></td>
	</tr>
	</table>
</form>



<br>
<br>
<br>
<br>

</section>


<%@ include file = "../include/footer.jsp" %> 
	
</body>
</html>