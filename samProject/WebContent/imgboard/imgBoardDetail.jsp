<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon2.jsp" %>

<%
String admin = (String) session.getAttribute("adminConfirm");

String unq = request.getParameter("unq"); /* imgList 에서 넘어온 unq값 */

String Domain  ="http://localhost:8080/myProject2";   
String RealPath = "D:/eclipse-workspace/ezen4team/samProject/WebContent";


/* 조회수 증가 */
String hitSql = " UPDATE imgboard SET hit = hit+1 "
        + " WHERE unq = '"+Integer.parseInt(unq)+"' ";  
   stmt2.executeUpdate(hitSql); 

   
   
/* imgboard 테이블 데이터 가져오기 */
String imgSql = " SELECT unq,title,content,sdate,hit,imgpath1,imgname1 FROM imgboard "
			  + " WHERE unq='"+unq+"' ";
ResultSet imgRs = stmt.executeQuery(imgSql);
imgRs.next();


String title = imgRs.getString("title");
String content = imgRs.getString("content");
String sdate = imgRs.getString("sdate");
String hit = imgRs.getString("hit");
String imgpath1 = imgRs.getString("imgpath1");
String imgname1 = imgRs.getString("imgname1");

content = content.replaceAll("\\\"","\\\\\""); 
String img = Domain + imgpath1 + "/" + imgname1; /* 이미지 주소 */


%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지게시판 내용</title>
<script src="../lib/jquery-3.4.1.min.js"></script>

<script>
function fn_spread(id){
	var getID = document.getElementById(id); getID.style.display=(getID.style.display=='block') ? 'none' : 'block'; 
	} 
</script>



</head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <link rel="stylesheet" href="../css/menu_footer.css">
  <script type="text/javascript" src="../smart/js/HuskyEZCreator.js" charset="utf-8"></script>
  


<style>

/* 펼치기 버튼 css */
.btn01, .btn02{
padding: 2px 4px 2px 4px; text-align: center; font-weight: 600; line-height: 1.4em; box-shadow: 1px 1px 2px #333; border-radius: 15px;
} 

.btn01{
background-color: #008DFF; color: #333;
} .btn02{background-color: #FF3E00; color: #fff;} 

.example01{
padding: 5px; text-align: center; border: 1px solid #008DFF;
}

</style>

<body> 

<%@ include file = "../include/header.jsp" %>

<section>
<br>
<br>
<h1 style="text-align:center;">제품소개</h1>
<br>
<br>
<br>
	

   <div align="center">
   
   
<table style="margin-right:13px">
         <tr align="left">
               <td class="badge badge-dark" style="font-size:17px;">글쓴이</td>
               <td width="150px" class="td1"><%=title %></td>
               <td class="badge badge-dark" style="font-size:17px;">작성일</td>
               <td width="200px" class="td1"><%=sdate %></td>
               <td class="badge badge-dark" style="font-size:17px;">조회수</td>
               <td width="100px" class="td1"><%=hit %></td>
            </tr>
</table>

<table style="border-collapse: separate; border-spacing: 0 10px;  width:660px;">

   <tr>
      <td class="badge badge-dark" style="font-size:17px;">제목</td>
   </tr>
   
   <tr>
        <td><%=title %></td>
   </tr>
   
   <tr>
      <td class="badge badge-dark" style="font-size:17px;">내용</td>
   </tr>
   
   <tr>
      <td>
			<textarea name="ir1" id="ir1" style="width:650px; height:412px; display:none;" ></textarea>
			<textarea id="content" name="content" style="display:none"></textarea>
	  </td>   
   </tr>

</table>
</div >

<div align="center">
<button class="btn01" onclick="fn_spread('hiddenContent02');">상세이미지</button> 
<div id="hiddenContent02" class="example01" style="display: none; width:650px;"><img src="<%=img %>"></div>
</div>
<br><br>




<%
if (admin == null){
%>

<%
}else if( "Y".equals(admin) ) {
%>
	
	<div align="center">
		<td><input type="submit" value="수정" onClick="location='imgBoardModify.jsp?unq=<%=unq %>'" style="width:100px;" class="btn btn-outline-info"></td>
		<td><input type="button" value="삭제" onClick="location='imgBoardDelete.jsp?unq=<%=unq %>'" style="width:100px;" class="btn btn-outline-info"></td>
	</div>
<%
}
%>


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
