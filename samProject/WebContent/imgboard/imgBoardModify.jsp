<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon2.jsp" %>

<%
String admin = (String) session.getAttribute("adminConfirm"); 
String unq = request.getParameter("unq");

String Domain  ="http://localhost:8080/myProject2";   
String RealPath = "c:/workspace/ezen4team/samProject/WebContent/smart/upload";

if( admin == null && "".equals(admin) ) {
%>
	<script>
	alert("잘못된 경로입니다");
	location = "../main/home.jsp";
	</script>
<% 	

}

String sql = " SELECT title,content,imgname1,imgpath1,imgtitle,imgcontent "
		   + " FROM imgboard "
		   + " WHERE unq = '"+unq+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();


String title = rs.getString("title");
String content = rs.getString("content");
String imgname1 = rs.getString("imgname1");
String imgpath1 = rs.getString("imgpath1");
String imgtitle = rs.getString("imgtitle");
String imgcontent = rs.getString("imgcontent");

content = content.replaceAll("\\\"","\\\\\""); 

String img = Domain + imgpath1 + "/" + imgname1; /* 이미지 주소 */
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
</head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <link rel="stylesheet" href="../css/menu_footer.css">

<script type="text/javascript" src="../smart/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>



<script>

function fn_WriteInsert() {
	
	var f = document.frm;
	
	if( f.title.value=="" ){
		alert("제목를 입력해주세요.");
		f.title.focus();
		return false;  // 자바스크립트 중단!
	}
	
	f.content.value =  oEditors.getById["ir1"].getIR();
	f.submit();
}

</script>

<body> 

<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;" class="text-info">제품소개</h1>
<br>
<br>
<br>

<form name="frm" method="post" action="imgBoardModifySave.jsp" enctype="Multipart/form-data">
<input type="hidden" name="unq" value="<%=unq%>">
	<div align="center">
	<table style="margin-left:0px;border-collapse: separate;border-spacing:0 10px;">
		<tr>
        	<th class="badge badge-dark" style="font-size:17px;">제목</th>
        </tr>
        <tr>
        	<td><input type="text" name="title" id=title style="width:710px;" value="<%=title%>"></td>
        </tr>
        
        <tr>
        	<th class="badge badge-dark" style="font-size:17px;">이미지 제목</th>
        </tr>
        <tr>
        	<td><input type="text" name="imgtitle" style="width:710px;" value="<%=imgtitle%>"></td>
        </tr>
        
         <tr>
        	<th class="badge badge-dark" style="font-size:17px;">이미지 내용</th>
        </tr>
        <tr>
        	<td><input type="text" name="imgcontent" style="width:710px;" value="<%=imgcontent%>">></td>
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
	      <td>
	      <textarea name="ir1" id="ir1" style="width:700px; height:412px; display:none;"></textarea>
			<textarea id="content" name="content" style="display:none"></textarea>
			</td>
	     </tr>
	     
	</table>
	</div>
	<table style="margin-left:850px;">
	<tr>
		<td><input type="submit" value="수정완료" onClick="fn_WriteInsert(); return false;" style="width:100px;" class="btn btn-outline-info"></td>
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

<script type="text/javascript">
var oEditors = [];
var content = "<%=content %>";

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "../smart/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		oEditors.getById["ir1"].exec("PASTE_HTML", [content]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML(filename) {
	var sHTML = '<img src="<%=request.getContextPath()%>/smart/upload/'+filename+'">';
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

